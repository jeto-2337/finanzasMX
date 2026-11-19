"""Predicción de gasto y detección de anomalías.

Con pocos datos usa promedios simples; con historial suficiente usa ARIMA (statsmodels).
LSTM queda como mejora futura cuando haya volumen de datos que lo justifique.
"""
from statistics import mean, pstdev


def forecast_next(daily_totals: list[float], horizon: int = 7) -> list[float]:
    """Pronostica el gasto diario de los próximos `horizon` días."""
    if not daily_totals:
        return [0.0] * horizon
    if len(daily_totals) >= 30:
        try:
            from statsmodels.tsa.arima.model import ARIMA

            fit = ARIMA(daily_totals, order=(1, 0, 1)).fit()
            return [max(0.0, float(v)) for v in fit.forecast(horizon)]
        except Exception:
            pass
    window = daily_totals[-14:]
    return [round(mean(window), 2)] * horizon


def is_anomaly(history: list[float], amount: float, z: float = 3.0) -> bool:
    """Marca un gasto inusualmente alto respecto al historial de la misma categoría."""
    if len(history) < 5:
        return False
    sd = pstdev(history)
    if sd == 0:
        return amount > mean(history) * 2
    return (amount - mean(history)) / sd > z
