from src.schemas.scheduled_slot import ScheduledSlotResponse
from typing import List, Optional
from pydantic import BaseModel
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
