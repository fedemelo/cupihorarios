import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import logoSmall from "./../assets/logo_andes.png";
import logo from "./../assets/logo_disc.png";

export default function Banner() {
  return (
    <AppBar position="static" color="secondary">
      <Container maxWidth="xl">
        <Toolbar disableGutters>
          <Typography
            variant="h6"
            noWrap
            component="a"
            href="/"
            sx={{
              mr: 2,
              display: { xs: "none", md: "flex" },
              fontWeight: 600,
              color: "inherit",
              textDecoration: "none",
              "&:hover": {
                color: "white",
                textDecoration: "underline",
              },
            }}
          >
            <img src={logo} alt="logo disc" />
          </Typography>
          <Typography
            variant="h6"
            noWrap
            component="a"
            href="/"
            sx={{
              mr: 2,
              display: { xs: "flex", md: "none" },
              flexGrow: 1,
              fontWeight: 600,
              color: "inherit",
              textDecoration: "none",
              "&:hover": {
                color: "white",
                textDecoration: "underline",
              },
            }}
          >
            <img src={logoSmall} alt="logo disc" />
          </Typography>
        </Toolbar>
      </Container>
    </AppBar>
  );
}
