# CupiHorarios: Optimal Scheduling Application for CupiTaller

CupiHorarios is a full-stack application designed to generate optimal schedules for the assistants of the programming support center, CupiTaller, at the University of the Andes. Leveraging a robust backend built with [FastAPI](https://fastapi.tiangolo.com/) and an intuitive frontend developed using [Streamlit](https://streamlit.io/), CupiHorarios efficiently creates schedules based on the availability and contractual working hours of each assistant.

## Key Features
1. **Assistant Availability**: CupiHorarios allows each assistant to distinctly input their on-site and remote availability, ensuring schedules are convenient and conflict-free.
2. **Proportional Work Hours**: Schedules are generated in alignment with the contractual hours of the assistants, ensuring a proportional distribution of work. This is specially noticeable when comparing graduate and undergraduate assistants, as the latter work approximately half as many hours as the former.
3. **Comprehensive Time Coverage**: Strives to cover all time slots from 8:00 a.m. to 6:00 p.m., Monday to Friday, to provide consistent support throughout the week. 
    - It may happen that, due to the availability of the assistants, it is impossible to generate a schedule that covers all intended time slots. In such cases, the best possible schedule is offered.

CupiHorarios not only simplifies the scheduling process but also ensures optimal utilization of assistant resources, promoting an efficient and well-organized support center.

## Design

Documentation on the design of the CupiHorarios application can be found in the repository's wiki. The following pages are available:

- [User Stories](https://github.com/fedemelo/cupi-horarios/wiki/User-Stories)
- [Backend Design](https://github.com/fedemelo/cupi-horarios/wiki/Backend-Design)


## Local Development Environment Setup

Documentation on how to set up the local development environment for both the CupiHorarios API and the Streamlit frontend can be found in the `README.md` files of the respective directories.