const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const xss = require('xss');
const _ = require('lodash');
const path = require('path');

const usersRoutes = require('./Routes/Users');
const clientsRoutes = require('./Routes/Clients');
const productsRoutes = require('./Routes/Products');
const productTransactionsRoutes = require('./Routes/ProductTransactions');
const productsCategoryRoutes = require('./Routes/ProductsCategory');
const moneyTransactionsRoutes = require('./Routes/MoneyTransactions');
const moneyCategoryRoutes = require('./Routes/MoneyCategory');

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(bodyParser.json({limit: '50mb', extended: true}));

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});

app.use((req, res, next) => {
  if (Object.keys(req.body).length > 0) {
    for (let index in req.body) {
      if (_.isString(req.body[index])) {
        req.body[index] = req.body[index].trim();
        req.body[index] = xss(req.body[index]);
      }
    }
    next();
  } else {
    next();
  }
});

app.use(
  "/Invoices",
  express.static(path.join(__dirname, "Invoices"))
);

// app.use('/web', (express.static(path.join(__dirname, 'build'))));
// app.get('/application/*', function (req, res) {
//    res.sendFile(path.join(__dirname, 'build', 'index.html'));
// });
  
app.use('/users', usersRoutes);
app.use('/clients', clientsRoutes);
app.use('/products', productsRoutes);
app.use('/product-transactions', productTransactionsRoutes);
app.use('/product-category', productsCategoryRoutes);
app.use('/money-transactions', moneyTransactionsRoutes);
app.use('/money-transactions', moneyTransactionsRoutes);
app.use('/money-category', moneyCategoryRoutes);

module.exports = app;