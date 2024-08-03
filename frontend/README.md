# CupiHorarios Frontend

This directory contains the frontend code for CupiHorarios, a scheduling application designed to generate optimal schedules for the assistants of CupiTaller at the University of the Andes. The frontend is built using React and Material-UI, providing an intuitive and responsive user interface for managing and viewing schedules.

## Features

- **Assistant Availability Input**: Allows assistants to enter their on-site and remote availability.
- **Schedule Viewing**: Displays the generated schedules in an easy-to-read table format.
- **Admin View**: Provides additional administrative functionalities for managing the schedules.
- **Authorization**: Uses MSAL (Microsoft Authentication Library) for user authentication and authorization.

##  Local Development Environment Setup

Follow these steps to set up the local development environment for the CupiHorarios frontend.

Ensure you have the following installed:
- [Node.js](https://nodejs.org/) (version 14.x or higher)
- [Yarn](https://yarnpkg.com/)

1. Install dependencies

  ```shell
  yarn install
  ```

2. Start the development server

  ```shell
  yarn dev
  ```

3. Access the application
  
  Open [http://localhost:3000](http://localhost:3000) in your browser to view the application.
