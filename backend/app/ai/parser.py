"""Ingesta en lenguaje natural: "gasté 120 en tacos", "me pagaron 8500 de nómina"."""
import re

_AMOUNT = re.compile(r"\$?\s*(\d{1,3}(?:,\d{3})+|\d+)(?:\.(\d{1,2}))?")
_INCOME_WORDS = ("me pagaron", "cobré", "cobre", "ingreso", "me depositaron", "nómina", "nomina", "gané", "gane", "recibí", "recibi")


def parse_text(text: str) -> dict | None:
    """Devuelve {'amount', 'kind', 'description'} o None si no encuentra un monto."""
    m = _AMOUNT.search(text)
    if not m:
        return None
    whole = m.group(1).replace(",", "")
    amount = float(f"{whole}.{m.group(2) or '0'}")
    if amount <= 0:
        return None

    lowered = text.lower()
    kind = "income" if any(w in lowered for w in _INCOME_WORDS) else "expense"

    # La descripción es el texto sin el monto ni muletillas iniciales.
    desc = (text[: m.start()] + " " + text[m.end():]).strip()
    desc = re.sub(r"^(gast[eé]|pagu[eé]|compr[eé]|me pagaron|cobr[eé])\s+", "", desc, flags=re.I)
    desc = re.sub(r"^(en|de|por|para)\s+", "", desc, flags=re.I)
    desc = re.sub(r"\s+(pesos|mxn)\b", "", desc, flags=re.I).strip(" .,-")
    return {"amount": amount, "kind": kind, "description": desc or text.strip()}
