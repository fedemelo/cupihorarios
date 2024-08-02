import Avatar from "@mui/material/Avatar";
import Box from "@mui/material/Box";
import BlockIcon from "@mui/icons-material/Block";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";

export default function UnauthorizedView() {
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
            No estás autorizado
          </Typography>
          <Box>
            <Typography variant="body1" textAlign="center">
              Contacta a la coordinación de Cupi2 si crees que se trata de un
              error.
            </Typography>
          </Box>
        </Box>
      </Container>
    </>
  );
}
