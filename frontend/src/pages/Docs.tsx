import React from 'react';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';
import Title from '../components/Title';
import PageWrapper from './PageWrapper';
import { Stack } from '@mui/material';

const REPO_LINK = 'https://github.com/fedemelo/cupi-horarios';

export default function Docs() {
  return (
    <PageWrapper>
      {() => (
        <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
          <Stack spacing={1}>
            <Title>
              CupiHorarios: ¿Por qué y para qué?
            </Title>
            <Typography variant="body1" sx={{ textAlign: 'justify' }}>
              La presente documentación no es una documentación técnica, sino una explicación de alto nivel de qué factores se contemplan para la generación del horario de asistentes. Si deseas ver la documentación técnica, puedes ver el código fuente en el <a href={REPO_LINK}>repositorio de GitHub</a>. Allí, hay un README general con referencias tanto a la Wiki del repositorio como a READMEs específicos para el <i>frontend</i> y <i>backend</i>.
            </Typography>
            <Typography variant="h5">
              Propósito
            </Typography>
            <Typography variant="body1" sx={{ textAlign: 'justify' }}>
              CupiHorarios se hizo para no tener que conformar el horario de asistentes manualmente. Eso, naturalmente, es un proceso dispendioso y propenso a errores. En particular, es propenso a no respetar la proporcionalidad de horas de contrato de los asistentes. Es decir, usualmente todos los asistentes de pregrado deberían ser asignados más o menos el mismo número de horas, que deben ser aproximadamente la mitad de las horas asignadas a los asistentes graduados (esto porque usualmente los asistentes graduados tienen 23 horas de contrato, en contraste a las 12 de los asistentes de pregrado). Más aún, otrora, no se distinguía entre disponibilidad presencial y remota. CupiHorarios facilita la generación de horarios respetando estas proporciones y distinciones.
            </Typography>
            <Typography variant="h5">
              Utilidad
            </Typography>
            <Typography variant="body1" sx={{ textAlign: 'justify' }} component={'div'}>
              CupiHorarios ofrece las siguientes funcionalidades principales:
              <ul>
                <li><strong>Trabajo híbrido:</strong> CupiHorarios permite que cada asistente ingrese de manera distinta su disponibilidad presencial y remota, contemplándolo a la hora de conformar el horario.</li>
                <li><strong>Horas de Trabajo Proporcionales:</strong> Los horarios se generan con base en las horas contractuales de cada asistente. Se busca una distribución proporcional del trabajo. En particular, CupiHorarios intenta dos cosas:</li>
                <ul>
                  <li>Que cada asistente trabaje más o menos la misma cantidad de horas de forma presencial y remota.</li>
                  <li>Que cada asistente trabaje las horas que proporcionalmente le corresponden por contrato. E.g., si se tienen 6 asistentes de pregrado, 2 de posgrado y CupiTaller está abierto 50 horas a la semana, entonces los asistentes de pregrado deberían trabajar cada uno aproximadamente 5 horas presenciales y las 5 remotas. A los de posgrado les corresponderían alrededor de 10 horas presenciales y las mismas remotas.</li>
                </ul>
                <li><strong>Cobertura de Tiempo Integral:</strong> CupiHorarios intenta cubrir todos los intervalos de tiempo desde las 8:00 a.m. hasta las 6:00 p.m., de lunes a viernes, para que CupiTaller pueda ser lo más accesible posible para los estudiantes.</li>
                <ul>
                  <li>Puede suceder que, debido a la disponibilidad de los asistentes, sea imposible generar un horario que cubra todos los intervalos de tiempo previstos. En tales casos, CupiHorarios ofrece el mejor horario posible.</li>
                </ul>
              </ul>
            </Typography>
            <Typography variant="h5">
              Piloto
            </Typography>
            <Typography variant="body1" sx={{ textAlign: 'justify' }}>
              Esta primera versión de CupiHorarios es de alguna manera un piloto, para ver cómo se comporta el modelo con las nuevas distribuciones de horas y contratos. Si bien se espera que el modelo sea robusto, es posible que haya casos en los que no se pueda generar un horario que cumpla con todas las restricciones. Si ese resulta ser el caso, se trabajará en mejoras al modelo.
            </Typography>
          </Stack>
        </Container>
      )}
    </PageWrapper>
  );
}
