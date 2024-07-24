from pydantic import BaseModel
from uuid import UUID
from typing import Optional


class AssistantAvailabilityBase(BaseModel):
    """
    Represents the base schema for assistant availability.

    Attributes:
        assistant_code (int): The assistant's code.
        time_slot_id (UUID): The time slot's unique identifier.
        remote_only (bool): Indicates if the assistant is available remotely only.
    """
    assistant_code: int
    time_slot_id: UUID
    remote_only: bool


class AssistantAvailabilityCreate(AssistantAvailabilityBase):
    """
    Represents the schema for creating assistant availability.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "assistant_code": 194821525,
                "time_slot_id": "c3bb189e-8bf9-3888-9912-ace4e6543002",
                "remote_only": False
            }
        }


class AssistantAvailabilityUpdate(BaseModel):
    """
    Represents the schema for updating assistant availability.

    Attributes:
        remote_only (Optional[bool]): Indicates if the assistant is available remotely only.
    """
    remote_only: Optional[bool] = None

    class Config:
        json_schema_extra = {
            "example": {
                "remote_only": True
            }
        }


class AssistantAvailabilityResponse(AssistantAvailabilityBase):
    """
    Represents the schema for the response of assistant availability.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "assistant_code": 194821525,
                "time_slot_id": "c3bb189e-8bf9-3888-9912-ace4e6543002",
                "remote_only": False
            }
        }
