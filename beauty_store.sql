USE beauty_store;

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
    category VARCHAR(50),
    description TEXT,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity_available INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 5,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL,
    brand_description TEXT
);

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    job_title VARCHAR(50)
);

CREATE TABLE Message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT,
    message_subject VARCHAR(150),
    customer_question TEXT NOT NULL,
    employee_response TEXT,
    message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE FAQ (
    faq_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    question VARCHAR(255) NOT NULL,
    answer TEXT NOT NULL
);

INSERT INTO Product (product_name, brand, category, description, price)
VALUES
('Hydrating Face Serum', 'The Ordinary', 'Skincare',
 'Lightweight serum for skin hydration', 12.50),
('Vitamin C Cleanser', 'CeraVe', 'Skincare',
 'Daily facial cleanser with vitamin C', 14.99),
('Rose Eau de Parfum', 'Chanel', 'Fragrance',
 'Floral fragrance with rose notes', 95.00),
('Vanilla Body Mist', 'Sol de Janeiro', 'Body Care',
 'Sweet vanilla-scented body mist', 25.00);

INSERT INTO Inventory (product_id, quantity_available, reorder_level)
VALUES
(1, 25, 5),
(2, 18, 5),
(3, 10, 3),
(4, 30, 5);

 SELECT * FROM Product;

 SELECT * FROM Inventory;