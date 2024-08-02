import React, { useState } from 'react';
import { Container, Grid, Typography, Box, ToggleButton, ToggleButtonGroup, Button } from '@mui/material';
import { PersonPinCircle, Laptop } from '@mui/icons-material';
import { fetchTimeSlots, TimeSlot } from '../requests/fetchUtils';
import { postAssistantAvailability, Availability } from '../requests/postUtils';

const daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

interface SlotAvailability {
  id: string;
  local: boolean;
  remote: boolean;
}

const ScheduleSelector = () => {
  const [selectedSlots, setSelectedSlots] = useState<SlotAvailability[]>([]);
  const [timeSlots, setTimeSlots] = useState<TimeSlot[]>([]);

  React.useEffect(() => {
    fetchTimeSlots().then((slots) => setTimeSlots(slots));
  }, []);

  const handleButtonGroupChange = (event: React.MouseEvent<HTMLElement>, newSelection: string[], slotId: string) => {
    setSelectedSlots((prev) => {
      const existingSlot = prev.find((slot) => slot.id === slotId);
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

  const getTimeSlotLabel = (slot: any) => {
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
      const timeSlotLabel = timeSlot ? `${timeSlot.day}, ${getTimeSlotLabel(timeSlot)}` : '';
      return slot.local || slot.remote
        ? [{ assistant_code: 202021525, remote_only: !slot.local, time_slot_id: timeSlotLabel }]
        : [];
    });

    postAssistantAvailability(availabilities);
  };

  return (
    <Container>
      <Typography variant="h4" gutterBottom>
        Selecciona tu disponibilidad
      </Typography>
      <Grid container spacing={1}>
        <Grid item xs={2}>
          <Box>
            <Typography variant="h6">Time</Typography>
            {uniqueTimes.map((time, index) => (
              <Box key={index} sx={{ height: '50px', display: 'flex', alignItems: 'center' }}>
                <Typography>{time}</Typography>
              </Box>
            ))}
          </Box>
        </Grid>
        {daysOfWeek.map((day) => (
          <Grid item xs key={day}>
            <Box>
              <Typography variant="h6">{day}</Typography>
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
                        <ToggleButton value="local" aria-label="local availability">
                          <PersonPinCircle />
                        </ToggleButton>
                        <ToggleButton value="remote" aria-label="remote availability">
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
      <Box sx={{ marginTop: 2 }}>
        <Button variant="contained" color="primary" onClick={handleSave}>
          Save
        </Button>
      </Box>
    </Container>
  );
};

export default ScheduleSelector;
