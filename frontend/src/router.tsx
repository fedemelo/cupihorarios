import { createBrowserRouter } from "react-router-dom";
import AvailabilityPage from "./pages/availability/AvailabilityPage";
import ScheduleTable from "./pages/schedule/SchedulePage";
import Docs from "./pages/Docs";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <AvailabilityPage />,
  },
  {
    path: "/schedule",
    element: <ScheduleTable />,
  },
  {
    path: "/docs",
    element: <Docs />,
  }
]);
