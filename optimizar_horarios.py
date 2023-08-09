"""
Genera la configuración óptima para los horarios de los asistentes.
Bota un TSV que se puede copiar y pegar en el Excel.

Viene con un archivo generador.py, que genera los conjuntos, los parámetros, las variables, casi todo (pero aún no todo). Igual toca meterle la mano al cógigo para el prox semestre.
A ese archivo generador toca meterle los asistentes y su disponibilidad (que se copy-pastea del Excel)

Si los horarios no son los "clásicos" de Bookeau (i.e., de las 8 a las 18, intercalando entre normal y express: 8 a 9, 9 a 10:30, 10:30 a 11:30, etc)
toca cambiar el generador.
También si el Excel de disponibilidad de asistentes no es el de toda la vida, también toca cambiar el generador.
Dicho eso, es evidente que la mantenibilidad está como bajita. Mea culpa, lo monté en una tarde. Hace el trabajo bien mientras no se nos ocurra
cambiar radicalmente los horarios de Cupi o meternos con el formato del Excel de disponibilidad.

Puede que en algún horario ningún asistente pueda o que solo uno pueda, de forma que es imposible tener primario y secundario. Si eso pasa, toca decírselo al modelo.
Abajo está el comentario de cómo se le dice.
"""

from pyomo.environ import (
    ConcreteModel,
    Var,
    Objective,
    Constraint,
    Binary,
)
from pyomo.opt import SolverFactory

m = ConcreteModel()

# Sets
m.horarios = {"Lun, 8:00-9:00", "Lun, 9:00-9:30", "Lun, 9:30-10:30", "Lun, 10:30-11:00", "Lun, 11:00-12:00", "Lun, 12:00-12:30", "Lun, 12:30-13:30", "Lun, 13:30-14:00", "Lun, 14:00-15:00", "Lun, 15:00-15:30", "Lun, 15:30-16:30", "Lun, 16:30-17:00", "Lun, 17:00-18:00",
              "Mar, 8:00-9:00", "Mar, 9:00-9:30", "Mar, 9:30-10:30", "Mar, 10:30-11:00", "Mar, 11:00-12:00", "Mar, 12:00-12:30", "Mar, 12:30-13:30", "Mar, 13:30-14:00", "Mar, 14:00-15:00", "Mar, 15:00-15:30", "Mar, 15:30-16:30", "Mar, 16:30-17:00", "Mar, 17:00-18:00",
              "Mie, 8:00-9:00", "Mie, 9:00-9:30", "Mie, 9:30-10:30", "Mie, 10:30-11:00", "Mie, 11:00-12:00", "Mie, 12:00-12:30", "Mie, 12:30-13:30", "Mie, 13:30-14:00", "Mie, 14:00-15:00", "Mie, 15:00-15:30", "Mie, 15:30-16:30", "Mie, 16:30-17:00", "Mie, 17:00-18:00",
              "Jue, 8:00-9:00", "Jue, 9:00-9:30", "Jue, 9:30-10:30", "Jue, 10:30-11:00", "Jue, 11:00-12:00", "Jue, 12:00-12:30", "Jue, 12:30-13:30", "Jue, 13:30-14:00", "Jue, 14:00-15:00", "Jue, 15:00-15:30", "Jue, 15:30-16:30", "Jue, 16:30-17:00", "Jue, 17:00-18:00",
              "Vie, 8:00-9:00", "Vie, 9:00-9:30", "Vie, 9:30-10:30", "Vie, 10:30-11:00", "Vie, 11:00-12:00", "Vie, 12:00-12:30", "Vie, 12:30-13:30", "Vie, 13:30-14:00", "Vie, 14:00-15:00", "Vie, 15:00-15:30", "Vie, 15:30-16:30", "Vie, 16:30-17:00", "Vie, 17:00-18:00"}

