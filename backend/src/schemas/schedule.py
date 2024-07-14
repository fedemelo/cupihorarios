from pydantic import BaseModel
from typing import Optional
from uuid import UUID


class ScheduleBase(BaseModel):
    """
    Represents the base schema for a schedule.

    Attributes:
        id (UUID): The schedule's unique identifier.
        name (str): The schedule's name.
        is_official (bool): Indicates if the schedule is official.
    """
    id: UUID
    name: str
    is_official: bool


class ScheduleCreate(ScheduleBase):
    """
    Represents the schema for creating a schedule.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "id": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "name": "Fall 2024 Schedule",
                "is_official": True
            }
        }


class ScheduleUpdate(BaseModel):
    """
    Represents the schema for updating a schedule.

    Attributes:
        name (Optional[str]): The schedule's name.
        is_official (Optional[bool]): Indicates if the schedule is official.
    """
    name: Optional[str] = None
    is_official: Optional[bool] = None

    class Config:
        json_schema_extra = {
            "example": {
                "name": "Spring 2025 Schedule",
                "is_official": False
            }
        }


class ScheduleResponse(ScheduleBase):
    """
    Represents the schema for the response of a schedule.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "id": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "name": "Fall 2024 Schedule",
                "is_official": True
            }
        }
