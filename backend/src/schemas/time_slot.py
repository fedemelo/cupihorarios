from pydantic import BaseModel
from typing import Optional
from uuid import UUID
from enum import Enum


class Day(str, Enum):
    MONDAY = "MONDAY"
    TUESDAY = "TUESDAY"
    WEDNESDAY = "WEDNESDAY"
    THURSDAY = "THURSDAY"
    FRIDAY = "FRIDAY"
    SATURDAY = "SATURDAY"
    SUNDAY = "SUNDAY"


class TimeSlotBase(BaseModel):
    """
    Represents the base schema for a time slot.

    Attributes:
        id (UUID): The time slot's unique identifier.
        start_hour (int): The start hour of the time slot.
        end_hour (int): The end hour of the time slot.
        day (Day): The day of the time slot.
    """
    id: UUID
    start_hour: int
    end_hour: int
    day: Day


class TimeSlotCreate(TimeSlotBase):
    """
    Represents the schema for creating a time slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "id": "b3bb189e-8bf9-3888-9912-ace4e6543002",
                "start_hour": 900,
                "end_hour": 1100,
                "day": "MONDAY"
            }
        }


class TimeSlotUpdate(BaseModel):
    """
    Represents the schema for updating a time slot.

    Attributes:
        start_hour (Optional[int]): The start hour of the time slot.
        end_hour (Optional[int]): The end hour of the time slot.
        day (Optional[Day]): The day of the time slot.
    """
    start_hour: Optional[int] = None
    end_hour: Optional[int] = None
    day: Optional[Day] = None

    class Config:
        json_schema_extra = {
            "example": {
                "start_hour": 1000,
                "end_hour": 1200,
                "day": "TUESDAY"
            }
        }


class TimeSlotResponse(TimeSlotBase):
    """
    Represents the schema for the response of a time slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "id": "b3bb189e-8bf9-3888-9912-ace4e6543002",
                "start_hour": 900,
                "end_hour": 1100,
                "day": "MONDAY"
            }
        }
