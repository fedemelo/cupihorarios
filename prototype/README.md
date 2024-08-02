# CupiHorarios Frontend

CupiHorarios Frontend is the user interface for the CupiHorarios application, designed to provide an intuitive and interactive experience for generating optimal schedules for the assistants at the University of the Andes' programming support center, CupiTaller. The frontend is built using [Streamlit](https://streamlit.io/), making it easy to use and visually appealing.

## Frontend Local Development Environment Setup

The frontend must be run using [Python 3.11.3](https://www.python.org/downloads/release/python-3113/).

All commands must be run in the `frontend` directory.

1. Create a virtual environment

   ```shell
   python -m venv venv
   ```

2. Activate the virtual environment

   Unix:

   ```shell
   source venv/bin/activate
   ```

   Windows:

   ```batch
   venv\Scripts\activate.bat
   ```

3. Install dependencies

   ```shell
    pip install -r requirements.txt
    ```

4. Run the frontend

    ```shell
    streamlit run src/main.py
    ```

5. Access the frontend
  
    Open a browser and navigate to `http://localhost:8501`.