# Parameters
m.peso_horarios = {"Lun, 8:00-9:00": 1, "Lun, 9:00-9:30": 0.5, "Lun, 9:30-10:30": 1, "Lun, 10:30-11:00": 0.5, "Lun, 11:00-12:00": 1, "Lun, 12:00-12:30": 0.5, "Lun, 12:30-13:30": 1, "Lun, 13:30-14:00": 0.5, "Lun, 14:00-15:00": 1, "Lun, 15:00-15:30": 0.5, "Lun, 15:30-16:30": 1, "Lun, 16:30-17:00": 0.5, "Lun, 17:00-18:00": 1,
                   "Mar, 8:00-9:00": 1, "Mar, 9:00-9:30": 0.5, "Mar, 9:30-10:30": 1, "Mar, 10:30-11:00": 0.5, "Mar, 11:00-12:00": 1, "Mar, 12:00-12:30": 0.5, "Mar, 12:30-13:30": 1, "Mar, 13:30-14:00": 0.5, "Mar, 14:00-15:00": 1, "Mar, 15:00-15:30": 0.5, "Mar, 15:30-16:30": 1, "Mar, 16:30-17:00": 0.5, "Mar, 17:00-18:00": 1,
                   "Mie, 8:00-9:00": 1, "Mie, 9:00-9:30": 0.5, "Mie, 9:30-10:30": 1, "Mie, 10:30-11:00": 0.5, "Mie, 11:00-12:00": 1, "Mie, 12:00-12:30": 0.5, "Mie, 12:30-13:30": 1, "Mie, 13:30-14:00": 0.5, "Mie, 14:00-15:00": 1, "Mie, 15:00-15:30": 0.5, "Mie, 15:30-16:30": 1, "Mie, 16:30-17:00": 0.5, "Mie, 17:00-18:00": 1,
                   "Jue, 8:00-9:00": 1, "Jue, 9:00-9:30": 0.5, "Jue, 9:30-10:30": 1, "Jue, 10:30-11:00": 0.5, "Jue, 11:00-12:00": 1, "Jue, 12:00-12:30": 0.5, "Jue, 12:30-13:30": 1, "Jue, 13:30-14:00": 0.5, "Jue, 14:00-15:00": 1, "Jue, 15:00-15:30": 0.5, "Jue, 15:30-16:30": 1, "Jue, 16:30-17:00": 0.5, "Jue, 17:00-18:00": 1,
                   "Vie, 8:00-9:00": 1, "Vie, 9:00-9:30": 0.5, "Vie, 9:30-10:30": 1, "Vie, 10:30-11:00": 0.5, "Vie, 11:00-12:00": 1, "Vie, 12:00-12:30": 0.5, "Vie, 12:30-13:30": 1, "Vie, 13:30-14:00": 0.5, "Vie, 14:00-15:00": 1, "Vie, 15:00-15:30": 0.5, "Vie, 15:30-16:30": 1, "Vie, 16:30-17:00": 0.5, "Vie, 17:00-18:00": 1}

# Disponibilidades
# El generador las genera en disponibilidad.txt
m.dispo_A = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 0,
             'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 1,
             'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
             'Lun, 12:30-13:30': 1, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
             'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
             'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 1,
             'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 1, 'Vie, 15:00-15:30': 1,
             'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 1, 'Vie, 15:30-16:30': 1,
             'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 1, 'Vie, 16:30-17:00': 1,
             'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 1, 'Vie, 17:00-18:00': 0}

m.dispo_E = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
             'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 1, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 1, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 1,
             'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
             'Lun, 12:30-13:30': 1, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
             'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
             'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 1,
             'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 1, 'Vie, 15:00-15:30': 1,
             'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 1, 'Vie, 15:30-16:30': 1,
             'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 1, 'Vie, 16:30-17:00': 1,
             'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 1, 'Vie, 17:00-18:00': 1}

