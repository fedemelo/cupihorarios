import axios from 'axios';

export const axiosInstance = axios.create({
  baseURL: import.meta.env.VITE_BACK_URL
});

export interface AssistantAvailabilityBase {
  assistant_code: number;
  remote_only: boolean;
  time_slot_id: string;
}


export const buildAssistantAvailabilityId = (assistant_code: number, time_slot_id: string) => {
  return `${assistant_code}: ${time_slot_id}`;
}
