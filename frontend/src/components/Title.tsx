import { ReactNode } from 'react';
import { Typography } from '@mui/material';

interface TitleProps {
  children: ReactNode;
}

export default function Title({ children }: TitleProps) {
  return (
    <Typography
      variant="h4"
      sx={{
        fontWeight: 'bold',
        textAlign: 'center',
        color: (theme) => theme.palette.secondary.main,
      }}
    >
      {children}
    </Typography>
  );
}
