from src.schemas.assistant_availability import AssistantAvailabilityResponse
from pydantic import BaseModel
from typing import Optional
from uuid import UUID


class ScheduledSlotBase(BaseModel):
    """
    Represents the base schema for a scheduled slot.

    Attributes:
        schedule_id (UUID): The schedule's unique identifier.
        assistant_availability_id (UUID): The available slot's unique identifier.
        is_remote (bool): Indicates if the slot is remote.
    """
    schedule_id: UUID
    assistant_availability_id: UUID
    is_remote: bool


class ScheduledSlotCreate(ScheduledSlotBase):
    """
    Represents the schema for creating a scheduled slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "schedule_id": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "assistant_availability_id": "d2bb189e-8bf9-3888-9912-ace4e6543002",
                "is_remote": True
            }
        }


class ScheduledSlotUpdate(BaseModel):
    """
    Represents the schema for updating a scheduled slot.

    Attributes:
        is_remote (Optional[bool]): Indicates if the slot is remote.
    """
    is_remote: Optional[bool] = None

    class Config:
        json_schema_extra = {
            "example": {
                "is_remote": False
            }
        }


class ScheduledSlotResponse(BaseModel):
    """
    Represents the schema for the response of a scheduled slot with 
    the details of the selected assistant availability.
    """
    is_remote: bool
    assistant_availability: AssistantAvailabilityResponse

    class Config:
        json_schema_extra = {
            "example": {
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
                        "day": "Monday"
                    }
                }
            }
        }
