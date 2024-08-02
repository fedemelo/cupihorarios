from sqlalchemy import Column, Integer, String, Float, Boolean
from sqlalchemy.orm import relationship
from src.config.db_config import Base


class Assistant(Base):
    """
    Model for the assistants table.
    """
    __tablename__ = "assistants"

    code = Column(Integer, primary_key=True)

    login = Column(String, unique=True, nullable=False)
    first_names = Column(String, nullable=False)
    last_names = Column(String, nullable=False)
    hired_hours = Column(Float, nullable=False)
    is_admin = Column(Boolean, nullable=False)
    nickname = Column(String)

    assistant_availabilities = relationship(
        "AssistantAvailability", back_populates="assistant")
