const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');
const authUser = require('../Middlewares/Auth/authUser');
const existProduct = require('../Middlewares/Exists/existProduct');
const validatorProductTransactions = require('../Middlewares/Validators/validatorProductTransactions');

const productTransactionsCtrl = require('../Controllers/ProductTransactions');

router.post('/:idProduct/enter', limits(8000, 15), existProduct, authUser, validatorProductTransactions, productTransactionsCtrl.addEnter);
router.post('/:idProduct/outlet', limits(8000, 15), existProduct, authUser, validatorProductTransactions, productTransactionsCtrl.addOutlet);

router.get('/transactions/begin/:begin/end/:end', limits(8000, 15), authUser, productTransactionsCtrl.getTransactions);

module.exports = router;