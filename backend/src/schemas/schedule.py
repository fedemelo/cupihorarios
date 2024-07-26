from src.models.schedule import Schedule
from src.schemas.scheduled_slot import ScheduledSlotResponse
from pydantic import BaseModel, model_validator
from src.services.time_slot import DAYS_ORDER
from typing import List, Optional
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
                "name": "2024-20 A",
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
                "name": "2024-20 B",
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
                "name": "2024-20 A",
                "is_official": True
            }
        }


class FullScheduleResponse(ScheduleBase):
    """
    Represents the schema for the response of a full schedule.
    """

    @model_validator(mode="before")
    def sort_scheduled_slots(cls, schedule: Schedule):
        schedule.scheduled_slots = _sort_by_time_slots(
            schedule.scheduled_slots)
        return schedule

    scheduled_slots: List[ScheduledSlotResponse]

    class Config:
        json_schema_extra = {
            "example": {
                "id": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "name": "2024-20 A",
                "is_official": True,
                "scheduled_slots": [
                    {
                        "is_remote": True,
                        "assistant_availability": {
                            "remote_only": False,
                            "assistant": {
                                "code": 194821525,
                                "login": "m.laserna",
                                "first_names": "Mario Alberto",
                                "last_names": "Laserna Pinzón",
                                "nickname": "Marito"
                            },
                            "time_slot": {
                                "id": "b3bb189e-8bf9-3888-9912-ace4e6543002",
                                "start_hour": 900,
                                "end_hour": 1100,
                                "day": "MONDAY"
                            }
                        }
                    }
                ]
            }
        }


def _sort_by_time_slots(scheduled_slots: List[ScheduledSlotResponse]) -> List[ScheduledSlotResponse]:
    return sorted(scheduled_slots, key=lambda slot: (DAYS_ORDER[slot.assistant_availability.time_slot.day.value], slot.assistant_availability.time_slot.start_hour))
