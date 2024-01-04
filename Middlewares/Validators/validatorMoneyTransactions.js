const _ = require('lodash');
const MoneyCategory = require('../../Models/MoneyCategory');

module.exports = (req, res, next) => {
  console.log(req.body);
  if ((req.body.description.length >= 2 && req.body.description.length <= 90 && _.isString(req.body.description)) && _.isNumber(req.body.quantity) && (req.body.idCategory)) {
    MoneyCategory.findOne({ idCategory: req.body.idCategory })
      .then((category) => {
        req.category = category ? category : null;
        category ? next() : res.status(400).json({ invalidForm: true });
      })
      .catch(err => {
        res.status(500).json({ error: true, errorMessage: err });
      })
  } else {
    res.status(400).json({ invalidForm: true });
  }
}