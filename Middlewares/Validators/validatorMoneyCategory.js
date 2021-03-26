const _ = require('lodash');

module.exports = (req, res, next) => {
  if ((req.body.name.length >= 2 && req.body.name.length <= 90 && _.isString(req.body.name)) && (req.body.type === "enter" || req.body.type === "outlet")) {
    next();
  } else {
    res.status(400).json({ invalidForm: true });
  }
}