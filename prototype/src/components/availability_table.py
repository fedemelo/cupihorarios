import streamlit as st
from utils import fetch_availability, fetch_time_slots, format_schedule_start_time


def initialize_session_state():
    if 'selected_assistant' not in st.session_state:
        st.session_state.selected_assistant = None
    if 'availability_matrix' not in st.session_state:
        st.session_state.availability_matrix = None


def get_assistant_names(asistentes):
    return [f"{assistant['first_names']} {assistant['last_names']}" for assistant in asistentes]


def select_assistant(asistentes):
    nombres_asistentes = get_assistant_names(asistentes)
    selected_assistant_name = st.selectbox("Selecciona un asistente:", nombres_asistentes)
    selected_assistant = next(
        (asistente for asistente in asistentes if f"{asistente['first_names']} {asistente['last_names']}" == selected_assistant_name), None
    )
    if selected_assistant and st.session_state.selected_assistant != selected_assistant['code']:
        st.session_state.selected_assistant = selected_assistant['code']
        st.session_state.availability_matrix = None  # Force refresh
    return selected_assistant


def initialize_availability_matrix(dias, horarios):
    if 'availability_matrix' not in st.session_state or st.session_state.availability_matrix is None:
        st.session_state.availability_matrix = {day: {hour: [False, False] for hour in horarios} for day in dias}


def update_availability_matrix(selected_assistant, dias, horarios):
    if selected_assistant:
        availability = fetch_availability(selected_assistant['code'])
        time_slots = fetch_time_slots()
        time_slot_map = {slot['id']: slot for slot in time_slots}
        start_times = [format_schedule_start_time(horario) for horario in horarios]
        availability_matrix = {day: {hour: [False, False] for hour in start_times} for day in dias}

        for entry in availability:
            time_slot_id = entry['time_slot']['id']
            day = entry['time_slot']['day']
            start_hour = entry['time_slot']['start_hour']
            is_remote = entry['remote_only']
            slot = time_slot_map.get(time_slot_id, None)
            if slot:
                if not is_remote:
                    availability_matrix[day][str(start_hour)][0] = True
                else:
                    availability_matrix[day][str(start_hour)][1] = True

        st.session_state.availability_matrix = availability_matrix


def render_availability_header(dias, llaves_turno):
    st.markdown(f"<p class='text'><strong>{llaves_turno[0]}:</strong> Presencial, <strong>{llaves_turno[1]}:</strong> Remoto</p>", unsafe_allow_html=True)
    cols = st.columns(len(dias) + 1)
    cols[0].markdown("<div class='custom-table'><strong>Horario</strong></div>", unsafe_allow_html=True)
    for i, day in enumerate(dias):
        cols[i + 1].markdown(f"<div class='custom-table'><strong>{day}</strong></div>", unsafe_allow_html=True)


def render_availability_table(dias, horarios, start_times, selected_times, selected_tab, llaves_turno):
    for index in range(len(horarios)):
        cols = st.columns(len(dias) + 1)
        cols[0].markdown(f"<div class='custom-table'>{horarios[index]}</div>", unsafe_allow_html=True)
        time = start_times[index]
        for i, day in enumerate(dias):
            with cols[i + 1]:
                cols_inner = st.columns(2)
                selected_primary = cols_inner[0].checkbox(llaves_turno[0], value=st.session_state.availability_matrix[day][time][0], key=f"{day}-{time}-{llaves_turno[0]}")
                selected_secondary = cols_inner[1].checkbox(llaves_turno[1], value=st.session_state.availability_matrix[day][time][1], key=f"{day}-{time}-{llaves_turno[1]}")
                selected_times[selected_tab][day][time][llaves_turno[0]] = selected_primary
                selected_times[selected_tab][day][time][llaves_turno[1]] = selected_secondary


def display_availability_table(asistentes, selected_times, dias, horarios, llaves_turno, selected_tab):
    initialize_session_state()
    selected_assistant = select_assistant(asistentes)
    initialize_availability_matrix(dias, horarios)
    update_availability_matrix(selected_assistant, dias, horarios)
    start_times = [format_schedule_start_time(horario) for horario in horarios]
    render_availability_header(dias, llaves_turno)
    render_availability_table(dias, horarios, start_times, selected_times, selected_tab, llaves_turno)
