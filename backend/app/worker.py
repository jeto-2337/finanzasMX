"""Subsistema de Retroalimentación: reentrena el categorizador con las correcciones de los usuarios."""
import logging
import time

from sqlalchemy import select

from .ai.categorizer import train
from .db import SessionLocal
from .models import Transaction

logging.basicConfig(level=logging.INFO)
log = logging.getLogger("worker")

INTERVAL_SECONDS = 24 * 60 * 60


def retrain_once() -> None:
    with SessionLocal() as db:
        rows = db.execute(
            select(Transaction.description, Transaction.category).where(
                Transaction.category_source == "user", Transaction.description != ""
            )
        ).all()
    ok = train([(d, c) for d, c in rows])
    log.info("Reentrenamiento: %s (%d muestras)", "ok" if ok else "omitido, faltan datos", len(rows))


if __name__ == "__main__":
    while True:
        try:
            retrain_once()
        except Exception:
            log.exception("Falló el reentrenamiento")
        time.sleep(INTERVAL_SECONDS)
