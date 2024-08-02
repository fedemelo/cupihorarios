import { Typography } from "@mui/material";

export const Copyright = function(props: any) {
    return (
      <Typography variant="body2" color="text.secondary" align="center" {...props}>
        {'Copyright © Proyecto Cupi2, '}
        {new Date().getFullYear()}
        {'.'}
      </Typography>
    );
  }
  