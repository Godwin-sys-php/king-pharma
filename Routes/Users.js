const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const existUser = require('../Middlewares/Exists/existUser');
const validatorUser = require('../Middlewares/Validators/validatorUser');
const authUserMostSecure = require('../Middlewares/Auth/authUserMostSecure');

const userCtrl = require('../Controllers/Users');
const authAdmin = require('../Middlewares/Auth/authAdmin');

router.post('/login', limits(5, 15), userCtrl.login); // Connecte un utilisateur, par l'admin uniquement
router.post('/create', limits(5, 15), authAdmin, validatorUser, userCtrl.createOneUser); // Crée un utilisateur, par l'admin uniquement

router.put('/:idUser', limits(5, 15), authAdmin, existUser, validatorUser, userCtrl.updateOneUser); // Crée un utilisateur, par l'admin uniquement

router.get('/', limits(8000, 15), authAdmin, userCtrl.getAllUsers); // Récupère tout les utilisateur, par l'admin uniquement
router.get('/:idUser', limits(8000, 15), existUser, authUserMostSecure, userCtrl.getOneUser); // Récupère un utilisateur, par l'utilisateur lui même

router.delete('/:idUser', limits(8000, 15), existUser, authAdmin, userCtrl.deleteOneUser); // Récupère un utilisateur, par l'utilisateur lui même

module.exports = router;