DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE stock;



CREATE TABLE rentals
(
  id SERIAL8 primary key,
  customer_id INT8 references customers(id),
  stock_id INT8 references stock(id)
);

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE stock
(
  id SERIAL8 primary key,
  item_name VARCHAR(255) not null,
  inventory INT,
  price INT
);
