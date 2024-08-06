import AvailabilitySelector from './AvailabilitySelector';
import PageWrapper from '../PageWrapper';


export default function AvailabilityPage() {
  return (
    <PageWrapper>
      {({ assistantCode }) => (
        <AvailabilitySelector
          assistantCode={assistantCode}
        />
      )}
    </PageWrapper>
  );
}
