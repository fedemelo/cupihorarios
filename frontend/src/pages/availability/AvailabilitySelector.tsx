import { useState, useEffect } from 'react';
import { Container, Grid, Typography, Box, Stack, Card, CardContent } from '@mui/material';
import { fetchTimeSlots, fetchAssistantAvailability } from '../../requests/fetchUtils';
import { TimeSlot } from '../../types';
import Title from '../../components/Title';
import ToggleButtonGroupSlot from './ToggleButtonGroupSlot';

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

export default function AvailabilitySelector({ assistantCode, isAdmin, adminView }: AvailabilitySelectorProps) {

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

  const handleSelectionChange = (slotId: string, newSelection: string[]) => {
    setSelectedSlots((prev) => {
      const existingSlot = prev.find((slot) => slot.id === slotId);
      const updatedSlot = existingSlot
        ? {
          ...existingSlot,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        }
        : {
          id: slotId,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        };

      return existingSlot
        ? prev.map((slot) => (slot.id === slotId ? updatedSlot : slot))
        : [...prev, updatedSlot];
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
        <Typography variant="body1" sx={{ textAlign: 'justify' }} component={'div'}>
          Por favor, ingresa tu disponibilidad horaria para todo el semestre. En cada franja horaria, selecciona si tienes disponibilidad tanto presencial como remota o únicamente remota.
          <ul>
            <li>Ten en cuenta que, si en algún horario estás disponible presencialmente, se considera que también tienes disponibilidad remota, pues en ese caso puedes conectarte desde la oficina. Similarmente, si en algún horario no estás disponible remotamente, se presume que tampoco estás disponible presencialmente.</li>
            <li>Intenta seleccionar tanta disponibilidad como tengas. Si entre todos los asistentes no es posible cubrir el mínimo de horas requerido, el modelo de optimización resultará infactible.</li>
            <li>Procura estar seguro de tu disponibilidad antes de seleccionarla. En caso de que debas modificarla después de la generación del horario, será necesario regenerar el horario para todos los asistentes.</li>
          </ul>
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
                            <ToggleButtonGroupSlot
                              assistantCode={assistantCode}
                              slotId={slot.id}
                              selectedSlot={selectedSlot}
                              handleSelectionChange={handleSelectionChange}
                            />
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
}
