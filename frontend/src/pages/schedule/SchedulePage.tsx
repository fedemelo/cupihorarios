
import ScheduleView from './ScheduleView';
import { Container } from '@mui/material';
import PageWrapper from '../PageWrapper';

export default function SchedulePage() {

  return (
    <PageWrapper>
      {({ assistantCode, isAdmin, adminView }) => (
        <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
          <ScheduleView assistantCode={assistantCode} isAdmin={isAdmin} adminView={adminView}/>
        </Container>
      )}
    </PageWrapper>

  );
}