m.dispo_F = {'Lun, 8:00-9:00': 0, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
             'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 1, 'Jue, 11:00-12:00': 1, 'Vie, 11:00-12:00': 0,
             'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 1, 'Vie, 12:00-12:30': 1,
             'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 1, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 1,
             'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 1, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 1, 'Vie, 13:30-14:00': 1,
             'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 1,
             'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 1,
             'Lun, 15:30-16:30': 0, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
             'Lun, 16:30-17:00': 0, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
             'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

m.dispo_M = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
             'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 0, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 1, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 1, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 1, 'Mar, 11:00-12:00': 0, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 1,
             'Lun, 12:00-12:30': 1, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 1,
             'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
             'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
             'Lun, 14:00-15:00': 1, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 0,
             'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 1, 'Mie, 15:00-15:30': 0, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
             'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 1, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
             'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
             'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

m.dispo_N = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 1, 'Mie, 8:00-9:00': 1, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 1,
             'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 1, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 1, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 0, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 1,
             'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 1, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 1,
             'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
             'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
             'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 1, 'Vie, 14:00-15:00': 0,
             'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 1, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
             'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 1, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 0,
             'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 1, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
             'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 1, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}

m.dispo_W = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 1, 'Mie, 8:00-9:00': 0, 'Jue, 8:00-9:00': 0, 'Vie, 8:00-9:00': 0,
             'Lun, 9:00-9:30': 0, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 0, 'Jue, 9:00-9:30': 0, 'Vie, 9:00-9:30': 0,
             'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 1, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 0, 'Vie, 9:30-10:30': 0,
             'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 1, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 0, 'Vie, 10:30-11:00': 0,
             'Lun, 11:00-12:00': 0, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 0,
             'Lun, 12:00-12:30': 0, 'Mar, 12:00-12:30': 1, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 0,
             'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 1, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 1, 'Vie, 12:30-13:30': 0,
             'Lun, 13:30-14:00': 0, 'Mar, 13:30-14:00': 1, 'Mie, 13:30-14:00': 1, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
             'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 1, 'Mie, 14:00-15:00': 1, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 0,
             'Lun, 15:00-15:30': 1, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
             'Lun, 15:30-16:30': 1, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 1, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 1,
             'Lun, 16:30-17:00': 1, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 1, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 1,
             'Lun, 17:00-18:00': 1, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 1, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 1}

m.dispo_Z = {'Lun, 8:00-9:00': 1, 'Mar, 8:00-9:00': 0, 'Mie, 8:00-9:00': 1, 'Jue, 8:00-9:00': 1, 'Vie, 8:00-9:00': 1,
             'Lun, 9:00-9:30': 1, 'Mar, 9:00-9:30': 1, 'Mie, 9:00-9:30': 1, 'Jue, 9:00-9:30': 1, 'Vie, 9:00-9:30': 1,
             'Lun, 9:30-10:30': 0, 'Mar, 9:30-10:30': 0, 'Mie, 9:30-10:30': 0, 'Jue, 9:30-10:30': 1, 'Vie, 9:30-10:30': 1,
             'Lun, 10:30-11:00': 0, 'Mar, 10:30-11:00': 0, 'Mie, 10:30-11:00': 0, 'Jue, 10:30-11:00': 1, 'Vie, 10:30-11:00': 1,
             'Lun, 11:00-12:00': 1, 'Mar, 11:00-12:00': 1, 'Mie, 11:00-12:00': 0, 'Jue, 11:00-12:00': 0, 'Vie, 11:00-12:00': 0,
             'Lun, 12:00-12:30': 1, 'Mar, 12:00-12:30': 0, 'Mie, 12:00-12:30': 0, 'Jue, 12:00-12:30': 0, 'Vie, 12:00-12:30': 0,
             'Lun, 12:30-13:30': 0, 'Mar, 12:30-13:30': 0, 'Mie, 12:30-13:30': 0, 'Jue, 12:30-13:30': 0, 'Vie, 12:30-13:30': 0,
             'Lun, 13:30-14:00': 1, 'Mar, 13:30-14:00': 0, 'Mie, 13:30-14:00': 0, 'Jue, 13:30-14:00': 0, 'Vie, 13:30-14:00': 0,
             'Lun, 14:00-15:00': 0, 'Mar, 14:00-15:00': 0, 'Mie, 14:00-15:00': 0, 'Jue, 14:00-15:00': 0, 'Vie, 14:00-15:00': 0,
             'Lun, 15:00-15:30': 0, 'Mar, 15:00-15:30': 0, 'Mie, 15:00-15:30': 1, 'Jue, 15:00-15:30': 0, 'Vie, 15:00-15:30': 0,
             'Lun, 15:30-16:30': 0, 'Mar, 15:30-16:30': 0, 'Mie, 15:30-16:30': 0, 'Jue, 15:30-16:30': 0, 'Vie, 15:30-16:30': 1,
             'Lun, 16:30-17:00': 0, 'Mar, 16:30-17:00': 0, 'Mie, 16:30-17:00': 0, 'Jue, 16:30-17:00': 0, 'Vie, 16:30-17:00': 0,
             'Lun, 17:00-18:00': 0, 'Mar, 17:00-18:00': 0, 'Mie, 17:00-18:00': 0, 'Jue, 17:00-18:00': 0, 'Vie, 17:00-18:00': 0}


