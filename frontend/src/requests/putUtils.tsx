import { Schedule } from '../types';
import {axiosInstance} from './utils';
import { AssistantAvailabilityBase, buildAssistantAvailabilityId } from './utils';


export const updateAvailability = async (availability: AssistantAvailabilityBase) => {
  try {
    const response = await axiosInstance.put(`/assistant-availability/${buildAssistantAvailabilityId(availability.assistant_code, availability.time_slot_id)}`, availability);
    console.log('Update Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error updating assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
}


export const setOfficialSchedule = async (scheduleId: string): Promise<Schedule | undefined> => {
  try {
    const response = await axiosInstance.put(`/official-schedule/${scheduleId}`);
    return response.data;
  } catch (error: any) {
    console.error('Error setting official schedule:', error.response ? error.response.data : error.message);
    throw error;
  }
}
