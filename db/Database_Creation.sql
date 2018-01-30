CREATE DATABASE IF NOT EXISTS `turkeybase`;

use turkeybase;

DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS season_products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product_sizing;
DROP TABLE IF EXISTS product_styling;
DROP TABLE IF EXISTS order_season_pickup_dates;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS order_season;

-- ORDER SEASON TABLE
CREATE TABLE order_season (
	order_season_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_season_description VARCHAR(255) NOT NULL
);

-- ORDER SEASON PICKUP DATES TABLE
CREATE TABLE order_season_pickup_dates (
	order_season_pickup_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_season_id INT NOT NULL,
    order_season_date DATE NOT NULL,
    FOREIGN KEY(order_season_id) REFERENCES order_season(order_season_id)
);

-- PRODUCTS TABLE
CREATE TABLE products (
	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_season_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    FOREIGN KEY(order_season_id) REFERENCES order_season(order_season_id)
);

-- SEASON PRODUCTS TABLE
CREATE TABLE season_products (
	order_season_id INT NOT NULL,
    product_id INT NOT NULL
);

-- PRODUCT STYLING TABLE
CREATE TABLE product_styling (
	styling_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    styling_description VARCHAR(255) NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- PRODUCT SIZING TABLE
CREATE TABLE product_sizing (
	sizing_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sizing_description VARCHAR(255) NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- ORDERS TABLE
CREATE TABLE orders(
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_first_name VARCHAR(255) NOT NULL,
    order_last_name VARCHAR(255) NOT NULL,
    order_phone_number CHAR(10) NOT NULL,
    order_extras VARCHAR(255) NOT NULL,
    employee_initials VARCHAR(3) NOT NULL,
    picked_up BOOL,
    product_id INT NOT NULL,
    order_season_pickup_id INT NOT NULL,
    styling_id INT NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    FOREIGN KEY(order_season_pickup_id) REFERENCES order_season_pickup_dates(order_season_pickup_id),
	FOREIGN KEY(styling_id) REFERENCES product_styling(styling_id)
);

-- USERS TABLE
CREATE TABLE users (
	user_id VARCHAR(255) NOT NULL PRIMARY KEY,
    user_password VARCHAR(255) NOT NULL,
    is_admin bool
);

-- DEFAULT USERS ADDED
INSERT INTO users(user_id, user_password, is_admin) VALUES (
	'admin', 'admin_password', true
);
INSERT INTO users(user_id, user_password, is_admin) VALUES (
	'user', 'user_password', false
);