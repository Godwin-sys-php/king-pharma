const Users = require('../../Models/Users');

module.exports = (req, res, next) => {
  Users.findOne({ idUser: req.params.idUser })
    .then((user) => {
      req.searchedUser = user;
      user ? next() : res.status(400).json({ userNotFound: true });
    })
    .catch((error) => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};