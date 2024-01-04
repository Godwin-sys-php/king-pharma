const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');
const authAdmin = require('../Middlewares/Auth/authAdmin');
const validatorMoneyTransactions = require('../Middlewares/Validators/validatorMoneyTransactions');

const moneyTransactionsCtrl = require('../Controllers/MoneyTransactions');
const authManager = require('../Middlewares/Auth/authManager');

router.post('/enter', limits(8000, 15), authManager, validatorMoneyTransactions, moneyTransactionsCtrl.addEnter);
router.post('/outlet', limits(8000, 15), authManager, validatorMoneyTransactions, moneyTransactionsCtrl.addOutlet);

router.get('/transactions/begin/:begin/end/:end', limits(8000, 15), authManager, moneyTransactionsCtrl.getTransactions);
router.get('/situation', limits(8000, 15), authAdmin, moneyTransactionsCtrl.getSituation);

module.exports = router;