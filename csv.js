const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('insert3.sql');

fs.createReadStream('Product 3.csv')
  .pipe(csv())
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne
    const insertQuery = `INSERT INTO products SET idType = 3, name = "${row.Nom}", nameOfType =  "Medicamnts d'Usages Externe ou Applications Locales", inStock = 0, price = ${parseFloat(row.Prix.replace(',', '.'))}, unit = "${row.Unit} - ${row.Conditionnement}", timestamp = 1704187969;\n`;
    
    // Écrire la requête dans le fichier SQL
    sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to inserts.sql');
  });
