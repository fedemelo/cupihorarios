from src.schemas.assistant import AssistantResponse
from src.schemas.time_slot import TimeSlotResponse
from pydantic import BaseModel
from typing import Optional


class AssistantAvailabilityBase(BaseModel):
    """
    Represents the base schema for assistant availability.

    Attributes:
        assistant_code (int): The assistant's code.
        time_slot_id (str): The time slot's unique identifier.
        remote_only (bool): Indicates if the assistant is available remotely only.
    """
    assistant_code: int
    time_slot_id: str
    remote_only: bool


class AssistantAvailabilityCreate(AssistantAvailabilityBase):
    """
    Represents the schema for creating assistant availability.
    """

    class Config:
        json_schema_extra = {
            "example": {
                "assistant_code": 194821525,
                "time_slot_id": "Thursday, 08:00-09:00",
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


class AssistantAvailabilityResponse(BaseModel):
    """
    Represents the schema for the response of assistant availability with assistant and time slot details.
    """
    remote_only: bool
    assistant: AssistantResponse
    time_slot: TimeSlotResponse

    class Config:
        json_schema_extra = {
            "example": {
                "remote_only": False,
                "assistant": {
                    "code": 194821525,
                    "login": "m.laserna",
                    "first_names": "Mario Alberto",
                    "last_names": "Laserna Pinzón",
                    "nickname": "Marito"
                },
                "time_slot": {
                    "id": "Monday, 09:30-10:00",
                    "start_hour": 930,
                    "end_hour": 1000,
                    "day": "Monday"
                }
            }
        }
