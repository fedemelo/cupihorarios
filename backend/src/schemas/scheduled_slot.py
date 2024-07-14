from pydantic import BaseModel
from typing import Optional
from uuid import UUID


class ScheduledSlotBase(BaseModel):
    """
    Represents the base schema for a scheduled slot.

    Attributes:
        scheduleId (UUID): The schedule's unique identifier.
        assistant_availability_id (UUID): The available slot's unique identifier.
        is_virtual (bool): Indicates if the slot is virtual.
    """
    scheduleId: UUID
    assistant_availability_id: UUID
    is_virtual: bool


class ScheduledSlotCreate(ScheduledSlotBase):
    """
    Represents the schema for creating a scheduled slot.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "scheduleId": "a3bb189e-8bf9-3888-9912-ace4e6543002",
                "assistant_availability_id": "d2bb189e-8bf9-3888-9912-ace4e6543002",
                "is_virtual": True
            }
        }


class ScheduledSlotUpdate(BaseModel):
    """
    Represents the schema for updating a scheduled slot.

    Attributes:
        is_virtual (Optional[bool]): Indicates if the slot is virtual.
    """
    is_virtual: Optional[bool] = None

    class Config:
        json_schema_extra = {
            "example": {
                "is_virtual": False
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
                "is_virtual": True
            }
        }