# IMPORTANTE
# Puede que en algún horario ningún asistente pueda o que solo uno pueda, de forma que es imposible tener primario y secundario.
# En ese caso se debe marcar en estos parámetros el horario como si ya estuviese ocupado, para que el modelo no busque algo que no se puede (de lo contrario, el modelo será infactible y pues F)

m.ocupado_primario = {"Lun, 8:00-9:00": 0, "Lun, 9:00-9:30": 0, "Lun, 9:30-10:30": 0, "Lun, 10:30-11:00": 0, "Lun, 11:00-12:00": 0, "Lun, 12:00-12:30": 0, "Lun, 12:30-13:30": 0, "Lun, 13:30-14:00": 0, "Lun, 14:00-15:00": 0, "Lun, 15:00-15:30": 0, "Lun, 15:30-16:30": 0, "Lun, 16:30-17:00": 0, "Lun, 17:00-18:00": 0,
                      "Mar, 8:00-9:00": 0, "Mar, 9:00-9:30": 0, "Mar, 9:30-10:30": 0, "Mar, 10:30-11:00": 0, "Mar, 11:00-12:00": 0, "Mar, 12:00-12:30": 0, "Mar, 12:30-13:30": 0, "Mar, 13:30-14:00": 0, "Mar, 14:00-15:00": 0, "Mar, 15:00-15:30": 0, "Mar, 15:30-16:30": 0, "Mar, 16:30-17:00": 0, "Mar, 17:00-18:00": 0,
                      "Mie, 8:00-9:00": 0, "Mie, 9:00-9:30": 0, "Mie, 9:30-10:30": 1, "Mie, 10:30-11:00": 0, "Mie, 11:00-12:00": 0, "Mie, 12:00-12:30": 0, "Mie, 12:30-13:30": 0, "Mie, 13:30-14:00": 0, "Mie, 14:00-15:00": 0, "Mie, 15:00-15:30": 0, "Mie, 15:30-16:30": 0, "Mie, 16:30-17:00": 0, "Mie, 17:00-18:00": 0,
                      "Jue, 8:00-9:00": 0, "Jue, 9:00-9:30": 0, "Jue, 9:30-10:30": 0, "Jue, 10:30-11:00": 0, "Jue, 11:00-12:00": 0, "Jue, 12:00-12:30": 0, "Jue, 12:30-13:30": 0, "Jue, 13:30-14:00": 0, "Jue, 14:00-15:00": 0, "Jue, 15:00-15:30": 0, "Jue, 15:30-16:30": 0, "Jue, 16:30-17:00": 0, "Jue, 17:00-18:00": 0,
                      "Vie, 8:00-9:00": 0, "Vie, 9:00-9:30": 0, "Vie, 9:30-10:30": 1, "Vie, 10:30-11:00": 0, "Vie, 11:00-12:00": 0, "Vie, 12:00-12:30": 0, "Vie, 12:30-13:30": 0, "Vie, 13:30-14:00": 0, "Vie, 14:00-15:00": 0, "Vie, 15:00-15:30": 0, "Vie, 15:30-16:30": 0, "Vie, 16:30-17:00": 0, "Vie, 17:00-18:00": 0}
