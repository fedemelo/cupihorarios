import { Box } from '@mui/material';
import MenuAppBar from './MenuAppBar';
import NotLoggedIn from './NotLoggedIn';

interface UnauthorizedScreenProps {
  user: any;
  isAdmin: boolean;
}

export default function UnauthorizedScreen({ user, isAdmin }: UnauthorizedScreenProps) {
  return (
    <>
      <MenuAppBar user={user} isAdmin={isAdmin} />
      <Box display={"flex"}>
        <NotLoggedIn />
      </Box>
    </>
  );
}
