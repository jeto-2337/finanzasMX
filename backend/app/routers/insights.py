"""Subsistema de Presentación: resumen mensual, pronóstico y nudges."""
from collections import defaultdict
from datetime import date, timedelta

from fastapi import APIRouter, Depends
from sqlalchemy import select
from sqlalchemy.orm import Session

from ..ai.forecast import forecast_next
from ..db import get_db
from ..models import Transaction, User
from ..security import current_user

router = APIRouter(prefix="/api/insights", tags=["insights"])


@router.get("/summary")
def summary(db: Session = Depends(get_db), user: User = Depends(current_user)):
    today = date.today()
    start = today.replace(day=1)
    rows = db.scalars(
        select(Transaction).where(Transaction.user_id == user.id, Transaction.occurred_on >= start)
    ).all()

    income = sum(float(t.amount) for t in rows if t.kind == "income")
    expenses = sum(float(t.amount) for t in rows if t.kind == "expense")
    by_cat: dict[str, float] = defaultdict(float)
    for t in rows:
        if t.kind == "expense":
            by_cat[t.category] += float(t.amount)

    # Pronóstico con los últimos 60 días de gasto diario.
    since = today - timedelta(days=60)
    daily: dict[date, float] = defaultdict(float)
    for t in db.scalars(
        select(Transaction).where(
            Transaction.user_id == user.id, Transaction.kind == "expense", Transaction.occurred_on >= since
        )
    ):
        daily[t.occurred_on] += float(t.amount)
    series = [daily.get(since + timedelta(days=i), 0.0) for i in range(61)]
    next_week = forecast_next(series, 7)

    surplus = income - expenses
    nudges = []
    if income and expenses > income * 0.9:
        nudges.append("Llevas más del 90% de tus ingresos del mes gastado. Revisa tus gastos de la semana.")
    if surplus > 0:
        nudges.append(
            f"Tienes un excedente de ${surplus:,.2f} este mes. "
            "Considera destinarlo a un instrumento formal de renta fija (por ejemplo, Cetes)."
        )

    return {
        "month": start.isoformat(),
        "income": round(income, 2),
        "expenses": round(expenses, 2),
        "surplus": round(surplus, 2),
        "by_category": {k: round(v, 2) for k, v in sorted(by_cat.items(), key=lambda kv: -kv[1])},
        "forecast_next_7_days": [round(v, 2) for v in next_week],
        "nudges": nudges,
    }
