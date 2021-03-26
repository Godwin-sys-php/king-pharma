const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const existUser = require('../Middlewares/Exists/existUser');
const authUserMostSecure = require('../Middlewares/Auth/authUserMostSecure');

const userCtrl = require('../Controllers/Users');

router.post('/login', limits(5, 15), userCtrl.login); // Connecte un utilisateur

router.get('/:idUser', limits(8000, 15), existUser, authUserMostSecure, userCtrl.getOneUser); // Récupère un utilisateur, uniquement par l'administrateur ou par lui même

module.exports = router;