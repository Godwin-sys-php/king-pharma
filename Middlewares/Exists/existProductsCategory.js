const ProductsCategory = require('../../Models/ProductsCategory');

module.exports = (req, res, next) => {
  ProductsCategory.findOne({ idCategory: req.params.idProductsCategory })
    .then((product) => {
      req.product = product;
      product ? res.status(400).json({ categoryNotFound: true }) : next();
    })
    .catch((error) => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};