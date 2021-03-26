const MoneyCategory = require('../../Models/MoneyCategory');

module.exports = (req, res, next) => {
  MoneyCategory.findOne({ idCategory: req.params.idMoneyCategory })
    .then((product) => {
      req.product = product;
      product ? res.status(400).json({ categoryNotFound: true }) : next();
    })
    .catch((error) => {
      res.status(500).json({ error: true, errorMessage: error });
    });
};