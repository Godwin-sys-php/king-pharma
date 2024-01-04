const _ = require('lodash');
const MoneyCategory = require('../../Models/MoneyCategory');
const ProductsCategory = require('../../Models/ProductsCategory');

module.exports = (req, res, next) => {
  console.log(req.body);
  if ((req.body.description.length >= 2 && req.body.description.length <= 90 && _.isString(req.body.description)) && _.isNumber(req.body.quantity) && (req.body.idCategory)) {
    ProductsCategory.findOne({ idCategory: req.body.idCategory })
      .then(async (category) => {
        if (req.body.moneyTransaction) {
          if (_.isNumber(req.body.price) && req.body.idMoneyCategory) {
            const moneyCategory = await MoneyCategory.findOne({ idCategory: req.body.idMoneyCategory, })
            if (!moneyCategory) {
              return res.status(400).json({ notFoundMoneyCategory: true, })
            }
            req.moneyCategory = moneyCategory;
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