import { createBrowserRouter } from "react-router-dom";
import MainPage from "./pages/MainPage";
import ScheduleTable from "../components/ScheduleTable";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <MainPage />,
  },
  {
    path: "/schedule",
    element: <ScheduleTable />,
  },
]);
