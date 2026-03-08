CREATE DATABASE IF NOT EXISTS `delivery_database`;

USE `delivery_database`;

CREATE TABLE IF NOT EXISTS `users` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `addresses` (
    `address_id` INT AUTO_INCREMENT PRIMARY KEY,
    `street` VARCHAR(255) NOT NULL,
    `city` VARCHAR(45) NOT NULL,
    `state` VARCHAR(45) NOT NULL,
    `zip_code` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `user_addresses` (
    `user_address_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT, FOREIGN KEY (user_id) REFERENCES users(user_id),
    `address_id` INT, FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE IF NOT EXISTS `orders` (
    `order_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT, FOREIGN KEY (user_id) REFERENCES users(user_id),
    `item` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `order_date` DATETIME NOT NULL,
    `status` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `deliveries` (
    `delivery_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT, FOREIGN KEY (user_id) REFERENCES users(user_id),
    `address_id` INT, FOREIGN KEY (address_id) REFERENCES addresses(address_id),
    `order_id` INT, FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO users (first_name, last_name, email, password) VALUES
('Devon', 'Curry', 'devoncurrypiano@gmail.com', 'HTMLmnop2025'),
('Emma', 'Thomp', 'ethom@gmail.com', '1234567890'),
('Josh', 'Peck', 'josh.peck@icloud.com', 'Wafflehaus42'),
('Alex', 'Hamilton', 'a.ham@usamail.com', '1776Freedom'),
('Jeffrey', 'Bezos', 'amazongbuyer@gmail.com', 'Dominate4');

INSERT INTO addresses (street, city, state, zip_code) VALUES
('27 Trejo St', 'Rexburg', 'ID', '83440'),
('750 S 2nd E', 'Rexburg', 'ID', '83440'),
('211 E Elm St', 'Boise', 'ID', '83646')
('149 Elm St', 'Staten Island', 'NY', '10310'),
('127 5th Ave', 'San Francisco', 'CA', '94118'),
('345 S 2nd E', 'Rexburg', 'ID', '83440'),
('261 Cornell Ave', 'Rexburg', 'ID', '83440'),
('1375 E Buena Vista Dr', 'Lake Buena Vista', 'FL', '32830'),
('1725 Slough Ave', 'Scranton', 'PA', '12345');

INSERT INTO user_addresses (user_id, address_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(5, 8),
(5, 9);

INSERT INTO orders (user_id, item, quantity, order_date, status) VALUES
(1, 'Paperclips', 4, '2026-02-28 10:48:00', 'Delivered'),
(2, 'Dish Soap', 6, '2026-02-28 11:01:00', 'Shipping'),
(3, 'Protein Powder', 1, '2026-03-04 14:42:00', 'Delivered'),
(4, 'Photo Prints', 18, '2026-03-06 09:14:00', 'Processing'),
(5, 'Laptop', 1, '2026-03-07 16:20:00', 'Processing'),
(6, 'Dish Soap', 2, '2026-03-07 23:04:00', 'Shipping'),
(7, 'Drier Sheets', 1, '2026-03-07 23:38:00', 'Processing');

INSERT INTO deliveries (user_id, address_id, order_id) VALUES
(2, 2, 2),
(2, 2, 6),
(2, 4, 7),
(3, 5, 1),
(4, 6, 3),
(5, 7, 4),
(5, 8, 5);


