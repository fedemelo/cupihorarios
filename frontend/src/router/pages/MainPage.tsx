import { Copyright } from "../../components/Copyright";
import { Box, CircularProgress, Grid, Typography } from "@mui/material";
import MenuAppBar from "../../components/MenuAppBar";
import { useMsal } from "@azure/msal-react";
import { useEffect, useState } from "react";
import axios from "axios";
import UnauthorizedView from "../../components/UnauthorizedView";
import AvailabilitySelector from "../../components/AvailabilitySelector";

export default function MainPage() {
  const { accounts } = useMsal();
  const tutorLogin = accounts[0].username.split("@")[0];
  // const tutorLogin = "g.zambranoz";
  const user = accounts[0];

  const [isAuthorized, setIsAuthorized] = useState(false);
  const [loading, setLoading] = useState(true);
  const [isAdmin, setIsAdmin] = useState(false);
  const [adminView, setAdminView] = useState(false);

  // useEffect(() => {
  //   const fetchIsAuthorized = async () => {
  //     try {
  //       const response = await axios.get(`${BACKEND_URL}/users/${tutorLogin}`);
  //       if (response.status === 200) {
  //         setIsAuthorized(true);
  //         //Check if is admin
  //         if (response.data.role === "administrator") {
  //           setIsAdmin(true);
  //         }
  //       }
  //     } catch (error) {
  //       console.error(error);
  //     } finally {
  //       setLoading(false);
  //     }
  //   };

  //   fetchIsAuthorized();
  // }, [tutorLogin]);

  // if (loading) {
  //   return (
  //     <>
  //       <MenuAppBar user={user} isAdmin={isAdmin} />
  //       <Box
  //         display={"flex"}
  //         width={"100vw"}
  //         height={"90vh"}
  //         justifyContent={"center"}
  //         alignItems={"center"}
  //       >
  //         <CircularProgress />
  //       </Box>
  //     </>
  //   );
  // }

  // if (!isAuthorized) {
  //   return (
  //     <>
  //       <MenuAppBar user={user} isAdmin={isAdmin} />
  //       <Box display={"flex"}>
  //         <UnauthorizedView />
  //       </Box>
  //     </>
  //   );
  // }

  return (
    <>
      <MenuAppBar user={user} isAdmin={isAdmin} setAdminView={setAdminView} />
      <Box>
        <AvailabilitySelector />
      </Box>
      <Copyright />
    </>
  );
}
