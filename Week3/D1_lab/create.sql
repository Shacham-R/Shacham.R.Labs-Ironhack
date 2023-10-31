CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
vin VARCHAR(40),
manufacturer VARCHAR(40),
model VARCHAR(40),
make_year INT, 
colour VARCHAR(40)
);

DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
cust_id INT ,
cust_name VARCHAR(40),
cust_phone INT,
cust_email VARCHAR(40),
cust_address VARCHAR(40),
cust_city VARCHAR(40),
cust_state VARCHAR(40),
cust_country VARCHAR(40),
cust_zipcode INT

);

DROP TABLE IF EXISTS salepersons;

CREATE TABLE salespersons(
id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
staff_id INT ,
`name` VARCHAR(40),
store VARCHAR(40)
);

DROP TABLE IF EXISTS invoices;

CREATE TABLE invoices(
invoice_no INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
sale_date DATE,
car VARCHAR(40),
customer VARCHAR(40),
salesperson VARCHAR(40) 
);

