CREATE DATABASE jowes
GO
USE jowes
GO
CREATE TABLE customer (
    customer_id CHAR(5) PRIMARY KEY,
    customer_name VARCHAR(30),
    customer_address VARCHAR(50),
    customer_phone VARCHAR(13),
    customer_email VARCHAR(30)
)
GO
CREATE TABLE bike (
    bike_id CHAR(5) PRIMARY KEY,
    bike_name VARCHAR(30),
    bike_type VARCHAR(30),
    bike_color VARCHAR(30),
    bike_price INT
)
GO
CREATE TABLE transaction_header (
    transaction_id CHAR(5) PRIMARY KEY,
    customer_id CHAR(5) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
    transaction_date DATE
)
GO
CREATE TABLE transaction_detail (
    transaction_id CHAR(5) REFERENCES transaction_header(transaction_id) ON UPDATE CASCADE ON DELETE CASCADE,
    bike_id CHAR(5) REFERENCES bike(bike_id) ON UPDATE CASCADE ON DELETE CASCADE,
    quantity INT,
    PRIMARY KEY(transaction_id, bike_id)
)
GO
INSERT INTO customer VALUES
('CU001', 'Lynne McNamara', 'Hickory Lane', '082024930506', 'lynne.mcnamara@gmail.com'),
('CU002', 'Tyrone Gooding', 'Massachusetts Avenue', '082026926084', 'tyrone.gooding@gmail.com'),
('CU003', 'Ursula James', 'Late Avenue', '085807654725', 'ursula.james@gmail.com'),
('CU004', 'Felix Amos', 'Werninger Street', '088327382660', 'felix.amos@gmail.com'),
('CU005', 'Anna Smith', 'Werninger Street', '088326400393', 'anna.smith@gmail.com')
GO
INSERT INTO bike VALUES
('BI001', 'Detroit 2.0', 'MTB', 'black', 2900000),
('BI002', 'Pikes 5s', 'Folding Bike', 'white', 6500000),
('BI003', 'Strattos S2', 'Road Bike', 'blue', 6000000),
('BI004', 'Ecosmo', 'Folding Bike', 'red', 3600000),
('BI005', 'Detroit 4.1', 'MTB', 'gray', 4300000)
GO
INSERT INTO transaction_header VALUES
('TR001', 'CU001', '2020-03-01'),
('TR002', 'CU002', '2020-03-05'),
('TR003', 'CU001', '2020-03-12'),
('TR004', 'CU003', '2020-03-17'),
('TR005', 'CU004', '2020-04-03'),
('TR006', 'CU002', '2020-04-14'),
('TR007', 'CU005', '2020-04-16'),
('TR008', 'CU001', '2020-04-20'),
('TR009', 'CU002', '2020-04-21'),
('TR010', 'CU003', '2020-05-02')
GO
INSERT INTO transaction_detail VALUES
('TR001', 'BI001', 1),
('TR002', 'BI002', 3),
('TR002', 'BI004', 3),
('TR003', 'BI003', 5),
('TR004', 'BI005', 7),
('TR005', 'BI001', 3),
('TR006', 'BI002', 3),
('TR006', 'BI003', 4),
('TR007', 'BI001', 1),
('TR007', 'BI002', 2),
('TR007', 'BI003', 1),
('TR008', 'BI002', 5),
('TR009', 'BI001', 3),
('TR009', 'BI005', 2),
('TR010', 'BI003', 3)