m.ocupado_secundario = {"Lun, 8:00-9:00": 0, "Lun, 9:00-9:30": 0, "Lun, 9:30-10:30": 0, "Lun, 10:30-11:00": 0, "Lun, 11:00-12:00": 0, "Lun, 12:00-12:30": 0, "Lun, 12:30-13:30": 0, "Lun, 13:30-14:00": 0, "Lun, 14:00-15:00": 0, "Lun, 15:00-15:30": 0, "Lun, 15:30-16:30": 0, "Lun, 16:30-17:00": 0, "Lun, 17:00-18:00": 0,
                        "Mar, 8:00-9:00": 0, "Mar, 9:00-9:30": 0, "Mar, 9:30-10:30": 0, "Mar, 10:30-11:00": 0, "Mar, 11:00-12:00": 0, "Mar, 12:00-12:30": 0, "Mar, 12:30-13:30": 0, "Mar, 13:30-14:00": 0, "Mar, 14:00-15:00": 0, "Mar, 15:00-15:30": 0, "Mar, 15:30-16:30": 0, "Mar, 16:30-17:00": 0, "Mar, 17:00-18:00": 0,
                        "Mie, 8:00-9:00": 0, "Mie, 9:00-9:30": 1, "Mie, 9:30-10:30": 1, "Mie, 10:30-11:00": 1, "Mie, 11:00-12:00": 0, "Mie, 12:00-12:30": 0, "Mie, 12:30-13:30": 0, "Mie, 13:30-14:00": 0, "Mie, 14:00-15:00": 0, "Mie, 15:00-15:30": 0, "Mie, 15:30-16:30": 0, "Mie, 16:30-17:00": 0, "Mie, 17:00-18:00": 0,
                        "Jue, 8:00-9:00": 0, "Jue, 9:00-9:30": 0, "Jue, 9:30-10:30": 0, "Jue, 10:30-11:00": 0, "Jue, 11:00-12:00": 0, "Jue, 12:00-12:30": 0, "Jue, 12:30-13:30": 0, "Jue, 13:30-14:00": 0, "Jue, 14:00-15:00": 0, "Jue, 15:00-15:30": 0, "Jue, 15:30-16:30": 0, "Jue, 16:30-17:00": 0, "Jue, 17:00-18:00": 0,
                        "Vie, 8:00-9:00": 0, "Vie, 9:00-9:30": 1, "Vie, 9:30-10:30": 1, "Vie, 10:30-11:00": 1, "Vie, 11:00-12:00": 0, "Vie, 12:00-12:30": 0, "Vie, 12:30-13:30": 0, "Vie, 13:30-14:00": 0, "Vie, 14:00-15:00": 0, "Vie, 15:00-15:30": 0, "Vie, 15:30-16:30": 0, "Vie, 16:30-17:00": 0, "Vie, 17:00-18:00": 0}

# Variables
m.primario_A = Var(m.horarios, domain=Binary)
m.secundario_A = Var(m.horarios, domain=Binary)
m.primario_E = Var(m.horarios, domain=Binary)
m.secundario_E = Var(m.horarios, domain=Binary)
m.primario_F = Var(m.horarios, domain=Binary)
m.secundario_F = Var(m.horarios, domain=Binary)
m.primario_M = Var(m.horarios, domain=Binary)
m.secundario_M = Var(m.horarios, domain=Binary)
m.primario_N = Var(m.horarios, domain=Binary)
m.secundario_N = Var(m.horarios, domain=Binary)
m.primario_W = Var(m.horarios, domain=Binary)
m.secundario_W = Var(m.horarios, domain=Binary)
m.primario_Z = Var(m.horarios, domain=Binary)
m.secundario_Z = Var(m.horarios, domain=Binary)


# Objective function
m.obj = Objective(
    expr=sum(
        m.primario_A[h]+m.secundario_A[h]+m.primario_E[h]+m.secundario_E[h]+m.primario_F[h]+m.secundario_F[h]+m.primario_M[h] +
        m.secundario_M[h]+m.primario_N[h]+m.secundario_N[h] +
        m.primario_W[h]+m.secundario_W[h]+m.primario_Z[h]+m.secundario_Z[h]
        for h in m.horarios
    ),
)

# Constraints

