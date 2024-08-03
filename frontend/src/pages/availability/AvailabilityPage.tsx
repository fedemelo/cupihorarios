import AvailabilitySelector from './AvailabilitySelector';
import PageWrapper from '../PageWrapper';


export default function AvailabilityPage() {
  return (
    <PageWrapper>
      {({ assistantCode, isAdmin, adminView }) => (
        <AvailabilitySelector
          assistantCode={assistantCode}
          isAdmin={isAdmin}
          adminView={adminView}
        />
      )}
    </PageWrapper>
  );
}
