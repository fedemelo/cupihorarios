from sqlalchemy import Column, Integer, Enum, UUID
from sqlalchemy.orm import relationship
from src.config.db_config import Base
import uuid


class Day(str, Enum):
    MONDAY = "MONDAY"
    TUESDAY = "TUESDAY"
    WEDNESDAY = "WEDNESDAY"
    THURSDAY = "THURSDAY"
    FRIDAY = "FRIDAY"
    SATURDAY = "SATURDAY"
    SUNDAY = "SUNDAY"


class TimeSlot(Base):
    """
    Model for the time_slots table.
    """
    __tablename__ = "time_slots"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    start_hour = Column(Integer, nullable=False)
    end_hour = Column(Integer, nullable=False)
    day = Column(Enum(Day), nullable=False)

    assistant_availabilities = relationship(
        "AssistantAvailability", back_populates="time_slot")
