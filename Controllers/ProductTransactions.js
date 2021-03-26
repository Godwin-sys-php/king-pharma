const Products = require("../Models/Products");
const ProductTransactions = require("../Models/ProductTransactions");
const MoneyTransactions = require("../Models/MoneyTransactions");
const MoneyCategory = require("../Models/MoneyCategory");
const moment = require('moment');

exports.addEnter = async (req, res) => {
  const now = moment();
  if (req.body.moneyTransaction) {
    const nameOfCategory = await MoneyCategory.findOne({ idCategory: 1 });

    const lastAmount = await MoneyCategory.customQuery("SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1", []);
    if (lastAmount.amountAfter - (Number(req.body.quantity) * Number(req.body.price)) < 0) {
      res.status(400).json({ negativeAmount: true });
    } else {
      const toInsertProduct = {
        idProduct: req.params.idProduct,
        idCategory: req.body.idCategory,
        idUser: req.user.idUser,
        nameOfCategory: req.category.name,
        nameOfUser: req.user.name,
        nameOfProduct: req.product.name,
        stockAfter: Number(req.product.inStock) + Number(req.body.quantity),
        enter: Number(req.body.quantity),
        outlet: 0,
        description: req.body.description,
        timestamp: now.unix(),
      };


      const toInsertMoney = {
        idCategory: 1,
        idUser: req.user.idUser,
        nameOfCategory: nameOfCategory.name,
        nameOfUser: req.user.name,
        amountAfter: lastAmount.amountAfter - (Number(req.body.quantity) * Number(req.body.price)),
        enter: 0,
        outlet: Number(req.body.quantity) * Number(req.body.price),
        description: `Achat produit ${req.product.name}`,
        timestamp: now.unix(),
      };

      ProductTransactions.insertOne(toInsertProduct)
        .then(() => {
          Products.update({ inStock: Number(req.product.inStock) + Number(req.body.quantity), }, { idProduct: req.params.idProduct })
            .then(() => {
              MoneyTransactions.insertOne(toInsertMoney)
                .then(() => {
                  res.status(200).json({ create: true, });
                })
                .catch((error) => {
                  res.status(500).json({ error: true });
                });
            });
        })
        .catch((error) => {
          res.status(500).json({ error: true });
        });
    }
  } else {
    const toInsert = {
      idProduct: req.params.idProduct,
      idCategory: req.body.idCategory,
      idUser: req.user.idUser,
      nameOfCategory: req.category.name,
      nameOfUser: req.user.name,
      nameOfProduct: req.product.name,
      stockAfter: Number(req.product.inStock) + Number(req.body.quantity),
      enter: Number(req.body.quantity),
      outlet: 0,
      description: req.body.description,
      timestamp: now.unix(),
    };
    ProductTransactions.insertOne(toInsert)
      .then(() => {
        Products.update({ inStock: Number(req.product.inStock) + Number(req.body.quantity), }, { idProduct: req.params.idProduct })
          .then(() => {
            res.status(200).json({ create: true, });
          });
      })
      .catch((error) => {
        res.status(500).json({ error: true });
      });
  }
}

exports.addOutlet = async (req, res) => {
  if (Number(req.product.inStock) - Number(req.body.quantity) < 0) {
    res.status(400).json({ negativeStock: true });
  } else {
    const now = moment();
    if (req.body.moneyTransaction) {
      const toInsertProduct = {
        idProduct: req.params.idProduct,
        idCategory: req.body.idCategory,
        idUser: req.user.idUser,
        nameOfCategory: req.category.name,
        nameOfUser: req.user.name,
        nameOfProduct: req.product.name,
        stockAfter: Number(req.product.inStock) - Number(req.body.quantity),
        enter: 0,
        outlet: Number(req.body.quantity),
        description: req.body.description,
        timestamp: now.unix(),
      };

      const nameOfCategory = await MoneyCategory.findOne({ idCategory: 1 });

      const lastAmount = await MoneyCategory.customQuery("SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1", []);

      const toInsertMoney = {
        idCategory: 1,
        idUser: req.user.idUser,
        nameOfCategory: nameOfCategory.name,
        nameOfUser: req.user.name,
        amountAfter: lastAmount.amountAfter + (Number(req.body.quantity) * Number(req.body.price)),
        enter: Number(req.body.quantity) * Number(req.body.price),
        outlet: 0,
        description: `Vente produit ${req.product.name}`,
        timestamp: now.unix(),
      };

      ProductTransactions.insertOne(toInsertProduct)
        .then(() => {
          Products.update({ inStock: Number(req.product.inStock) - Number(req.body.quantity), }, { idProduct: req.params.idProduct })
            .then(() => {
              MoneyTransactions.insertOne(toInsertMoney)
                .then(() => {
                  res.status(200).json({ create: true, });
                })
                .catch((error) => {
                  res.status(500).json({ error: true });
                });
            });
        })
        .catch((error) => {
          res.status(500).json({ error: true });
        });
    } else {
      const toInsert = {
        idProduct: req.params.idProduct,
        idCategory: req.body.idCategory,
        idUser: req.user.idUser,
        nameOfCategory: req.category.name,
        nameOfUser: req.user.name,
        nameOfProduct: req.product.name,
        stockAfter: Number(req.product.inStock) - Number(req.body.quantity),
        enter: 0,
        outlet: Number(req.body.quantity),
        description: req.body.description,
        timestamp: now.unix(),
      };
      ProductTransactions.insertOne(toInsert)
        .then(() => {
          Products.update({ inStock: Number(req.product.inStock) - Number(req.body.quantity), }, { idProduct: req.params.idProduct })
            .then(() => {
              res.status(200).json({ create: true, });
            });
        })
        .catch((error) => {
          res.status(500).json({ error: true });
        });
    }
  }
}

exports.getTransactions = async (req, res) => {
  try {
    const Transactions = await ProductTransactions.customQuery("SELECT * FROM productTransactions WHERE timestamp >= ? AND timestamp < ?", [req.params.begin, req.params.end]);
    res.status({ find: true, transactions: Transactions });
  } catch (error) {
    res.status(500).json({ error: true});
  }
}