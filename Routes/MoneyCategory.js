const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');

const authUser = require('../Middlewares/Auth/authUser');
const existMoneyCategory = require('../Middlewares/Exists/existMoneyCategory');
const validatorMoneyCategory = require('../Middlewares/Validators/validatorMoneyCategory');

const moneyCategoryCtrl = require('../Controllers/MoneyCategory');

router.post('/', limits(8000, 15), authUser, validatorMoneyCategory, moneyCategoryCtrl.addOneCategory); // Ajoute un nouveau produit, uniquement par l'administrateur

router.put('/:idMoneyCategory', limits(8000, 15), existMoneyCategory, authUser, validatorMoneyCategory, moneyCategoryCtrl.updateOneCategory); // Modifie un produit, uniquement par l'administrateur

router.get('/:idMoneyCategory', limits(8000, 15), existMoneyCategory, authUser, moneyCategoryCtrl.getOneCategory); // Récupère un produit
router.get('/', limits(8000, 15), authUser, moneyCategoryCtrl.getAllCategory); // Récupère tout les produits, uniquement par l'administrateur
router.get('/most-popular/enter', limits(8000, 15), authUser, moneyCategoryCtrl.getMostPopularEnterCategory);
router.get('/most-popular/outlet', limits(8000, 15), authUser, moneyCategoryCtrl.getMostPopularOutletCategory);

router.delete('/:idMoneyCategory', limits(8000, 15), existMoneyCategory, authUser, moneyCategoryCtrl.deleteOneCategory); // Supprime un produit, uniquement par l'administrateur

module.exports = router;