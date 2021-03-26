const MoneyTransactions = require('../Models/MoneyTransactions');
const moment = require('moment');

exports.addEnter = async (req, res) => {
  try {
    const now = moment();
    const lastAmount = await MoneyTransactions.customQuery("SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1", []);

    const toInsert = {
      idCategory: req.body.idCategory,
      idUSer: req.user.idUser,
      nameOfCategory: req.category.name,
      nameOfUser: req.user.name,
      amountAfter: lastAmount.amountAfter + req.body.quantity,
      enter: req.body.quantity,
      outlet: 0,
      description: req.body.description,
      timestamp: now.unix(),
    };

    MoneyTransactions.insertOne(toInsert)
      .then(() => {
        res.status(200).json({ create: true });
      })
      .catch(() => {
        res.status(500).json({ error: true });
      });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.addOutlet = async (req, res) => {
  try {
    const now = moment();
    const lastAmount = await MoneyTransactions.customQuery("SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1", []);
    if ((lastAmount.amountAfter - req.body.quantity) < 0) {
      res.status(400).json({ negativeAmount: true });
    } else {
      const toInsert = {
        idCategory: req.body.idCategory,
        idUSer: req.user.idUser,
        nameOfCategory: req.category.name,
        nameOfUser: req.user.name,
        amountAfter: lastAmount.amountAfter - req.body.quantity,
        enter: 0,
        outlet: req.body.quantity,
        description: req.body.description,
        timestamp: now.unix(),
      };

      MoneyTransactions.insertOne(toInsert)
        .then(() => {
          res.status(200).json({ create: true });
        })
        .catch(() => {
          res.status(500).json({ error: true });
        });
    }
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getTransactions = async (req, res) => {
  try {
    const Transactions = await MoneyTransactions.customQuery("SELECT * FROM moneyTransactions WHERE timestamp >= ? AND timestamp < ?", [req.params.begin, req.params.end]);
    res.status({ find: true, transactions: Transactions });
  } catch (error) {
    res.status(500).json({ error: true});
  }
}