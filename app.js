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

app.use(express.static(__dirname + '/dist'));

// API routes
app.use('/api/users', usersRoutes);
app.use('/api/clients', clientsRoutes);
app.use('/api/products', productsRoutes);
app.use('/api/product-transactions', productTransactionsRoutes);
app.use('/api/product-category', productsCategoryRoutes);
app.use('/api/money-transactions', moneyTransactionsRoutes);
app.use('/api/money-category', moneyCategoryRoutes);

// Catch-all route for serving the front-end application
// This should come after all specific API routes
app.get('*', (req, res) => {
    res.sendFile(__dirname + '/dist/index.html');
});

module.exports = app;