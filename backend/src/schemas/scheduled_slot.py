from pydantic import BaseModel
from typing import Optional
from uuid import UUID


class ScheduledSlotBase(BaseModel):
    """
    Represents the base schema for a scheduled slot.

    Attributes:
        scheduleId (UUID): The schedule's unique identifier.
        assistant_availability_id (UUID): The available slot's unique identifier.
        is_remote (bool): Indicates if the slot is remote.
    """
    scheduleId: UUID
    assistant_availability_id: UUID
    is_remote: bool


class ScheduledSlotCreate(ScheduledSlotBase):
    """
    Represents the schema for creating a scheduled slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "scheduleId": "a3bb189e-8bf9-3888-9912-ace4e6543002",
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


class ScheduledSlotResponse(ScheduledSlotBase):
    """
    Represents the schema for the response of a scheduled slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "scheduleId": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "assistant_availability_id": "d2bb189e-8bf9-3888-9912-ace4e6543002",
                "is_remote": True
            }
        }
