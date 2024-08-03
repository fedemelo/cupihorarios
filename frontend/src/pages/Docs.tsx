import React from 'react';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';
import Title from '../components/Title';
import PageWrapper from './PageWrapper';
import { Stack } from '@mui/material';

const REPO_LINK = 'https://github.com/fedemelo/cupi-horarios';

const Docs: React.FC = () => {
  return (
    <PageWrapper>
      {() => (
        <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
          <Stack  spacing={1}>
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
            CupiHorarios se hizo para no tener que conformar el horario de asistentes manualmente. Eso, naturalmente, es un propenso dispendioso y propenso a errores. En particular, es propenso a no respetar la proporcionalidad de horas de contrato de los asistentes. Es decir, usualmente todos los asistentes de pregrado deberían ser asignados más o menos el mismo número de horas, que deben ser aproximadamente la mitad de las horas asignadas a los asistentes graduados (esto porque usualmente los asistentes graduados tienen 23 horas de contrato, en contraste a las 12 de los asistentes de pregrado). Más aún, otrora, no se distinguía entre disponibilidad presencial y remota. CupiHorarios facilita la generación de horarios respetando estas proporciones y distinciones.
          </Typography>
          <Typography variant="body1" sx={{ textAlign: 'justify' }}>
            En particular, CupiHorarios ofrece las siguientes funcionalidades principales:
            
          </Typography>
          </Stack>
        </Container>
      )}
    </PageWrapper>
  );
};

export default Docs;
