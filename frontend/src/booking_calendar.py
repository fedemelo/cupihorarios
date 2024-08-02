from utils.fetch_data import load_local_data, fetch_chosen_schedule, fetch_assistants
from components.option_menu import display_option_menu
from components.schedule_table import display_schedule_table
from components.availability_table import display_availability_table
from utils.hour_standarisation import format_schedule_start_time
import streamlit as st
from os import path

ON_SITE = "P"
REMOTE = "R"

def load_data():
    data = load_local_data(path.join(path.dirname(__file__), 'data', 'data.json'))
    mock_data = load_local_data(path.join(path.dirname(__file__), 'data', 'mock_data.json'))
    return data, mock_data

def initialize_globals(data):
    dias = data["dias"]
    horarios = data["horarios"]
    assistants = fetch_assistants()
    assistants_nicknames = [assistant["nickname"] for assistant in assistants]
    selected_times = {
        "Horario": {day: {format_schedule_start_time(time): ["N", "N"] for time in horarios} for day in dias},
        "Disponibilidad": {day: 
                             {format_schedule_start_time(time): 
                              {ON_SITE: False, REMOTE: False} 
                              for time in horarios}
                           for day in dias}
    }
    return dias, horarios, assistants, assistants_nicknames, selected_times

def load_styles():
    st.markdown("<style>{}</style>".format(open(path.join(path.dirname(__file__), 'style', 'style.css')).read()), unsafe_allow_html=True)

def display_header():
    st.markdown("<h1 class='title'>Cupi-horarios</h1>", unsafe_allow_html=True)

def display_schedule(schedule, horarios, dias):
    display_schedule_table(schedule, horarios, dias)

def display_availability(assistants, selected_times, dias, horarios, llaves_turno, selected_tab):
    display_availability_table(assistants, selected_times, dias, horarios, llaves_turno, selected_tab)

def save_selection(selected_tab, selected_times):
    st.markdown("<div style='text-align: center; margin-top: 20px;'>", unsafe_allow_html=True)
    if st.button("Guardar"):
        st.markdown(f"<h2 class='subtitle'>Seleccionaste las siguientes franjas horarias para {selected_tab}:</h2>", unsafe_allow_html=True)
        if selected_tab == "Horario":
            for day, times in selected_times[selected_tab].items():
                selected_slots = [f"{time}: {', '.join(t)}" for time, t in times.items() if any(x != 'N' for x in t)]
                if selected_slots:
                    st.markdown(f"<p class='text'><strong>{day}:</strong> {', '.join(selected_slots)}</p>", unsafe_allow_html=True)
        elif selected_tab == "Disponibilidad":
            for day, times in selected_times[selected_tab].items():
                for time, modes in times.items():
                    selected_modes = [mode for mode, selected in modes.items() if selected]
                    if selected_modes:
                        st.markdown(f"<p class='text'><strong>{day} - {time}:</strong> {', '.join(selected_modes)}</p>", unsafe_allow_html=True)
    st.markdown("</div>", unsafe_allow_html=True)

def main():
    data, mock_data = load_data()
    dias, horarios, assistants, assistants_nicknames, selected_times = initialize_globals(data)
    load_styles()
    schedule = fetch_chosen_schedule(mock_data)
    display_header()
    selected_tab = display_option_menu()

    llaves_turno = [ON_SITE, REMOTE]
    if selected_tab == "Horario":
        display_schedule(schedule, horarios, dias)
    elif selected_tab == "Disponibilidad":
        display_availability(assistants, selected_times, dias, horarios, llaves_turno, selected_tab)

    save_selection(selected_tab, selected_times)

if __name__ == "__main__":
    main()