# Nadie puede estar de primario y secundario al tiempo
m.A_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_A[h] + m.secundario_A[h] <= 1),
)
m.E_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_E[h] + m.secundario_E[h] <= 1),
)
m.F_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_F[h] + m.secundario_F[h] <= 1),
)
m.M_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_M[h] + m.secundario_M[h] <= 1),
)
m.N_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_N[h] + m.secundario_N[h] <= 1),
)
m.W_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_W[h] + m.secundario_W[h] <= 1),
)
m.Z_no_es_omnipresente = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_Z[h] + m.secundario_Z[h] <= 1),
)


# En cada horario debe haber una persona de primario (ni más ni menos)
m.hay_primario = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_A[h] + m.primario_E[h] + m.primario_F[h] + m.primario_M[h] + m.primario_N[h] +
          m.primario_W[h] + m.primario_Z[h] + m.ocupado_primario[h] == 1)
)


# En cada horario debe haber una persona de secundario (ni más ni menos)
m.hay_secundario = Constraint(
    m.horarios,
    rule=(lambda m, h: m.secundario_A[h] + m.secundario_E[h] + m.secundario_F[h] + m.secundario_M[h] +
          m.secundario_N[h] + m.secundario_W[h] + m.secundario_Z[h] + m.ocupado_secundario[h] == 1)
)


# Solo se asignan horas si el asistente está disponible
m.esta_disponible_A = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_A[h]+m.secundario_A[h] <= m.dispo_A[h])
)
m.esta_disponible_E = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_E[h]+m.secundario_E[h] <= m.dispo_E[h])
)
m.esta_disponible_F = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_F[h]+m.secundario_F[h] <= m.dispo_F[h])
)
m.esta_disponible_M = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_M[h]+m.secundario_M[h] <= m.dispo_M[h])
)
m.esta_disponible_N = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_N[h]+m.secundario_N[h] <= m.dispo_N[h])
)
m.esta_disponible_W = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_W[h]+m.secundario_W[h] <= m.dispo_W[h])
)
m.esta_disponible_Z = Constraint(
    m.horarios,
    rule=(lambda m, h: m.primario_Z[h]+m.secundario_Z[h] <= m.dispo_Z[h])
)


# Respetar los contratos

# Las horas de primario de preg deben sumar 5
m.horas_primario_F = Constraint(
    rule=(lambda m: sum(m.primario_F[h]*m.peso_horarios[h]
          for h in m.horarios) == 5)
)
m.horas_primario_M = Constraint(
    rule=(lambda m: sum(m.primario_M[h]*m.peso_horarios[h]
          for h in m.horarios) == 5)
)
m.horas_primario_N = Constraint(
    rule=(lambda m: sum(m.primario_N[h]*m.peso_horarios[h]
          for h in m.horarios) == 5)
)
m.horas_primario_W = Constraint(
    rule=(lambda m: sum(m.primario_W[h]*m.peso_horarios[h]
          for h in m.horarios) == 5)
)
m.horas_primario_Z = Constraint(
    rule=(lambda m: sum(m.primario_Z[h]*m.peso_horarios[h]
          for h in m.horarios) == 5)
)

# Las horas de secundario de preg deben sumar menos de 5
m.horas_secundario_F = Constraint(
    rule=(lambda m: sum(
        m.secundario_F[h]*m.peso_horarios[h] for h in m.horarios) == 5)
)
m.horas_secundario_M = Constraint(
    rule=(lambda m: sum(
        m.secundario_M[h]*m.peso_horarios[h] for h in m.horarios) == 5)
)
m.horas_secundario_W = Constraint(
    rule=(lambda m: sum(
        m.secundario_W[h]*m.peso_horarios[h] for h in m.horarios) == 5)
)
m.horas_secundario_Z = Constraint(
    rule=(lambda m: sum(
        m.secundario_Z[h]*m.peso_horarios[h] for h in m.horarios) == 5)
)

# Las horas de primario de Nico deben sumar 8
m.horas_primario_N = Constraint(
    rule=(lambda m: sum(m.primario_N[h]*m.peso_horarios[h]
          for h in m.horarios) == 8)
)
# Las horas de secundario de Nico deben sumar 8 o menos
m.horas_secundario_N = Constraint(
    rule=(lambda m: sum(
        m.secundario_N[h]*m.peso_horarios[h] for h in m.horarios) == 6)
)

