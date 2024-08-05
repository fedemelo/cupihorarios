import {axiosInstance} from './utils';
import { AssistantAvailabilityBase, buildAssistantAvailabilityId } from './utils';

export const deleteAllAssistantAvailabilities = async (assistant_code: number) => {
  try {
    const response = await axiosInstance.delete(`/assistant-availability/assistant/${assistant_code}`);
    console.log('Delete Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error deleting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
};


export const deleteAvailability = async (availability: AssistantAvailabilityBase) => {
  try {
    const response = await axiosInstance.delete(`/assistant-availability/${buildAssistantAvailabilityId(availability.assistant_code, availability.time_slot_id)}`);
    console.log('Delete Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error deleting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
}


export const deleteSchedule = async (scheduleId: string) => {
  try {
    const response = await axiosInstance.delete(`/schedule/${scheduleId}`);
    console.log('Delete Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error deleting schedule:', error.response ? error.response.data : error.message);
    throw error;
  }
}
