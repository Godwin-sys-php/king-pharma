const moment = require('moment');
const Products = require('../Models/Products');

exports.addOneProduct = (req, res) => {
  const now = moment();
  const toInsert = {
    name: req.body.name,
    price: req.body.price,
    inStock: req.body.inStock,
    unit: req.body.unit,
    timestamp: now.unix(),
  };

  Products.insertOne(toInsert) 
    .then(() => {
      res.status(200).json({ create: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}

exports.updateOneProduct = (req, res) => {
  const toSet = {
    name: req.body.name,
    price: req.body.price,
    unit: req.body.unit,
  };

  Products.update(toSet, { idProduct: req.params.idProduct })
    .then(() => { 
      res.status(200).json({ update: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}

exports.getOneProduct = async (req, res) => {
  try {
    const Product = await Products.findOne({ idProduct: req.params.idProduct });
    res.status({ find: true, result: Product });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.getAllProduct = async (req, res) => {
  try {
    const Product = await Products.findAll();
    res.status({ find: true, result: Product });
  } catch (error) {
    res.status(500).json({ error: true });
  }
}

exports.deleteOneProduct = (req, res) => {
  Products.delete({ idProduct: req.params.idProduct })
    .then(() => {
      res.status(200).json({ delete: true });
    })
    .catch(err => {
      res.status(500).json({ error: true });
    });
}