# Las horas de primario de maestria deben sumar 11
m.horas_primario_A = Constraint(
    rule=(lambda m: sum(m.primario_A[h]*m.peso_horarios[h]
          for h in m.horarios) == 10)
)
m.horas_primario_E = Constraint(
    rule=(lambda m: sum(m.primario_E[h]*m.peso_horarios[h]
          for h in m.horarios) == 10)
)
# Las horas de secundario de maestria deben sumar 10
m.horas_secundario_A = Constraint(
    rule=(lambda m: sum(
        m.secundario_A[h]*m.peso_horarios[h] for h in m.horarios) == 10)
)
m.horas_secundario_E = Constraint(
    rule=(lambda m: sum(
        m.secundario_E[h]*m.peso_horarios[h] for h in m.horarios) == 10)
)

# Solve
SolverFactory("glpk").solve(m, tee=True)


# La mantenibilidad de esta función de abajo tiende a 0, por no decir que es nula.
# La hice pa poder copiar y pegar esto sin asco en el Excel y tener los horarios pa hoy.
def imprimir_solucion_aletosamente() -> None:

    def get_indice_dia(name: str) -> str:
        "primario_F['Jue, 14:00-15:00']"
        dia = name.replace("secundario", "primario")[12:15]
        if name.startswith("primario"):
            return ["Lun", "Mar", "Mie", "Jue", "Vie"].index(dia)*2
        else:
            return ["Lun", "Mar", "Mie", "Jue", "Vie"].index(dia)*2 + 1

    def get_indice_hora(name: str) -> int:
        "primario_F['Jue, 14:00-15:00']"
        name = name.replace("secundario", "primario")
        try:
            valor = int(name[17:19]) + (0.5 if int(name[20:22]) == 30 else 0)
        except ValueError:
            valor = int(name[17:18]) + (0.5 if int(name[19:21]) == 30 else 0)

        match valor:
            case 8:
                return 0
            case 9:
                return 2
            case 9.5:
                return 3
            case 10.5:
                return 5
            case 11:
                return 6
            case 12:
                return 8
            case 12.5:
                return 9
            case 13.5:
                return 11
            case 14:
                return 12
            case 15:
                return 14
            case 15.5:
                return 15
            case 16.5:
                return 17
            case 17:
                return 18

    primarios = [m.primario_A, m.primario_E, m.primario_F,
                 m.primario_M, m.primario_N, m.primario_W, m.primario_Z]
    secundarios = [m.secundario_A, m.secundario_E, m.secundario_F,
                   m.secundario_M, m.secundario_N, m.secundario_W, m.secundario_Z]

    s = ""

    matrix = [["", "", "", "", "", "", "", "", "", ""] for _ in range(20)]
    # matrix[horario][dia(primario/secundario)]

    count_asis = 0
    asis = ['A', 'E', 'F', 'M', 'N', 'W', 'Z']
    for i in primarios+secundarios:
        for a in sorted(i.values(), key=lambda x: x.name):
            s += f"{a.name, a.value}\n"
            if a.value:
                matrix[get_indice_hora(a.name)][get_indice_dia(
                    a.name)] = asis[count_asis]
        s += "\n\n"
        count_asis += 1
        count_asis %= len(asis)

    fhandle = open("horarios.txt", "w")
    fhandle.write(s)
    fhandle.close()

    # Como en el Excel los horarios normales son dos filas, toca duplicarlos: copy-pastearlos abajo. Este ciclo lo hace
    row_num = 0
    while row_num < len(matrix):
        if matrix[row_num] == ["", "", "", "", "", "", "", "", "", ""]:
            matrix[row_num] = matrix[row_num-1]
        row_num += 1

    joined_rows: list[str] = []
    for row_num in matrix:
        joined_rows.append("\t".join(row_num))
    pal_excel: str = "\n".join(joined_rows)

    fhandle = open("horarios_pal_excel.txt", "w")
    fhandle.write(pal_excel)
    fhandle.close()


imprimir_solucion_aletosamente()
