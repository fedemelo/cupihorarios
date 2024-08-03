import streamlit as st
import pandas as pd
from datetime import datetime


def extract_scheduled_slots(schedule):
    return schedule['scheduled_slots']


def create_schedule_rows(scheduled_slots, horarios, dias):
    rows = []
    for i in range(0, len(scheduled_slots), 2):
        entry1 = scheduled_slots[i]
        entry2 = scheduled_slots[i + 1]
        
        assistant1 = entry1['assistant_availability']["assistant"]["nickname"]
        assistant2 = entry2['assistant_availability']["assistant"]["nickname"]
        
        time_slot = horarios[i // 2 % len(horarios)]
        day = dias[i // 2 % len(dias)]
        
        rows.append({
            'Day': day,
            'Time_Slot': time_slot,
            'Presencial': f'P: {assistant1}',
            'Remoto': f'R: {assistant2}',
            'Start_Time': entry1['assistant_availability']['time_slot']['start_hour']
        })
    return rows


def create_schedule_dataframe(rows, dias):
    df = pd.DataFrame(rows)
    df['Day'] = pd.Categorical(df['Day'], categories=dias, ordered=True)
    df.sort_values(by=['Day', 'Time_Slot'], inplace=True)
    df['Combined'] = df['Presencial'] + ' \n ' + df['Remoto']
    df.drop(columns=['Presencial', 'Remoto'], inplace=True)
    return df


def create_pivot_table(df):
    pivot_df = df.pivot(index='Time_Slot', columns='Day', values='Combined')
    return pivot_df


def render_schedule_table(pivot_df):
    st.write("### Schedule Matrix")
    st.dataframe(pivot_df)
    return pivot_df.to_html()


def display_schedule_table(schedule, horarios, dias):
    scheduled_slots = extract_scheduled_slots(schedule)
    rows = create_schedule_rows(scheduled_slots, horarios, dias)
    df = create_schedule_dataframe(rows, dias)
    pivot_df = create_pivot_table(df)
    return render_schedule_table(pivot_df)
