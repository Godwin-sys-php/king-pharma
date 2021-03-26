const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const Users = require('../Models/Users');

require('dotenv').config();

exports.login = (req, res) => {
  Users.findOne({ pseudo: req.body.pseudo })
    .then((user) => {
      if (user.length < 1) {
        res.status(404).json({ pseudo: false, password: false });
      } else {
        bcrypt.compare(req.body.password, user.password)
          .then((valid) => {
            if (!valid) {
              res.status(401).json({ pseudo: true, password: false });
            } else {
              res.status(200).json({
                idUser: user[0].idUser,
                token: jwt.sign({ idUser: user.idUser, }, process.env.TOKEN, {
                  expiresIn: "2d",
                })
              });
            }
          })
          .catch(error => {
            console.log(error);
            res.status(500).json({ error: true, errorMessage: error });
          });
      }
    })
    .catch(error => {
      console.log(error);
      res.status(500).json({ error: true, errorMessage: error });
    });
};

exports.getOneUser = (req, res) => {
  Users.findOne({ idUser: req.params.idUser })
    .then(user => {
      res.status(200).json({ find: true, result: {...user, password: null} });
    })
    .catch(error => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};