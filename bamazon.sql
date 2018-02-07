CREATE DATABASE bamazon;
USE bamazon;

DROP TABLE IF EXISTS products;

CREATE TABLE products (PRIMARY KEY(item_id), item_id INTEGER(5) AUTO_INCREMENT NOT NULL, product_name VARCHAR(50), department_name VARCHAR(100), price FLOAT(10),stock_quantity INTEGER(5));

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Samsung Galaxy S8+', 'Cell Phones & Accessories', 824.99, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Apple iPhone X', 'Cell Phones & Accessories', 1199.99, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Samsung Galaxy Note 8', 'Cell Phones & Accessories', 949.99, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Bamazon Echo Show', 'Electronics', 141.99, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Bamazon Fire 8', 'Computers & Tablets', 74.99, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('NVidia Shield TV', 'Electronics', 179.99, 100);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('NETGEAR Orbi Whole Home Mesh WiFi System, 2 pack', 'Networking', 249.99, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('IPA Glasses, set of 4', 'Home and Kitchen', 19.95, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Beer Chalice', 'Home and Kitchen', 11.50, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Transformers: Generations Power of the Primes Leader Evolution Optimus Prime', 'Toys & Games', 44.99, 28);

SELECT * FROM products;
