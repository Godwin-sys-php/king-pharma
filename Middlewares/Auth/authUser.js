const jwt = require('jsonwebtoken');
const Users = require('../../Models/Users');

require('dotenv').config();

module.exports = (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ')[1];
    const decodedToken = jwt.verify(token, process.env.TOKEN);

    Users.findOne({ idUser: decodedToken.idUser })
      .then(user => {
        if (user) {
          res.status(400).json({ invalidToken: true, notFoundUser: true });
        } else {
          req.user = user;
          next();
        }
      })
      .catch((error) => {
        res.status(500).json({ error: true, errorMessage: error });
      });
  } catch (error) {
    res.status(500).json({ error: true, errorMessage: error });
  }
};