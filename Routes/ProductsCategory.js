const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const authUser = require('../Middlewares/Auth/authUser');
const existProductsCategory = require('../Middlewares/Exists/existProductsCategory');
const validatorProductsCategory = require('../Middlewares/Validators/validatorProductsCategory');

const productsCategoryCtrl = require('../Controllers/ProductsCategory');
const authAdmin = require('../Middlewares/Auth/authAdmin');

router.post('/', limits(8000, 15), authAdmin, validatorProductsCategory, productsCategoryCtrl.addOneCategory); // Ajoute un nouveau produit, uniquement par l'administrateur

router.put('/:idProductsCategory', limits(8000, 15), existProductsCategory, authAdmin, validatorProductsCategory, productsCategoryCtrl.updateOneCategory); // Modifie un produit, uniquement par l'administrateur

router.get('/:idProductsCategory', limits(8000, 15), existProductsCategory, authUser, productsCategoryCtrl.getOneCategory); // Récupère un produit
router.get('/', limits(8000, 15), authUser, productsCategoryCtrl.getAllCategory); // Récupère tout les produits, uniquement par l'administrateur
router.get('/most-popular/enter', limits(8000, 15), authUser, productsCategoryCtrl.getMostPopularEnterCategory);
router.get('/most-popular/outlet', limits(8000, 15), authUser, productsCategoryCtrl.getMostPopularOutletCategory);

router.delete('/:idProductsCategory', limits(8000, 15), existProductsCategory, authAdmin, productsCategoryCtrl.deleteOneCategory); // Supprime un produit, uniquement par l'administrateur

module.exports = router;