from sqlalchemy.orm import Session
from src.services.assistant import get_assistants
from typing import List


def get_assistants_codes(db: Session) -> List[int]:
    """
    Gets a list of all assistant codes.
    """
    return [assistant.code for assistant in get_assistants(db)]
