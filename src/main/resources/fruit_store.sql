CREATE DATABASE fruit_store;
USE fruit_store;
CREATE TABLE IF NOT EXISTS store (
                                     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                     `name` VARCHAR(45) NOT NULL
    );
CREATE TABLE IF NOT EXISTS warehouse (
                                         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                         product_id INT,
                                         store_id INT,
                                         quantity INT,
                                         CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id),
    CONSTRAINT fk_store1 FOREIGN KEY (store_id) REFERENCES store(id)
    );
CREATE TABLE IF NOT EXISTS manager (
                                       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    `username` varchar(45) not null,
    `password` varchar(45) not null,
    age INT NOT NULL,
    shift ENUM('1', '2', '3') NOT NULL, #from 9 to 21, 4hrs each
    store_id INT,
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES store(id)
    );
CREATE TABLE IF NOT EXISTS product (
                                       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       `name` VARCHAR(45) NOT NULL,
    `description` TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image BLOB NULL ,
    origin VARCHAR(255),
    weight INT,
    size ENUM('x-small', 'small', 'medium', 'large', 'x-large'),
    expire_date DATE,
    store_id INT,
    CONSTRAINT fk_store_product FOREIGN KEY (store_id) REFERENCES store(id)
    );
CREATE TABLE IF NOT EXISTS customer (
                                        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                        first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    `username` varchar(45) not null,
    `password` varchar(45) not null,
    image BLOB NULL,
    `age` INT NOT NULL,
    store_id INT NULL,
    CONSTRAINT fk_store_customer FOREIGN KEY (store_id) REFERENCES store(id)
    );
CREATE TABLE IF NOT EXISTS order_info (
                                          id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                          customer_id INT,
                                          store_id INT,
                                          order_date DATE,
                                          shipping_status ENUM('waiting confirmation', 'delivering package', 'success'),
    total_amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customer(id),
    CONSTRAINT fk_order_store FOREIGN KEY (store_id) REFERENCES store(id)
    );
CREATE TABLE IF NOT EXISTS order_item (
                                          id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                          order_id INT,
                                          product_id INT,
                                          quantity INT,
                                          CONSTRAINT fk_order_header FOREIGN KEY (order_id) REFERENCES order_info(id),
    CONSTRAINT fk_order_product FOREIGN KEY (product_id) REFERENCES product(id)
    );
INSERT INTO store (name)
VALUES ('Fruit Mart'),
       ('Vegetable World'),
       ('Meat Emporium');
INSERT INTO manager (first_name, last_name,username, password, age, shift, store_id)
VALUES
    ('John', 'Doe','Doe', 'password123', 30, '1', 1),
    ('Jane', 'Smith','Smith', 'password456', 35, '2', 1),
    ('Bob', 'Johnson','Johnson', 'password789', 28, '3', 1),
    ('Alice', 'Lee','Lee', 'password111', 27, '1', 2),
    ('Tom', 'Brown','Brown', 'password222', 32, '2', 2),
    ('Sara', 'Davis','Davis', 'password333', 29, '3', 2),
    ('Mike', 'Wilson','Wilson', 'password444', 31, '1', 3),
    ('Emily', 'Taylor','Taylor', 'password555', 33, '2', 3),
    ('Chris', 'Clark','Clark', 'password666', 26, '3', 3);
INSERT INTO product (`name`, `description`, price, origin, weight, size, expire_date, store_id)
VALUES
    ('Apple', 'Fresh and crunchy apples', 0.75, 'USA', 200, 'medium', '2023-05-01', 1),
    ('Orange', 'Juicy and sweet oranges', 0.50, 'Brazil', 150, 'medium', '2023-04-30', 1),
    ('Banana', 'Soft and sweet bananas', 0.35, 'Ecuador', 100, 'medium', '2023-05-05', 2),
    ('Grapes', 'Red and green grapes', 1.25, 'Italy', 300, 'medium', '2023-05-07', 2),
    ('Watermelon', 'Sweet and refreshing watermelons', 5.00, 'USA', 5000, 'large', '2023-05-15', 3),
    ('Blueberries', 'Fresh and plump blueberries', 3.50, 'Canada', 100, 'small', '2023-05-03', 3),
    ('Mango', 'Juicy and exotic mangoes', 1.75, 'India', 300, 'medium', '2023-05-10', 3),
    ('Pineapple', 'Sweet and tangy pineapples', 2.50, 'Costa Rica', 1000, 'large', '2023-05-20', 2),
    ('Kiwi', 'Sour and healthy kiwis', 0.65, 'New Zealand', 50, 'medium', '2023-05-02', 1),
    ('Peach', 'Juicy and fuzzy peaches', 1.00, 'Spain', 150, 'medium', '2023-08-02',2);
INSERT INTO customer (first_name, last_name,username, password, age)
VALUES ('John', 'Doe','1', 'password123', 25),
       ('Jane', 'Doe','2', 'password456', 30),
       ('Alice', 'Smith','3', 'password789', 20),
       ('Bob', 'Johnson','4', 'password321', 40),
       ('Karen', 'Lee','5', 'password654', 27),
       ('David', 'Wang','6', 'password987', 33),
       ('Samantha', 'Kim','7', 'password246', 29),
       ('Michael', 'Jones','8', 'password135', 22),
       ('Emily', 'Davis','9', 'password468', 35),
       ('Ryan', 'Taylor','10', 'password579', 42);