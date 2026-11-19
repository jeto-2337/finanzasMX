import os

DATABASE_URL = os.environ.get("DATABASE_URL", "sqlite:///./dev.db")
SECRET_KEY = os.environ.get("SECRET_KEY", "dev-only-change-me")
ACCESS_TOKEN_MINUTES = int(os.environ.get("ACCESS_TOKEN_MINUTES", "720"))
