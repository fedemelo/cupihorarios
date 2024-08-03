import React from 'react';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';
import Title from '../components/Title';
import PageWrapper from './PageWrapper';

const Docs: React.FC = () => {
  return (
    <PageWrapper>
      {() => (
        <Container>
          <Title>
            Documentación
          </Title>
          <Typography variant="body1" sx={{ textAlign: 'justify' }}>
            Esta aplicación fue creada para facilitar la organización de horarios de asistentes en un entorno de trabajo remoto.
            Para ello, se ha creado una tabla que muestra los horarios de los asistentes y permite filtrarlos por localidad.
          </Typography>
        </Container>
      )}
    </PageWrapper>
  );
};

export default Docs;
