const router = require('express').Router();

const limits = require('../Middlewares/Limits/limits');
const authUser = require('../Middlewares/Auth/authUser');
const validatorMoneyTransactions = require('../Middlewares/Validators/validatorMoneyTransactions');

const moneyTransactionsCtrl = require('../Controllers/MoneyTransactions');

router.post('/enter', limits(8000, 15), authUser, validatorMoneyTransactions, moneyTransactionsCtrl.addEnter);
router.post('/outlet', limits(8000, 15), authUser, validatorMoneyTransactions, moneyTransactionsCtrl.addOutlet);

router.get('/transactions/begin/:begin/end/:end', limits(8000, 15), authUser, moneyTransactionsCtrl.getTransactions);

module.exports = router;