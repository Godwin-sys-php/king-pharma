const _ = require('lodash');
const ProductsCategory = require('../../Models/ProductsCategory');

module.exports = (req, res, next) => {
  if ((req.body.description.length >= 2 && req.body.description.length <= 90 && _.isString(req.body.description)) && _.isNumber(req.body.quantity) && (req.body.idCategory) && (_.isBoolean(req.body.moneyTransaction))) {
    ProductsCategory.findOne({ idCategory: req.body.idCategory })
      .then((category) => {
        if (req.body.moneyTransaction) {
          if (_.isNumber(req.body.price)) {
            req.category = category ? category : null;
            category ? next() : res.status(400).json({ invalidForm: true });
          } else {
            res.status(400).json({ invalidForm: true })
          }
        } else {
          req.category = category ? category : null;
          category ? next() : res.status(400).json({ invalidForm: true });
        }
      })
      .catch(err => {
        res.status(500).json({ error: true, errorMessage: err });
      })
  } else {
    res.status(400).json({ invalidForm: true });
  }
}