-- Veritabanýný oluþtur
CREATE DATABASE CustomerDatabase;

-- Veritabanýný kullan
USE CustomerDatabase;

-- Müþteriler tablosunu oluþtur
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Sipariþler tablosunu oluþtur
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Ürünler tablosunu oluþtur
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Kategoriler tablosunu oluþtur
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Müþteriler tablosuna veri ekle
INSERT INTO Customers (customer_id, first_name, last_name, email, city)
VALUES (1, 'John', 'Doe', 'john@example.com', 'New York'),
       (2, 'Jane', 'Smith', 'jane@example.com', 'Los Angeles'),
       (3, 'Michael', 'Johnson', 'michael@example.com', 'Chicago');

-- Sipariþler tablosuna veri ekle
INSERT INTO Orders (order_id, customer_id, product_id, order_date, amount)
VALUES (1, 1, 1, '2023-09-01', 100.00),
       (2, 1, 2, '2023-09-02', 50.00),
       (3, 2, 1, '2023-09-03', 75.00);

-- Ürünler tablosuna veri ekle
INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (1, 'Phone', 1500.00, 10, 1),
       (2, 'Laptop', 3000.00, 5, 1),
       (3, 'Television', 2000.00, 8, 1),
       (4, 'Pen', 5.00, 50, 2),
       (5, 'Notebook', 10.00, 30, 2),
       (6, 'Book', 20.00, 20, 2);

-- Kategoriler tablosuna veri ekle
INSERT INTO Categories (category_id, name)
VALUES (1, 'Electronics'),
       (2, 'Stationery');
