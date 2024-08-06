import { useState, useEffect } from 'react';
import { Schedule, TimeSlot, LocationType } from '../../types';
import { Stack, Typography } from '@mui/material';
import { fetchTimeSlots, fetchOfficialSchedule } from '../../requests/fetchUtils';
import GeneratedSchedulesTable from './GeneratedSchedulesTable';
import OfficialSchedule from './OfficialSchedule';
import Title from '../../components/Title';

interface ScheduleViewProps {
  isAdmin: boolean;
  adminView: boolean;
}

export default function ScheduleView({ isAdmin, adminView }: ScheduleViewProps) {
  const [filters, setFilters] = useState<(LocationType)[]>(['local', 'remote']);
  const [officialSchedule, setOfficialSchedule] = useState<Schedule>();
  const [timeSlots, setTimeSlots] = useState<TimeSlot[]>([]);

  useEffect(() => {
    fetchTimeSlots().then((timeSlots: TimeSlot[]) => {
      setTimeSlots(timeSlots);
    });
  }, []);

  useEffect(() => {
    fetchOfficialSchedule().then((schedule: Schedule | undefined) => {
      setOfficialSchedule(schedule);
    });
  }, []);

  if (!officialSchedule && !adminView) {
    return (
      <Stack spacing={1}>
        <Title>Horario Asistentes 2024-20</Title>
        <Typography variant="h4" align="center" marginBlock={5}>
          Aún faltan asistentes por llenar su disponibilidad. Una vez todos la hayan llenado, se podrá ver el horario oficial.
        </Typography>
      </Stack>
    );
  }

  return (
    <Stack alignItems={'center'} spacing={1}>
      {isAdmin && adminView && <GeneratedSchedulesTable
        isAdmin={isAdmin}
        adminView={adminView}
        officialSchedule={officialSchedule}
        setOfficialSchedule={setOfficialSchedule}
      />}
      {officialSchedule && <OfficialSchedule
        filters={filters}
        setFilters={setFilters}
        timeSlots={timeSlots}
        adminView={adminView}
      />}
    </Stack>
  );
}
