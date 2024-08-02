import { createBrowserRouter } from "react-router-dom";
import MainPage from "./pages/MainPage";
import ScheduleTable from "./pages/SchedulePage";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <MainPage />,
  },
  {
    path: "/schedule",
    element: <ScheduleTable />,
  }
]);
