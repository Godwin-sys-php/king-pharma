const moment = require('moment');
const MoneyCategory = require('../Models/MoneyCategory');

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
  const toChange = {
    name: req.body.name,
    type: req.body.type
  }

  MoneyCategory.update(toChange, { idCategory: req.params.idCategory })
    .then(() => {
      res.status(200).json({ update: true });
    })
    .catch(() => {
      res.status(500).json({ error: true });
    });
}

exports.getOneCategory = async (req, res) => {
  try {
    const Category = await MoneyCategory.findOne({ idCategory: req.params.idCategory });
    res.status({ find: true, result: Category });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getAllCategory = async (req, res) => {
  try {
    const Categories = await MoneyCategory.findAll();
    res.status({ find: true, result: Categories });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getMostPopularEnterCategory = async (req, res) => {
  try {
    const mpcEnter = await MoneyTransactions.customQuery('SELECT pt.idCategory, COUNT(pt.idCategory) AS value_occurrence, ct.name AS nameOfCategory FROM moneyTransactions pt LEFT JOIN moneyCategory ct ON pt.idCategory = ct.idCategory WHERE ct.type="enter" GROUP BY mt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.getMostPopularOutletCategory = async (req, res) => {
  try {
    const mpcEnter = await MoneyTransactions.customQuery('SELECT pt.idCategory, COUNT(pt.idCategory) AS value_occurrence, ct.name AS nameOfCategory FROM moneyTransactions pt LEFT JOIN moneyCategory ct ON pt.idCategory = ct.idCategory WHERE ct.type="outlet" GROUP BY mt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.deleteOneCategory = (req, res) => {
  MoneyCategory.delete({ idCategory: req.params.idCategory })
    .then(() => {
      res.status(200).json({ delete: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}