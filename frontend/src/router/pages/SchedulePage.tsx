import { Copyright } from "../../components/Copyright";
import { Box } from "@mui/material";
import MenuAppBar from "../../components/MenuAppBar";
import { useMsal } from "@azure/msal-react";
import { useEffect, useState } from "react";
import { fetchIsAuthorized } from "../../requests/fetchUtils";
import { fetchOfficialSchedule } from "../../requests/fetchUtils";
import LoadingScreen from "../../components/LoadingScreen";
import UnauthorizedScreen from "../../components/UnauthorizedScreen";
import ScheduleTable from "../../components/ScheduleTable";
import { Schedule } from "../../types";

export default function MainPage() {
  const { accounts } = useMsal();
  const assistantLogin = accounts[0].username.split("@")[0];
  const user = accounts[0];

  const [isAuthorized, setIsAuthorized] = useState(false);
  const [loading, setLoading] = useState(true);
  const [isAdmin, setIsAdmin] = useState(false);
  const [assistantCode, setAssistantCode] = useState(0);
  const [schedule, setSchedule] = useState<Schedule>();
  const [adminView, setAdminView] = useState(false);

  useEffect(() => {
    fetchIsAuthorized(assistantLogin, setIsAuthorized, setAssistantCode, setIsAdmin, setLoading);
  }, [assistantLogin]);


  useEffect(() => {
    fetchOfficialSchedule().then((schedule: Schedule) => {
      setSchedule(schedule);
    });
  }, []);


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
        {schedule && <ScheduleTable schedule={schedule} />}
      </Box>
      <Copyright />
    </>
  );
}
