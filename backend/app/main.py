from fastapi import FastAPI

from .db import Base, engine
from .routers import auth, insights, transactions

app = FastAPI(title="FinanzasMX API", docs_url="/api/docs", openapi_url="/api/openapi.json")

# Para el piloto basta create_all. Si el esquema crece, migrar a Alembic.
Base.metadata.create_all(engine)

app.include_router(auth.router)
app.include_router(transactions.router)
app.include_router(insights.router)


@app.get("/api/health")
def health():
    return {"status": "ok"}
