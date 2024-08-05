import React, { useState, useEffect } from 'react';
import { Container, Grid, Typography, Box, ToggleButton, ToggleButtonGroup, Stack, Card, CardContent } from '@mui/material';
import { PersonPinCircle, Laptop } from '@mui/icons-material';
import { fetchTimeSlots, fetchAssistantAvailability } from '../../requests/fetchUtils';
import { postAvailability } from '../../requests/postUtils';
import { deleteAvailability } from '../../requests/deleteUtils';
import { updateAvailability } from '../../requests/putUtils';
import { TimeSlot } from '../../types';
import Title from '../../components/Title';

interface SlotAvailability {
  id: string;
  local: boolean;
  remote: boolean;
}

interface AvailabilitySelectorProps {
  assistantCode: number;
  isAdmin: boolean;
  adminView: boolean;
}

const AvailabilitySelector = ({ assistantCode, isAdmin, adminView }: AvailabilitySelectorProps) => {
  const [selectedSlots, setSelectedSlots] = useState<SlotAvailability[]>([]);
  const [timeSlots, setTimeSlots] = useState<TimeSlot[]>([]);

  const dayTranslationMap: { [key: string]: string } = {
    'Monday': 'Lunes',
    'Tuesday': 'Martes',
    'Wednesday': 'Miércoles',
    'Thursday': 'Jueves',
    'Friday': 'Viernes',
  };

  useEffect(() => {
    fetchTimeSlots().then((slots) => setTimeSlots(slots));

    interface AvailabilityData {
      time_slot: {
        id: string;
      };
      remote_only: boolean;
    }

    fetchAssistantAvailability(assistantCode).then((availability: AvailabilityData[]) => {
      const formattedAvailability = availability.map((item: AvailabilityData) => ({
        id: item.time_slot.id,
        local: !item.remote_only,
        remote: true,
      }));
      setSelectedSlots(formattedAvailability);
    });
  }, [assistantCode]);

  const handleButtonGroupChange = async (_event: React.MouseEvent<HTMLElement>, newSelection: string[], slotId: string) => {
    setSelectedSlots((prev) => {
      const existingSlot = prev.find((slot) => slot.id === slotId);
      const localSelected = newSelection.includes('local');
      const remoteSelected = newSelection.includes('remote');

      if (localSelected && !remoteSelected) {  
        // An assistant who is available locally is also available remotely
        newSelection = ['local', 'remote'];
      }
      if (existingSlot && existingSlot.local && existingSlot.remote && !remoteSelected) {
        // An assistant who is not available remotely is also not available locally
        newSelection = [];
      }

      if (existingSlot) {
        const updatedSlot = {
          ...existingSlot,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        };

        if (!existingSlot.local && !existingSlot.remote && (updatedSlot.local || updatedSlot.remote)) {
          // If the assistant was not available at all and now is available in some way, post the availability
          postAvailability({ assistant_code: assistantCode, remote_only: !updatedSlot.local, time_slot_id: slotId });
        } // If the assistant was available in some way and now is not available at all, delete the availability
        else if ((existingSlot.local || existingSlot.remote) && !updatedSlot.local && !updatedSlot.remote) {
          deleteAvailability({ assistant_code: assistantCode, remote_only: !existingSlot.local, time_slot_id: slotId });
        } // In any other case, update the availability
        else {
          updateAvailability({ assistant_code: assistantCode, remote_only: !updatedSlot.local, time_slot_id: slotId });
        }

        return prev.map((slot) =>
          slot.id === slotId ? updatedSlot : slot
        );
      } else {
        const newSlot = {
          id: slotId,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        };
        postAvailability({ assistant_code: assistantCode, remote_only: !newSlot.local, time_slot_id: slotId });

        return [
          ...prev,
          newSlot,
        ];
      }
    });
  };

  const getTimeSlotLabel = (slot: TimeSlot) => {
    return `${slot.start_hour.toString().padStart(4, '0').slice(0, 2)}:${slot.start_hour
      .toString()
      .padStart(4, '0')
      .slice(2)}-${slot.end_hour.toString().padStart(4, '0').slice(0, 2)}:${slot.end_hour
        .toString()
        .padStart(4, '0')
        .slice(2)}`;
  };

  const uniqueTimes = Array.from(new Set(timeSlots.map(getTimeSlotLabel)));

  return (
    <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
      <Stack spacing={1}>
        <Title>
          Disponibilidad
        </Title>
        <Typography variant="body1" sx={{ textAlign: 'justify' }}>
          Por favor, ingresa tu disponibilidad horaria para todo el semestre. En cada franja horaria, selecciona si tienes disponibilidad tanto presencial como remota o únicamente remota.
        </Typography>
        <Card>
          <CardContent sx={{ paddingInline: 4 }} >
            <Grid container spacing={1}>
              <Grid item xs={2}>
                <Box>
                  <Typography variant="h6" sx={{ fontWeight: 'bold', marginBottom: 1 }}>Horario</Typography>
                  {uniqueTimes.map((time, index) => (
                    <Box key={index} sx={{ height: '50px', display: 'flex', alignItems: 'center' }}>
                      <Typography variant="body1">{time}</Typography>
                    </Box>
                  ))}
                </Box>
              </Grid>
              {Object.keys(dayTranslationMap).map((day) => (
                <Grid item xs key={day}>
                  <Box>
                    <Typography variant="h6" sx={{ fontWeight: 'bold', marginBottom: 1 }}>{dayTranslationMap[day]}</Typography>
                    {uniqueTimes.map((time, index) => {
                      const slot = timeSlots.find(
                        (slot) => getTimeSlotLabel(slot) === time && slot.day === day
                      );
                      const selectedSlot = selectedSlots.find((s) => s.id === slot?.id);
                      return (
                        <Box key={index} sx={{ height: '50px', display: 'flex', alignItems: 'center' }}>
                          {slot && (
                            <ToggleButtonGroup
                              value={
                                selectedSlot
                                  ? [
                                    ...(selectedSlot.local ? ['local'] : []),
                                    ...(selectedSlot.remote ? ['remote'] : []),
                                  ]
                                  : []
                              }
                              onChange={(event, newSelection) =>
                                handleButtonGroupChange(event, newSelection, slot.id)
                              }
                              aria-label="availability"
                              sx={{ width: '100%' }}
                            >
                              <ToggleButton
                                value="local"
                                aria-label="local availability"
                                sx={{
                                  backgroundColor: selectedSlot?.local ? '#b8b8ff' : 'transparent',
                                  '&.Mui-selected': {
                                    backgroundColor: (theme) => theme.palette.secondary.main,
                                    color: '#fff'
                                  }
                                }}
                              >
                                <PersonPinCircle />
                              </ToggleButton>
                              <ToggleButton
                                value="remote"
                                aria-label="remote availability"
                                sx={{
                                  backgroundColor: selectedSlot?.remote ? '#b8b8ff' : 'transparent',
                                  '&.Mui-selected': {
                                    backgroundColor: '#465157',
                                    color: '#fff'
                                  }
                                }}
                              >
                                <Laptop />
                              </ToggleButton>
                            </ToggleButtonGroup>
                          )}
                        </Box>
                      );
                    })}
                  </Box>
                </Grid>
              ))}
            </Grid>
          </CardContent>
        </Card>
      </Stack>
    </Container>
  );
};

export default AvailabilitySelector;
