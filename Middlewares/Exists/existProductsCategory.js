const ProductsCategory = require('../../Models/ProductsCategory');

module.exports = (req, res, next) => {
  ProductsCategory.findOne({ idCategory: req.params.idProductsCategory })
    .then((product) => {
      req.product = product;
      product ? next() : res.status(400).json({ productNotFound: true });
    })
    .catch((error) => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};