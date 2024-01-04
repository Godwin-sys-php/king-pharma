const MoneyTransactions = require("../Models/MoneyTransactions");
const moment = require("moment");
const Products = require("../Models/Products");

exports.addEnter = async (req, res) => {
  try {
    if (req.category.type === "enter") {
      const now = moment();
      const lastAmount = await MoneyTransactions.customQuery(
        "SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1",
        []
      );

      const toInsert = {
        idCategory: req.body.idCategory,
        idUSer: req.user.idUser,
        nameOfCategory: req.category.name,
        nameOfUser: req.user.name,
        amountAfter: lastAmount[0].amountAfter + req.body.quantity,
        enter: req.body.quantity,
        outlet: 0,
        description: req.body.description,
        timestamp: now.unix(),
      };

      MoneyTransactions.insertOne(toInsert)
        .then(() => {
          res.status(200).json({ create: true });
        })
        .catch(() => {
          res.status(500).json({ error: true });
        });
    } else {
      res.status(400).json({ invalidForm: true });
    }
  } catch (error) {
    res.status(500).json({ error: true });
  }
};

exports.addOutlet = async (req, res) => {
  try {
    if (req.category.type === "outlet") {
      const now = moment();
      const lastAmount = await MoneyTransactions.customQuery(
        "SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1",
        []
      );
      if (lastAmount[0].amountAfter - req.body.quantity < 0) {
        res.status(400).json({ negativeAmount: true });
      } else {
        const toInsert = {
          idCategory: req.body.idCategory,
          idUSer: req.user.idUser,
          nameOfCategory: req.category.name,
          nameOfUser: req.user.name,
          amountAfter: lastAmount[0].amountAfter - req.body.quantity,
          enter: 0,
          outlet: req.body.quantity,
          description: req.body.description,
          timestamp: now.unix(),
        };

        MoneyTransactions.insertOne(toInsert)
          .then(() => {
            res.status(200).json({ create: true });
          })
          .catch(() => {
            res.status(500).json({ error: true });
          });
      }
    } else {
      res.status(400).json({ invalidForm: true });
    }
  } catch (error) {
    res.status(500).json({ error: true });
  }
};

exports.getTransactions = async (req, res) => {
  try {
    const Transactions = await MoneyTransactions.customQuery(
      "SELECT * FROM moneyTransactions WHERE timestamp >= ? AND timestamp < ?",
      [req.params.begin, req.params.end]
    );
    res.status(200).json({ find: true, transactions: Transactions });
  } catch (error) {
    res.status(500).json({ error: true });
  }
};

exports.getSituation = async (req, res) => {
  try {
    // const lastAmount = await MoneyTransactions.customQuery(
    //   "SELECT * FROM moneyTransactions ORDER BY idTransaction DESC LIMIT 1"
    // );
    // const sumEnter = await MoneyTransactions.customQuery(
    //   "SELECT SUM(enter) as enter FROM moneyTransactions"
    // );
    // const sumOutlet = await MoneyTransactions.customQuery(
    //   "SELECT SUM(outlet) as outlet FROM moneyTransactions"
    // );
    const products = await Products.findAll();
    const now = moment().unix();
    let n18m = [];
    let n12m = [];
    let n6m = [];
    let critical = []; // < 3 months
    let expired = [];

    for (index in products) {
      if (
        products[index].expirationTimestamp !== 0 ||
        products[index].expirationTimestamp !== null
      ) {
        console.log(products[index].expirationTimestamp);
        const sub = products[index].expirationTimestamp - now;
        console.log(sub);
        if (sub < 0) {
          expired.push(products[index]);
        } else if (sub < 2629800 * 3) {
          critical.push(products[index]);
        } else if (sub < 2629800 * 6) {
          n6m.push(products[index]);
        } else if (sub < 2629800 * 12) {
          n12m.push(products[index]);
        } else if (sub < 2629800 * 18) {
          n18m.push(products[index]);
        }
      }
    }

    res
      .status(200)
      .json({
        find: true,
        stock: products,
        expirations: {
          n18m: n18m,
          n12m: n12m,
          n6m: n6m,
          critical: critical,
          expired: expired,
        },
      });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: true });
  }
};
