from datetime import date

from pydantic import BaseModel, EmailStr, Field


class RegisterIn(BaseModel):
    email: EmailStr
    password: str = Field(min_length=8, max_length=128)


class TokenOut(BaseModel):
    access_token: str
    token_type: str = "bearer"


class TransactionIn(BaseModel):
    amount: float = Field(gt=0)
    kind: str = Field(default="expense", pattern="^(expense|income)$")
    description: str = Field(default="", max_length=255)
    category: str | None = None
    occurred_on: date | None = None


class QuickAddIn(BaseModel):
    text: str = Field(min_length=1, max_length=255)


class CategoryUpdate(BaseModel):
    category: str


class TransactionOut(BaseModel):
    id: int
    kind: str
    amount: float
    description: str
    category: str
    category_source: str
    occurred_on: date
    anomaly: bool = False

    model_config = {"from_attributes": True}
