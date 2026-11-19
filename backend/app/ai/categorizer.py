"""Subsistema de Procesamiento (IA): categorización automática.

Arranca con reglas de palabras clave (funciona desde el día 1, sin datos) y, cuando hay
suficientes correcciones del usuario, entrena un modelo TF-IDF + SVM lineal que las complementa.
"""
import pickle
import re
import unicodedata
from pathlib import Path

CATEGORIES = [
    "comida", "transporte", "vivienda", "servicios", "salud",
    "educacion", "entretenimiento", "ropa", "ahorro", "otros",
]

KEYWORDS = {
    "comida": ["taco", "tacos", "tortas", "comida", "super", "supermercado", "mercado", "restaurante", "cafe",
               "café", "pizza", "tienda", "oxxo", "walmart", "soriana", "despensa", "pollo", "carne", "fonda"],
    "transporte": ["gasolina", "uber", "didi", "camion", "camión", "combi", "taxi", "metro", "autobus",
                   "autobús", "caseta", "pasaje", "estacionamiento"],
    "vivienda": ["renta", "hipoteca", "mantenimiento", "predial"],
    "servicios": ["luz", "cfe", "agua", "gas", "internet", "telmex", "telcel", "celular", "netflix", "spotify",
                  "recarga"],
    "salud": ["doctor", "medico", "médico", "farmacia", "medicina", "dentista", "consulta", "hospital"],
    "educacion": ["colegiatura", "libro", "libros", "curso", "inscripcion", "inscripción", "escuela",
                  "papeleria", "papelería", "copias"],
    "entretenimiento": ["cine", "fiesta", "antro", "videojuego", "concierto", "bar", "cerveza", "salida"],
    "ropa": ["ropa", "zapatos", "tenis", "playera", "pantalon", "pantalón", "vestido"],
    "ahorro": ["ahorro", "cetes", "inversion", "inversión", "sofipo"],
}

MODEL_PATH = Path(__file__).with_name("model.pkl")
MIN_SAMPLES = 40  # correcciones del usuario necesarias para entrenar


def _norm(text: str) -> str:
    text = unicodedata.normalize("NFKD", text.lower())
    text = "".join(c for c in text if not unicodedata.combining(c))
    return re.sub(r"[^a-z0-9 ]+", " ", text).strip()


def _rule_based(text: str) -> str | None:
    tokens = set(_norm(text).split())
    best, best_hits = None, 0
    for cat, words in KEYWORDS.items():
        hits = len(tokens & {_norm(w) for w in words})
        if hits > best_hits:
            best, best_hits = cat, hits
    return best


def _load_model():
    if MODEL_PATH.exists():
        try:
            with MODEL_PATH.open("rb") as f:
                return pickle.load(f)  # archivo generado solo por train() en este servidor
        except Exception:
            return None
    return None


def categorize(description: str) -> str:
    rule = _rule_based(description)
    if rule:
        return rule
    model = _load_model()
    if model is not None and description.strip():
        try:
            return str(model.predict([_norm(description)])[0])
        except Exception:
            pass
    return "otros"


def train(samples: list[tuple[str, str]]) -> bool:
    """Entrena con pares (descripción, categoría confirmada por el usuario)."""
    if len(samples) < MIN_SAMPLES or len({c for _, c in samples}) < 2:
        return False
    try:
        from sklearn.feature_extraction.text import TfidfVectorizer
        from sklearn.pipeline import make_pipeline
        from sklearn.svm import LinearSVC
    except ImportError:
        return False
    texts = [_norm(t) for t, _ in samples]
    labels = [c for _, c in samples]
    pipe = make_pipeline(TfidfVectorizer(ngram_range=(1, 2), min_df=1), LinearSVC())
    pipe.fit(texts, labels)
    with MODEL_PATH.open("wb") as f:
        pickle.dump(pipe, f)
    return True
