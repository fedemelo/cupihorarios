import { useEffect, useState } from 'react';
import { Container, Typography } from '@mui/material';
import ScheduleTable from './ScheduleTable';
import { fetchOfficialSchedule } from '../../requests/fetchUtils';
import { Schedule } from '../../types';
import PageWrapper from '../PageWrapper';

export default function SchedulePage() {
  const [schedule, setSchedule] = useState<Schedule>();

  useEffect(() => {
    fetchOfficialSchedule().then((schedule: Schedule) => {
      setSchedule(schedule);
    });
  }, []);

  return (
    <PageWrapper>
      {({ assistantCode, isAdmin, adminView }) => (
        <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
          {schedule ? (
          <ScheduleTable schedule={schedule} assistantCode={assistantCode} isAdmin={isAdmin} adminView={adminView}/>
          ) : (
            <Typography variant="h4" align="center" marginBlock={5}>
              Aún faltan asistentes por llenar su disponibilidad. Una vez todos la hayan llenado, se podrá ver el horario oficial.
            </Typography>
          )}
        </Container>
      )}
    </PageWrapper>

  );
}
