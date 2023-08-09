# Instrucciones

Si alguno modifica su disponibilidad, puede re generar el horario sin problema. Acá están los pasos.

1. Desde el Excel de disponibilidad (el de 2023-20 es [este](https://uniandes-my.sharepoint.com/:x:/r/personal/cupitaller_uniandes_edu_co/Documents/CupiTaller/2023-20/Disponibilidad%20asistentes.xlsx?d=w043e63795374456db0efc906c754b6c0&csf=1&web=1&e=6EnCSz)) copiar la disponibilidad. Únicamente copiar las letras, no las horas ni los días.
2. Pegar la disponibilidad en el archivo dispo_mas_reciente_del_excel.txt
3. Ejecutar el generador. Eso escribe los parámetros para el modelo en disponibilidad.txt
4. Copiar esa disponibilidad y pegarla en el modelo de Pyomo, optimizar_horarios.py, en el sitio apropiado (encima de la actual)

5. Esto son cosas para que el modelo no bote infactible. Todo eso, pa este semestre, ya está contemplado, pero el próximo me toca volverlo a mirar.
Puede que en algún horario ningún asistente pueda o que solo uno pueda, de forma que es imposible tener primario y secundario. Si eso pasa, toca decírselo al modelo. En ese caso se debe marcar en los parámetros m.ocupado_primario y m.ocupado_secundario el horario como si ya estuviese ocupado, para que el modelo no busque algo que no se puede (de lo contrario, el modelo será infactible y pues F)

En ese caso, pues van a quedar horarios vacíos, entonces toca mirar las horas. En este momento, los constraints están diseñados para un total de 48 horas de primario (en 2 horarios normales no se dan tutorías) y para 46 horas de secundario (en 2 exprés no hay secundario). Si por ejemplo la disponibilidad da para que todos los horarios tengan primario y secundario, las horas deberían ser 50 y 50 y se deberían cambiar los constraints. Las horas de primario deberían entonces sumar 50.

6. Ejecutar el modelo de Pyomo, optimizar_horarios.py
7. En horarios_pal_excel.txt, queda el horario generado. Se puede copiar y pegar directamente en el Excel (no en la pestaña de Disponibilidad, en la pestaña de Horarios)