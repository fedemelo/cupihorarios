// vite.config.js or vite.config.ts
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';

export default defineConfig({
  optimizeDeps: {
    include: [
      '@emotion/react', 
      '@emotion/styled', 
      '@mui/material/Tooltip'
    ],
  },
  plugins: [
    react({
      jsxImportSource: '@emotion/react',
      babel: {
        plugins: ['@emotion/babel-plugin'],
      },
    }),
  ],
  base: '/',
  server: {
    port: 5173,
  },
});
