const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const authUser = require('../Middlewares/Auth/authUser');

const existClient = require('../Middlewares/Exists/existClient');

const validatorClient = require('../Middlewares/Validators/validatorClient');

const clientsCtrl = require('../Controllers/Clients');

router.post('/', limits(8000, 15), authUser, validatorClient, clientsCtrl.addOneClient); // Ajoute un nouveau client, par tout le monde

router.put('/:idClient', limits(8000, 15), existClient, authUser, validatorClient, clientsCtrl.updateOneClient); // Modifie un client, uniquement par l'administrateur

router.get('/:idClient', limits(8000, 15), existClient, authUser, clientsCtrl.getOneClient); // Récupère un client
router.get('/', limits(8000, 15), clientsCtrl.getAllClient); // Récupère tout les clients, par tout le monde

router.delete('/:idClient', limits(8000, 15), existClient, authUser, clientsCtrl.deleteOneClient); // Supprime un client, uniquement par l'administrateur

module.exports = router;