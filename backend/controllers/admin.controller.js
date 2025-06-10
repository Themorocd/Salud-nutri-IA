const db = require('../db');
const Usuario = require('../models/usuario.model');
const Rutina = require('../models/rutina.model');
const Dieta = require('../models/dieta.model');

// Usuarios
exports.deleteUser = (req, res) => {//borra un usuario por ID
  const { id } = req.params;
  Usuario.delete(id, (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar usuario' });
    res.json({ message: 'Usuario borrado' });
  });
};

exports.getAllUsers = (req, res) => {// Obtiene todos los usuarios
  Usuario.getAll((err, results) => {
    if (err) return res.status(500).json({ error: 'Hubo un problema con la consulta.' });
    res.json(results);
  });
};

// Rutinas
exports.getRutinas = (req, res) => {// Obtiene todas las rutinas
  Rutina.getAll((err, results) => {
    if (err) return res.status(500).json({ message: 'Error al obtener rutinas' });
    res.json(results);
  });
};

exports.addRutina = (req, res) => {// Agrega una nueva rutina
  const { objetivo, dias_por_semana, tipo_entrenamiento, semana, principios, enfoque } = req.body;
    if (// Verifica que todos los campos estén completos
    !objetivo || objetivo.toString().trim() === '' ||
    !dias_por_semana || dias_por_semana.toString().trim() === '' ||
    !tipo_entrenamiento || tipo_entrenamiento.toString().trim() === '' ||
    !semana || semana.toString().trim() === '' ||
    !principios || principios.toString().trim() === '' ||
    !enfoque || enfoque.toString().trim() === ''
  ) {
    return res.json({ message: 'Debe de rellenar todos los campos' });
  }
  Rutina.create([objetivo, dias_por_semana, tipo_entrenamiento, semana, principios, enfoque], (err) => {
    if (err) return res.status(500).json({ message: 'Error al agregar rutina' });
    res.json({ message: 'Rutina agregada' });
  });
};

exports.deleteRutina = (req, res) => {// Borra una rutina por ID
  const { id } = req.params;
  Rutina.delete(id, (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar rutina' });
    res.json({ message: 'Rutina borrada' });
  });
};

// Dietas
exports.getDietas = (req, res) => {// Obtiene todas las dietas
  Dieta.getAll((err, results) => {
    if (err) return res.status(500).json({ message: 'Error al obtener dietas' });
    res.json(results);
  });
};

exports.addDieta = (req, res) => {// Agrega una nueva dieta
  const { nombre, tipo, alergias, descripcion } = req.body;
    if (!nombre || nombre.trim() === '' ||
      !tipo || tipo.trim() === '' ||
      !descripcion || descripcion.trim() === '') {
    return res.json({ message: 'Debe de rellenar todos los campos' });
  }
  Dieta.create([nombre, tipo, alergias, descripcion], (err) => {
    if (err) return res.status(500).json({ message: 'Error al agregar dieta' });
    res.json({ message: 'Dieta agregada' });
  });
};

exports.deleteDieta = (req, res) => {// Borra una dieta por ID
  const { id } = req.params;
  Dieta.delete(id, (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar dieta' });
    res.json({ message: 'Dieta borrada' });
  });
};

// Objetivos
exports.getObjetivos = (req, res) => {// Obtiene todos los objetivos
  db.query('SELECT * FROM objetivo', (err, results) => {
    if (err) return res.status(500).json({ message: 'Error al obtener objetivos' });
    res.json(results);
  });
};
exports.addObjetivo = (req, res) => {// Agrega un nuevo objetivo
  const { objetivo } = req.body;
    if (!objetivo || objetivo.trim() === '') {
    return res.json({ message: 'Debe de rellenar todos los campos' });
  }
  db.query('INSERT INTO objetivo (objetivo) VALUES (?)', [objetivo], (err) => {
    if (err) return res.status(500).json({ message: 'Error al agregar objetivo' });
    res.json({ message: 'Objetivo agregado' });
  });
};

exports.deleteObjetivo = (req, res) => {// Borra un objetivo por ID
  const { id } = req.params;
  db.query('DELETE FROM objetivo WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar objetivo' });
    res.json({ message: 'Objetivo borrado' });
  });
};

// Alergias
exports.getAlergias = (req, res) => {// Obtiene todas las alergias
  db.query('SELECT * FROM alergias', (err, results) => {
    if (err) return res.status(500).json({ message: 'Error al obtener alergias' });
    res.json(results);
  });
};
exports.addAlergia = (req, res) => {// Agrega una nueva alergia
  const { alergia } = req.body;
    if (!alergia || alergia.trim() === '') {
    return res.json({ message: 'Debe de rellenar todos los campos' });
  }
  db.query('INSERT INTO alergias (alergia) VALUES (?)', [alergia], (err) => {
    if (err) return res.status(500).json({ message: 'Error al agregar alergia' });
    res.json({ message: 'Alergia agregada' });
  });
};

exports.deleteAlergia = (req, res) => {// Borra una alergia por ID
  const { id } = req.params;
  db.query('DELETE FROM alergias WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar alergia' });
    res.json({ message: 'Alergia borrada' });
  });
};


// Tipos de dieta
exports.getTiposDieta = (req, res) => {// Obtiene todos los tipos de dieta
  db.query('SELECT * FROM tipos_dieta', (err, results) => {
    if (err) return res.status(500).json({ message: 'Error al obtener tipos de dieta' });
    res.json(results);
  });
};
exports.addTipoDieta = (req, res) => {// Agrega un nuevo tipo de dieta
  const { tipo } = req.body;
    if (!tipo || tipo.trim() === '') {
    return res.json({ message: 'Debe de rellenar todos los campos' });
  }
  db.query('INSERT INTO tipos_dieta (tipo) VALUES (?)', [tipo], (err) => {
    if (err) return res.status(500).json({ message: 'Error al agregar tipo de dieta' });
    res.json({ message: 'Tipo de dieta agregado' });
  });
};
exports.deleteTipoDieta = (req, res) => {// Borra un tipo de dieta por ID
  const { id } = req.params;
  db.query('DELETE FROM tipos_dieta WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ message: 'Error al borrar tipo de dieta' });
    res.json({ message: 'Tipo de dieta borrado' });
  });
};

