DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE stock;




CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE stock
(
  id SERIAL PRIMARY KEY,
  item_name VARCHAR(255) not null,
  inventory INT,
  price INT
);

CREATE TABLE rentals
(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  stock_id INT REFERENCES stock(id) ON DELETE CASCADE
);
