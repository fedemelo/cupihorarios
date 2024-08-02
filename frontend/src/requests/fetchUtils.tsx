import axios from 'axios';

export interface TimeSlot {
  start_hour: number;
  end_hour: number;
  day: string;
  id: string;
}

const BASE_URL = import.meta.env.VITE_BACK_URL;

export const axiosInstance = axios.create({
  baseURL: BASE_URL,
});

export const fetchTimeSlots = async (): Promise<TimeSlot[]> => {
  try {
    const response = await axiosInstance.get('/time-slot/');
    return response.data;
  } catch (error: any) {
    console.error(`Error fetching time slots: ${error.response ? error.response.status : error.message}`);
    return [];
  }
};

export interface AssistantAvailability {
  time_slot: {
    id: string;
  };
  remote_only: boolean;
}

export const fetchAssistantAvailability = async (assistantCode: number): Promise<AssistantAvailability[]> => {
  try {
    const response = await axiosInstance.get(`/assistant-availability/assistant/${assistantCode}`);
    return response.data;
  } catch (error: any) {
    console.error(`Error fetching assistant availability: ${error.response ? error.response.status : error.message}`);
    return [];
  }
};

export const fetchIsAuthorized = async (assistantLogin: string, setIsAuthorized: (value: boolean) => void, setAssistantCode: (code: number) => void, setIsAdmin: (value: boolean) => void, setLoading: (value: boolean) => void) => {
  try {
    const response = await axiosInstance.get(`/assistant/by_login/${assistantLogin}`);

    if (response.status === 200) {
      setIsAuthorized(true);
      setAssistantCode(response.data.code);

      if (response.data.is_admin) {
        setIsAdmin(true);
      }
    }
  } catch (error: any) {
    console.error(error);
  } finally {
    setLoading(false);
  }
};
