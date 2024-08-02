import React, { useState, useEffect } from 'react';
import { Container, Grid, Typography, Box, ToggleButton, ToggleButtonGroup, Button } from '@mui/material';
import { PersonPinCircle, Laptop } from '@mui/icons-material';
import { fetchTimeSlots } from '../requests/fetchUtils';
import { postAssistantAvailability, Availability } from '../requests/postUtils';
import { fetchAssistantAvailability } from '../requests/fetchUtils';
import { TimeSlot } from '../types';

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

  // Mapping of English days to Spanish days
  const dayTranslationMap: { [key: string]: string } = {
    'Monday': 'Lunes',
    'Tuesday': 'Martes',
    'Wednesday': 'Miércoles',
    'Thursday': 'Jueves',
    'Friday': 'Viernes',
  };

  const themeColor = '#465157'; // Color del título

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

  const handleButtonGroupChange = (_event: React.MouseEvent<HTMLElement>, newSelection: string[], slotId: string) => {
    setSelectedSlots((prev) => {
      const existingSlot = prev.find((slot) => slot.id === slotId);
      const localSelected = newSelection.includes('local');
      const remoteSelected = newSelection.includes('remote');

      if (localSelected && !remoteSelected) {
        newSelection = ['local', 'remote'];
      }

      if (existingSlot && existingSlot.local && existingSlot.remote && !remoteSelected) {
        newSelection = [];
      }

      if (existingSlot) {
        return prev.map((slot) =>
          slot.id === slotId
            ? {
                ...slot,
                local: newSelection.includes('local'),
                remote: newSelection.includes('remote'),
              }
            : slot
        );
      } else {
        return [
          ...prev,
          {
            id: slotId,
            local: newSelection.includes('local'),
            remote: newSelection.includes('remote'),
          },
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

  const handleSave = () => {
    const availabilities: Availability[] = selectedSlots.flatMap((slot) => {
      const timeSlot = timeSlots.find((ts) => ts.id === slot.id);
      const timeSlotLabel = timeSlot ? `${dayTranslationMap[timeSlot.day]}, ${getTimeSlotLabel(timeSlot)}` : '';
      return slot.local || slot.remote
        ? [{ assistant_code: assistantCode, remote_only: !slot.local, time_slot_id: timeSlotLabel }]
        : [];
    });

    postAssistantAvailability(availabilities);
  };

  return (
    <Container>
      <Box sx={{ display: 'flex', justifyContent: 'center', flexDirection: 'column', alignItems: 'center', gap: 1, marginBlock: 2}}>
        <Typography 
          variant="h4" 
          sx={{
            fontWeight: 'bold', 
            textAlign: 'center', 
            color: (theme) => theme.palette.secondary.main, 
          }}
        >
          Disponibilidad
        </Typography>
        <Typography>
          Por favor, ingresa tu disponibilidad horaria para todo el semestre. En cada franja horaria, selecciona si tienes disponibilidad tanto presencial como remota o únicamente remota. Al terminar, asegúrate de pulsar el botón "Guardar" en la parte inferior.
        </Typography>
      </Box>
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
                              backgroundColor: themeColor,
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
      <Box sx={{ display: 'flex', justifyContent: 'center', marginTop: 5, marginBottom: 2 }}>
        <Button variant="contained" color="primary" onClick={handleSave} size='large'>
          Guardar
        </Button>
      </Box>
    </Container>
  );
};

export default AvailabilitySelector;
