const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());// Permitir solicitudes desde cualquier origen
app.use(express.json({ limit: '10mb' }));// Limitar el tamaño del cuerpo de la solicitud a 10 MB
app.use(express.urlencoded({ limit: '10mb', extended: true }));// Permitir solicitudes con datos codificados en URL

require('./db');

// Montar rutas principales
app.use('/api', require('./routes/auth.routes'));
app.use('/api/admin', require('./routes/admin.routes'));
app.use('/api/usuarios', require('./routes/usuario.routes'));
app.use('/api/rutinas', require('./routes/rutina.routes'));
app.use('/api/dietas', require('./routes/dieta.routes'));
app.use('/api/ia', require('./routes/ia.routes'));

app.get('/', (req, res) => {
  res.send('Servidor funcionando correctamente 🚀');
});

app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});
