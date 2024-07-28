from sqlalchemy import Column, Integer, UUID, Enum as SQLAEnum
from sqlalchemy.orm import relationship
from src.config.db_config import Base
from enum import Enum
from uuid import uuid4


class Day(Enum):
    MONDAY = "Monday"
    TUESDAY = "Tuesday"
    WEDNESDAY = "Wednesday"
    THURSDAY = "Thursday"
    FRIDAY = "Friday"
    SATURDAY = "Saturday"
    SUNDAY = "Sunday"


class TimeSlot(Base):
    """
    Model for the time_slots table.
    """
    __tablename__ = "time_slots"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    start_hour = Column(Integer, nullable=False)
    end_hour = Column(Integer, nullable=False)
    day = Column(SQLAEnum(Day), nullable=False)

    assistant_availabilities = relationship(
        "AssistantAvailability", back_populates="time_slot")

    def __str__(self):
        """E.g.: 'Friday, 16:30-17:00' """
        return f"{self.day.value}, {self.start_hour // 100:02}:{self.start_hour % 100:02}-{self.end_hour // 100:02}:{self.end_hour % 100:02}"
