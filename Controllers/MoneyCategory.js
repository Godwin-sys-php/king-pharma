const moment = require('moment');
const MoneyCategory = require('../Models/MoneyCategory');
const MoneyTransactions = require('../Models/MoneyTransactions');

exports.addOneCategory = (req, res) => {
  const now = moment();
  const toInsert = {
    name: req.body.name,
    type: req.body.type,
    timestamp: now.unix(),
  };

  MoneyCategory.insertOne(toInsert)
    .then(() => {
      res.status(200).json({ create: true });
    })
    .catch(() => {
      res.status(500).json({ error: true });
    });
}

exports.updateOneCategory = (req, res) => {
  console.log(req.body);
  const toChange = {
    name: req.body.name,
    type: req.body.type,
  }

  MoneyCategory.update(toChange, { idCategory: req.params.idMoneyCategory })
    .then(() => {
      res.status(200).json({ update: true });
    })
    .catch(() => {
      res.status(500).json({ error: true });
    });
}

exports.getOneCategory = async (req, res) => {
  try {
    const Category = await MoneyCategory.findOne({ idCategory: req.params.idMoneyCategory });
    res.status(200).json({ find: true, result: Category });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getAllCategory = async (req, res) => {
  try {
    const Categories = await MoneyCategory.findAll();
    res.status(200).json({ find: true, result: Categories });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getMostPopularEnterCategory = async (req, res) => {
  try {
    const mpcEnter = await MoneyTransactions.customQuery('SELECT mt.idCategory, COUNT(mt.idCategory) AS value_occurrence, mc.name AS nameOfCategory FROM moneyTransactions mt LEFT JOIN moneyCategory mc ON mt.idCategory = mc.idCategory WHERE mc.type="enter" GROUP BY mt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.getMostPopularOutletCategory = async (req, res) => {
  try {
    const mpcEnter = await MoneyTransactions.customQuery('SELECT mt.idCategory, COUNT(mt.idCategory) AS value_occurrence, mc.name AS nameOfCategory FROM moneyTransactions mt LEFT JOIN moneyCategory mc ON mt.idCategory = mc.idCategory WHERE mc.type="outlet" GROUP BY mt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.deleteOneCategory = (req, res) => {
  MoneyCategory.delete({ idCategory: req.params.idMoneyCategory })
    .then(() => {
      res.status(200).json({ delete: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}