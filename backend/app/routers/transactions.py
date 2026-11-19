from datetime import date

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select
from sqlalchemy.orm import Session

from ..ai.categorizer import CATEGORIES, categorize
from ..ai.forecast import is_anomaly
from ..ai.parser import parse_text
from ..db import get_db
from ..models import Transaction, User
from ..schemas import CategoryUpdate, QuickAddIn, TransactionIn, TransactionOut
from ..security import current_user

router = APIRouter(prefix="/api/transactions", tags=["transactions"])


def _to_out(db: Session, tx: Transaction) -> TransactionOut:
    out = TransactionOut.model_validate(tx)
    if tx.kind == "expense":
        history = [
            float(a)
            for a in db.scalars(
                select(Transaction.amount).where(
                    Transaction.user_id == tx.user_id,
                    Transaction.category == tx.category,
                    Transaction.kind == "expense",
                    Transaction.id != tx.id,
                )
            )
        ]
        out.anomaly = is_anomaly(history, float(tx.amount))
    return out


def _create(db: Session, user: User, data: TransactionIn) -> Transaction:
    user_category = data.category in CATEGORIES if data.category else False
    tx = Transaction(
        user_id=user.id,
        kind=data.kind,
        amount=data.amount,
        description=data.description,
        category=data.category if user_category else categorize(data.description),
        category_source="user" if user_category else "auto",
        occurred_on=data.occurred_on or date.today(),
    )
    db.add(tx)
    db.commit()
    return tx


@router.post("", response_model=TransactionOut, status_code=201)
def add(data: TransactionIn, db: Session = Depends(get_db), user: User = Depends(current_user)):
    return _to_out(db, _create(db, user, data))


@router.post("/quick", response_model=TransactionOut, status_code=201)
def quick_add(data: QuickAddIn, db: Session = Depends(get_db), user: User = Depends(current_user)):
    """Captura sin fricción: 'gasté 120 en tacos'."""
    parsed = parse_text(data.text)
    if not parsed:
        raise HTTPException(422, "No encontré un monto en el texto. Ejemplo: 'gasté 120 en tacos'")
    return _to_out(db, _create(db, user, TransactionIn(**parsed)))


@router.get("", response_model=list[TransactionOut])
def list_(limit: int = 50, db: Session = Depends(get_db), user: User = Depends(current_user)):
    rows = db.scalars(
        select(Transaction)
        .where(Transaction.user_id == user.id)
        .order_by(Transaction.occurred_on.desc(), Transaction.id.desc())
        .limit(min(limit, 200))
    )
    return [_to_out(db, t) for t in rows]


@router.patch("/{tx_id}/category", response_model=TransactionOut)
def fix_category(tx_id: int, data: CategoryUpdate, db: Session = Depends(get_db), user: User = Depends(current_user)):
    """Retroalimentación: la corrección del usuario alimenta el reentrenamiento."""
    if data.category not in CATEGORIES:
        raise HTTPException(422, f"Categoría inválida. Usa una de: {', '.join(CATEGORIES)}")
    tx = db.get(Transaction, tx_id)
    if not tx or tx.user_id != user.id:
        raise HTTPException(404, "Movimiento no encontrado")
    tx.category = data.category
    tx.category_source = "user"
    db.commit()
    return _to_out(db, tx)


@router.delete("/{tx_id}", status_code=204)
def delete(tx_id: int, db: Session = Depends(get_db), user: User = Depends(current_user)):
    tx = db.get(Transaction, tx_id)
    if not tx or tx.user_id != user.id:
        raise HTTPException(404, "Movimiento no encontrado")
    db.delete(tx)
    db.commit()
