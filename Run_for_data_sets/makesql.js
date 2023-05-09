
const mysql = require('mysql');
const faker = require('faker');

// Connect to the database
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "bookstore"
});

/*

// Generate and insert 5000 random data sets
for (let i = 0; i < 5000; i++) {
  const title = faker.lorem.words();
  const author = faker.name.findName();
  const price = faker.commerce.price();
  const quantity = faker.random.number({ min: 1, max: 100 });
  const publisher = faker.company.companyName();
  const publication_date = faker.date.past().toISOString().substring(0, 10);
  const isbn = faker.random.alphaNumeric(10);
  const genre = faker.random.arrayElement(['Fiction', 'Non-fiction', 'Sci-Fi', 'Romance']);
  const rating = faker.random.number({ min: 1, max: 5 });
  const description = faker.lorem.paragraph();

  const sql = `INSERT INTO books (title, author, price, quantity, publisher, publication_date, isbn, genre, rating, description) 
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [title, author, price, quantity, publisher, publication_date, isbn, genre, rating, description];

  connection.query(sql, values, (error, results, fields) => {
    if (error) throw error;
  });
}

// Close the connection
connection.end();

*/


// Generate and insert 300 random data sets
for (let i = 0; i < 300; i++) {
    const name = faker.name.findName();
    const email = faker.internet.email();
    const password = faker.internet.password();
    const role = faker.random.arrayElement(['admin', 'member']);
  
    const sql = `INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)`;
    const values = [name, email, password, role];
  
    connection.query(sql, values, (error, results, fields) => {
      if (error) throw error;
    });
  }
  
  
  // Close the connection
  connection.end();

