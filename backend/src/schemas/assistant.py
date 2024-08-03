from pydantic import BaseModel
from typing import Optional


class AssistantBase(BaseModel):
    """
    Represents the base schema for an assistant.

    Attributes:
        code (int): The assistant's code.
        login (str): The assistant's login.
        first_names (str): The assistant's first names.
        last_names (str): The assistant's last names.
        hired_hours (float): The assistant's hired hours.
        is_admin (Optional[bool]): Whether the assistant is an admin or not.
        nickname (Optional[str]): The assistant's nickname.
    """
    code: int
    login: str
    first_names: str
    last_names: str
    hired_hours: float
    is_admin: Optional[bool] = False
    nickname: Optional[str] = None


class AssistantCreate(AssistantBase):
    """
    Represents the schema for creating an assistant.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "code": 194821525,
                "login": "m.laserna",
                "first_names": "Mario Alberto",
                "last_names": "Laserna Pinzón",
                "hired_hours": 12.0,
                "is_admin": False,
                "nickname": "Marito"
            }
        }


class AssistantUpdate(BaseModel):
    """
    Represents the schema for updating an assistant.

    Attributes:
        login (Optional[str]): The assistant's login.
        first_names (Optional[str]): The assistant's first names.
        last_names (Optional[str]): The assistant's last names.
        hired_hours (Optional[float]): The assistant's hired hours.
        is_admin (Optional[bool]): Whether the assistant is an admin or not.
        nickname (Optional[str]): The assistant's nickname.
    """

    login: Optional[str] = None
    first_names: Optional[str] = None
    last_names: Optional[str] = None
    hired_hours: Optional[float] = None
    is_admin: Optional[bool] = None
    nickname: Optional[str] = None

    class Config:
        json_schema_extra = {
            "example": {
                "login": "m.laserna",
                "first_names": "Mario Alberto",
                "last_names": "Laserna Pinzón",
                "nickname": "Marito"
            }
        }


class AssistantResponse(AssistantBase):
    """
    Represents the schema for the response of an assistant.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "code": 194821525,
                "login": "m.laserna",
                "first_names": "Mario Alberto",
                "last_names": "Laserna Pinzón",
                "hired_hours": 12.0,
                "is_admin": False,
                "nickname": "Marito"
            }
        }
