const Clients = require('../../Models/Clients');

module.exports = (req, res, next) => {
  Clients.findOne({ idClient: req.params.idClient })
    .then((client) => {
      req.client = client;
      client ? next() : res.status(400).json({ clientNotFound: true });
    })
    .catch((error) => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};