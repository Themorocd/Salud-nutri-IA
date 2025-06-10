// middlewares/authMiddleware.js
module.exports = (req, res, next) => {
  console.log('Autenticando...');
  next(); // Continúa con la ejecución
};

