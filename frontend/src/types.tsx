type Assistant = {
  code: number;
  login: string;
  first_names: string;
  last_names: string;
  hired_hours: number;
  is_admin: boolean;
  nickname: string;
};

export type TimeSlot = {
  start_hour: number;
  end_hour: number;
  day: string;
  id: string;
};

type AssistantAvailability = {
  remote_only: boolean;
  assistant: Assistant;
  time_slot: TimeSlot;
};

export type LocationType = 'local' | 'remote';

export type Day = 'Monday' | 'Tuesday' | 'Wednesday' | 'Thursday' | 'Friday';

export type ScheduledSlot = {
  type: LocationType;
  day: Day;
  is_remote: boolean;
  assistant_availability: AssistantAvailability;
};

export type Schedule = {
  name: string;
  id: string;
  is_official: boolean;
  scheduled_slots: ScheduledSlot[];
};

export type ScheduleInfo = {
  name: string;
  id: string;
  is_official: boolean;
}

