import Avatar from "@mui/material/Avatar";
import Box from "@mui/material/Box";
import BlockIcon from "@mui/icons-material/Block";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import { Button } from "@mui/material";

export default function NotLoggedIn() {
  return (
    <>
      <Container maxWidth="xs">
        <Box
          sx={{
            marginTop: 8,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <Avatar sx={{ m: 1, bgcolor: "secondary.main" }}>
            <BlockIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            No has ingresado a la aplicación
          </Typography>
          <Button
            variant="contained"
            disableElevation
            size="large"
            sx={{ mt: 3, mb: 2 }}
            href="/"
          >
            Ingresar
          </Button>
        </Box>
      </Container>
    </>
  );
}
