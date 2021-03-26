const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const authUser = require('../Middlewares/Auth/authUser');
const existProduct = require('../Middlewares/Exists/existProduct');
const validatorProduct = require('../Middlewares/Validators/validatorProduct');

const productsCtrl = require('../Controllers/Products');

router.post('/', limits(8000, 15), authUser, validatorProduct, productsCtrl.addOneProduct); // Ajoute un nouveau produit, uniquement par l'administrateur

router.put('/:idProduct', limits(8000, 15), existProduct, authUser, validatorProduct, productsCtrl.updateOneProduct); // Modifie un produit, uniquement par l'administrateur

router.get('/:idProduct', limits(8000, 15), existProduct, authUser, productsCtrl.getOneProduct); // Récupère un produit
router.get('/', limits(8000, 15), authUser, productsCtrl.getAllProduct); // Récupère tout les produits, uniquement par l'administrateur

router.delete('/:idProduct', limits(8000, 15), existProduct, authUser, productsCtrl.deleteOneProduct); // Supprime un produit, uniquement par l'administrateur

module.exports = router;