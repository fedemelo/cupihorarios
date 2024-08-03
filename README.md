# CupiHorarios: Optimal Scheduling Application for CupiTaller

CupiHorarios is a full-stack application designed to generate optimal schedules for the assistants of the programming support center, CupiTaller, at the University of the Andes. Leveraging a robust backend built with [FastAPI](https://fastapi.tiangolo.com/) and an intuitive frontend developed using [React](https://react.dev/), CupiHorarios efficiently creates schedules based on the availability and contractual working hours of each assistant.

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

## Production Environment Setup

### Connection to Virtual Machine

#### Mac

A connection from a Mac machine can be established using Corkscrew. 

1. Install Corkscrew using Brew. 

    ```shell
    brew install corkscrew
    ```

2. Add the following configuration to your `~/.ssh/config` file (create it if it does not exist):

    ```shell
    # Cupi
    Host 157.253.238.85
      ProxyCommand /opt/homebrew/bin/corkscrew connect.virtual.uniandes.edu.co 443 %h %p
    ```

3. connect to the virtual machine using the following command:

    ```shell
    ssh profesor@157.253.238.85
    ```

#### Windows or Linux

To connect from either Windows or Linux, you can use Putty. 

1. Download [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).
   
2. In the initial configuration, which is the session configuration, in the IP field, enter the username and IP address,
    ```shell
    ssh profesor@157.253.238.85
    ```
3. On the right, in the Connection menu, under the Proxy submenu, specify the following:
    
    | Field          | Value                           |
    | -------------- | ------------------------------- |
    | Proxy type     | HTTP                            |
    | Proxy hostname | connect.virtual.uniandes.edu.co |
    | Port           | 443                             |

4. Click the Open button to open the connection.
