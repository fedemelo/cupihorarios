import { Typography } from "@mui/material";

export default function Copyright() {
    return (
      <Typography variant="body2" color="text.secondary" align="center" marginBlockEnd={2}>
        {'Copyright © Proyecto Cupi2, '}
        {new Date().getFullYear()}
        {'.'}
      </Typography>
    );
  }
  