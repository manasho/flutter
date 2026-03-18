/**
*Author: 	DIEGO CASALLAS
*Date:		01/01/2026  
*Description:	Application setup for the API - NODEJS
**/
import express from 'express';
import cors from 'cors';                // <-- 1. Importar cors
import userRoutes from '../routes/user.routes.js';
import userStatusRoutes from '../routes/userStatus.routes.js';
import roleRoutes from '../routes/role.routes.js';
import userApiRoutes from '../routes/apiUser.routes.js';

const app = express();
const NAME_API = '/api_v1';

// Middlewares globales
app.use(cors());                         // <-- 2. Habilitar CORS para TODOS los orígenes
app.use(express.json());                  // Middleware para JSON

// Rutas de la API
app.use(NAME_API, userRoutes);
app.use(NAME_API, userStatusRoutes);
app.use(NAME_API, roleRoutes);
app.use(NAME_API, userApiRoutes);

// Manejo de errores 404
app.use((req, res, next) => {
  res.status(404).json({
    message: 'Endpoint losses 404, not found'
  });
});

export default app;