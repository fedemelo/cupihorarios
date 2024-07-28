from pydantic import BaseModel
from typing import Optional
from enum import Enum


class Day(str, Enum):
    MONDAY = "Monday"
    TUESDAY = "Tuesday"
    WEDNESDAY = "Wednesday"
    THURSDAY = "Thursday"
    FRIDAY = "Friday"
    SATURDAY = "Saturday"
    SUNDAY = "Sunday"


class TimeSlotBase(BaseModel):
    """
    Represents the base schema for a time slot.

    Attributes:
        start_hour (int): The start hour of the time slot.
        end_hour (int): The end hour of the time slot.
        day (Day): The day of the time slot.
    """
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
                "start_hour": 900,
                "end_hour": 1100,
                "day": "Monday"
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
                "day": "Tuesday"
            }
        }


class TimeSlotResponse(TimeSlotBase):
    """
    Represents the schema for the response of a time slot.
    """
    id: str

    class Config:
        json_schema_extra = {
            "example": {
                "id": "Monday, 09:30-10:00",
                "start_hour": 930,
                "end_hour": 1000,
                "day": "Monday"
            }
        }
