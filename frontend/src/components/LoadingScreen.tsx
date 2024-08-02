import React from 'react';
import { Box, CircularProgress } from '@mui/material';
import MenuAppBar from './MenuAppBar'; // Adjust the import path as needed

interface LoadingScreenProps {
  user: any;
  isAdmin: boolean;
}

export default function LoadingScreen({ user, isAdmin }: LoadingScreenProps) {
  return (
    <>
      <MenuAppBar user={user} isAdmin={isAdmin} />
      <Box
        display={"flex"}
        width={"100vw"}
        height={"90vh"}
        justifyContent={"center"}
        alignItems={"center"}
      >
        <CircularProgress />
      </Box>
    </>
  );
}
