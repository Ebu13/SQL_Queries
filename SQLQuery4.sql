-- Müþteriler tablosunu oluþturma
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(100)
);

-- Sipariþler tablosunu oluþturma
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Ürünler tablosunu oluþturma
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10, 2)
);

-- Sipariþ detaylarý tablosunu oluþturma
CREATE TABLE order_details (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Müþteri verilerini ekleme
INSERT INTO customers (customer_id, customer_name, email, address)
VALUES 
  (1, 'John Doe', 'john.doe@example.com', '123 Main St'),
  (2, 'Jane Smith', 'jane.smith@example.com', '456 Elm St'),
  (3, 'Emma Johnson', 'emma.johnson@example.com', '789 Oak St'),
  (4, 'Michael Brown', 'michael.brown@example.com', '321 Pine St');

-- Ürün verilerini ekleme
INSERT INTO products (product_id, product_name, price)
VALUES 
  (1, 'Product A', 10.99),
  (2, 'Product B', 19.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 15.99),
  (5, 'Product E', 8.99);

-- Sipariþ verilerini ekleme
INSERT INTO orders (order_id, customer_id, order_date)
VALUES 
  (1, 1, '2023-08-01'),
  (2, 2, '2023-08-05'),
  (3, 3, '2023-08-10'),
  (4, 4, '2023-08-15');

-- Sipariþ detayý verilerini ekleme
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity)
VALUES 
  (1, 1, 1, 2),
  (2, 1, 2, 1),
  (3, 2, 3, 3),
  (4, 3, 4, 2),
  (5, 3, 5, 1),
  (6, 4, 4, 3);

  -- Tablolarý birleþtirerek verileri almak için JOIN ile SELECT sorgusu
SELECT c.customer_name, o.order_id, p.product_name, od.quantity, p.price, (od.quantity * p.price) AS total_cost
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_details AS od ON o.order_id = od.order_id
JOIN products AS p ON od.product_id = p.product_id
ORDER BY c.customer_name, o.order_id;

-- Tablolarý silmek için DROP TABLE ifadesi
DROP TABLE order_details;
DROP TABLE orders;
DROP TABLE products;
DROP TABLE customers;
