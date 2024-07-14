from src.schemas.assistant import AssistantCreate, AssistantUpdate
from src.models.assistant import Assistant
from sqlalchemy.orm import Session


def create_assistant(db: Session, assistant: AssistantCreate) -> Assistant:
    db_assistant = Assistant(**assistant.model_dump(exclude_none=True))
    db.add(db_assistant)
    db.commit()
    db.refresh(db_assistant)
    return db_assistant


def get_assistant_by_code(db: Session, assistant_code: int) -> Assistant:
    return db.query(Assistant).filter(Assistant.code == assistant_code).first()


def get_assistant_by_login(db: Session, assistant_login: str) -> Assistant:
    return db.query(Assistant).filter(Assistant.login == assistant_login).first()


def get_assistants(db: Session, skip: int = 0, limit: int = 100) -> list[Assistant]:
    return db.query(Assistant).offset(skip).limit(limit).all()


def update_assistant(db: Session, assistant_code: int, assistant: AssistantUpdate) -> Assistant:
    db.query(Assistant).filter(Assistant.code ==
                               assistant_code).update(assistant.model_dump(exclude_none=True))
    db.commit()
    return db.query(Assistant).filter(Assistant.code == assistant_code).first()


def delete_assistant(db: Session, assistant_code: int) -> dict:
    db.query(Assistant).filter(Assistant.code == assistant_code).delete()
    db.commit()
    return {"message": "Assistant deleted successfully"}


def delete_all_assistants(db: Session) -> dict:
    db.query(Assistant).delete()
    db.commit()
    return {"message": "All Assistants deleted successfully"}
