const moment = require('moment');
const ProductsCategory = require('../Models/ProductsCategory');

exports.addOneCategory = (req, res) => {
  const now = moment();
  const toInsert = {
    name: req.body.name,
    type: req.body.type,
    timestamp: now.unix(),
  };

  ProductsCategory.insertOne(toInsert)
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

  ProductsCategory.update(toChange, { idCategory: req.params.idProductsCategory })
    .then(() => {
      res.status(200).json({ update: true });
    })
    .catch(() => {
      res.status(500).json({ error: true });
    });
}

exports.getOneCategory = async (req, res) => {
  try {
    const Category = await ProductsCategory.findOne({ idCategory: req.params.idProductsCategory });
    res.status(200).json({ find: true, result: Category });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getAllCategory = async (req, res) => {
  try {
    const Categories = await ProductsCategory.findAll();
    res.status(200).json({ find: true, result: Categories });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getMostPopularEnterCategory = async (req, res) => {
  try {
    const mpcEnter = await ProductsCategory.customQuery('SELECT pt.idCategory, COUNT(pt.idCategory) AS value_occurrence, ct.name AS nameOfCategory FROM productTransactions pt LEFT JOIN productsCategory ct ON pt.idCategory = ct.idCategory WHERE ct.type="enter" GROUP BY pt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.getMostPopularOutletCategory = async (req, res) => {
  try {
    const mpcEnter = await ProductsCategory.customQuery('SELECT pt.idCategory, COUNT(pt.idCategory) AS value_occurrence, ct.name AS nameOfCategory FROM productTransactions pt LEFT JOIN productsCategory ct ON pt.idCategory = ct.idCategory WHERE ct.type="outlet" GROUP BY pt.idCategory ORDER BY value_occurrence DESC LIMIT 3;');

    res.status(200).json({ find: true, result: mpcEnter });
  } catch (err) {
    res.status(500).json({ error: true, errorMessage: err });
  }
}

exports.deleteOneCategory = (req, res) => {
  ProductsCategory.delete({ idCategory: req.params.idProductsCategory })
    .then(() => {
      res.status(200).json({ delete: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}