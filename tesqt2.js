const { v4: uuidv4 } = require('uuid');
const util = require('util')
 // Assurez-vous d'avoir la bibliothèque 'crypto'

const psn = [
  {
    region: "France",
    image: "PSN",
    flag: "France",
    currency: "€",
    color: "indigo",
    values: [
      {
        value: 5,
        valueInDollar: 5.48,
        sellingPrice: 9.5,
      },
      {
        value: 10,
        valueInDollar: 10.95,
        sellingPrice: 18,
      },
      {
        value: 20,
        valueInDollar: 21.91,
        sellingPrice: 26,
      },
      {
        value: 30,
        valueInDollar: 32.86,
        sellingPrice: 36.5,
      },
      {
        value: 50,
        valueInDollar: 54.76,
        sellingPrice: 57.5,
      },
      {
        value: 100,
        valueInDollar: 109.53,
        sellingPrice: 120,
      },
    ],
  },
  {
    region: "Belgique",
    image: "PSN",
    flag: "Belgium",
    currency: "€",
    color: "yellow",
    values: [
      {
        value: 5,
        valueInDollar: 5.48,
        sellingPrice: 9.5,
      },
      {
        value: 10,
        valueInDollar: 10.95,
        sellingPrice: 18,
      },
      {
        value: 20,
        valueInDollar: 21.91,
        sellingPrice: 26,
      },
      {
        value: 30,
        valueInDollar: 32.86,
        sellingPrice: 36.5,
      },
      {
        value: 50,
        valueInDollar: 54.76,
        sellingPrice: 57.5,
      },
      {
        value: 100,
        valueInDollar: 109.53,
        sellingPrice: 120,
      },
    ],
  },
  {
    region: "USA",
    image: "PSN",
    flag: "UnitedStates",
    currency: "$",
    color: "blue",
    values: [
      {
        value: 5,
        valueInDollar: 5,
        sellingPrice: 8,
      },
      {
        value: 10,
        valueInDollar: 10,
        sellingPrice: 16,
      },
      {
        value: 20,
        valueInDollar: 20,
        sellingPrice: 24.5,
      },
      {
        value: 30,
        valueInDollar: 30,
        sellingPrice: 38,
      },
      {
        value: 50,
        valueInDollar: 50,
        sellingPrice: 57.5,
      },
      {
        value: 100,
        valueInDollar: 100,
        sellingPrice: 114,
      },
    ],
  },
  {
    region: "Suisse",
    image: "PSN",
    flag: "Switzerland",
    currency: "CHF",
    color: "red",
    values: [
      {
        value: 5,
        valueInDollar: 5.88,
        sellingPrice: 9,
      },
      {
        value: 10,
        valueInDollar: 11.76,
        sellingPrice: 16.5,
      },
      {
        value: 20,
        valueInDollar: 23.53,
        sellingPrice: 29.5,
      },
      {
        value: 30,
        valueInDollar: 35.29,
        sellingPrice: 38.5,
      },
      {
        value: 50,
        valueInDollar: 58.82,
        sellingPrice: 66.5,
      },
      {
        value: 100,
        valueInDollar: 117.65,
        sellingPrice: 135,
      },
    ],
  },
  {
    region: "Canada",
    image: "PSN",
    flag: "Canada",
    currency: "CAD",
    color: "pink",
    values: [
      {
        value: 5,
        valueInDollar: 3.75,
        sellingPrice: 8.5,
      },
      {
        value: 10,
        valueInDollar: 7.5,
        sellingPrice: 14,
      },
      {
        value: 20,
        valueInDollar: 15.01,
        sellingPrice: 22.5,
      },
      {
        value: 30,
        valueInDollar: 22.51,
        sellingPrice: 32,
      },
      {
        value: 50,
        valueInDollar: 37.52,
        sellingPrice: 45,
      },
      {
        value: 100,
        valueInDollar: 75.05,
        sellingPrice: 105,
      },
    ],
  },
  {
    region: "SA",
    flag: "SouthAfrica",
    image: "PSN",
    currency: "ZAR",
    color: "green",
    values: [
      {
        value: 100,
        valueInDollar: 6.78,
        sellingPrice: 15,
      },
      {
        value: 200,
        valueInDollar: 11.56,
        sellingPrice: 20,
      },
      {
        value: 500,
        valueInDollar: 28.55,
        sellingPrice: 40,
      },
      {
        value: 1000,
        valueInDollar: 58.5,
        sellingPrice: 71.5,
      },
    ],
  },
];

psn.forEach(item => {
  item.values.forEach(value => {
    value.uuid = uuidv4();
  });
});

console.log(util.inspect(psn, false, null, true /* enable colors */));
