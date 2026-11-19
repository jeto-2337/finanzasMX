# FinanzasMX — esqueleto del sistema

Monolito modular alineado a los 4 subsistemas de la TGS del protocolo.

| Subsistema | Dónde vive |
|---|---|
| Ingesta | `backend/app/routers/transactions.py`, `backend/app/ai/parser.py` |
| Procesamiento (IA) | `backend/app/ai/categorizer.py`, `backend/app/ai/forecast.py` |
| Presentación | `backend/app/routers/insights.py`, `frontend/index.html` |
| Retroalimentación | `PATCH /api/transactions/{id}/category`, `backend/app/worker.py` |

```
Internet → Caddy (HTTPS) ─┬─ /      → frontend/ (estático)
                          └─ /api/* → FastAPI → PostgreSQL
                                      worker (reentrena cada 24 h)
```

## Arranque

```bash
cp .env.example .env
# Edita .env: contraseña de Postgres (y la misma dentro de DATABASE_URL) y SECRET_KEY
docker compose up -d --build
```

- Local: abre `https://localhost` (Caddy usa un certificado interno; el navegador mostrará una advertencia).
- Producción: pon `DOMAIN=tudominio.mx` en `.env`, apunta el DNS a tu servidor y abre los puertos 80 y 443.
  Si estás detrás de CGNAT o IP dinámica, usa DDNS o un túnel (por ejemplo, Cloudflare Tunnel).
- Documentación interactiva de la API: `/api/docs`.

## Qué hace hoy

- Registro e inicio de sesión (Argon2 + JWT).
- Captura rápida en lenguaje natural: `gasté 120 en tacos`, `me pagaron 8500 de nómina`.
- Categorización automática por reglas; cuando hay ≥ 40 correcciones de usuarios, el worker entrena TF-IDF + SVM.
- Resumen mensual, pronóstico de 7 días (promedio móvil; ARIMA con ≥ 30 días de datos) y detección de gastos inusuales.
- Nudges básicos (excedente → renta fija como Cetes).

## Pendiente / siguientes pasos

1. **Respaldos**: `pg_dump` diario a otro disco o a la nube (cron en el host).
2. **Aviso de privacidad** (LFPDPPP) y consentimiento informado para el piloto.
3. **Importar CSV** de estados de cuenta.
4. **Plan Freemium**: el campo `users.plan` ya existe; falta la lógica de límites y cobro.
5. **Migraciones**: pasar de `create_all` a Alembic cuando el esquema cambie.
6. **Pruebas automatizadas** y límite de intentos de login.
7. **LSTM**: solo si hay volumen de datos que lo justifique; ARIMA basta para el piloto.
8. **Instrumentos del pretest/postest** del protocolo: conviene añadir un registro de eventos para medir adherencia.
