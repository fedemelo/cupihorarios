import React, { ReactNode, useEffect, useState } from 'react';
import { Box } from '@mui/material';
import { useMsal } from '@azure/msal-react';
import { fetchIsAuthorized } from '../requests/fetchUtils';
import Copyright from '../components/Copyright';
import MenuAppBar from '../components/MenuAppBar';
import LoadingScreen from '../components/LoadingScreen';
import UnauthorizedScreen from '../components/UnauthorizedScreen';

interface PageWrapperProps {
  children: (props: {
    assistantCode: number;
    isAdmin: boolean;
    adminView: boolean;
    setAdminView: React.Dispatch<React.SetStateAction<boolean>>;
  }) => ReactNode;
}

const PageWrapper: React.FC<PageWrapperProps> = ({ children }) => {
  const assistantLogin = localStorage.getItem('login')?.split('@')[0];
  if (!assistantLogin) {
    window.location.href = '/';
  }

  const [isAuthorized, setIsAuthorized] = useState(false);
  const [loading, setLoading] = useState(true);
  const [isAdmin, setIsAdmin] = useState(false);
  const [assistantCode, setAssistantCode] = useState(0);
  const [adminView, setAdminView] = useState(false);
  const [user, setUser] = useState({ name: "" });

  useEffect(() => {
    fetchIsAuthorized(assistantLogin??"", setIsAuthorized, setAssistantCode, setIsAdmin, setAdminView, setLoading, setUser);
  }, [assistantLogin]);

  if (loading) {
    return <LoadingScreen user={user} isAdmin={isAdmin} />;
  }

  if (!isAuthorized) {
    return <UnauthorizedScreen user={user} isAdmin={isAdmin} />;
  }

  return (
    <>
      <MenuAppBar user={user} isAdmin={isAdmin} setAdminView={setAdminView} />
      <Box>
        {children({ assistantCode, isAdmin, adminView, setAdminView })}
      </Box>
      <Copyright />
    </>
  );
};

export default PageWrapper;
