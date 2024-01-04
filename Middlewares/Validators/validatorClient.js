const _ = require('lodash');

module.exports = (req, res, next) => {
  console.log("lqjdskflj");
  if ((req.body.name.length >= 2 && req.body.name.length <= 300)) {
    next();
  } else {
    res.status(400).json({ invalidForm: true });
  }
}