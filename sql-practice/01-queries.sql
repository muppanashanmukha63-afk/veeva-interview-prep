-- ====================================================================
-- VEEVA SYSTEMS INTERVIEW PREPARATION: SQL PRACTICE
-- ====================================================================

-- ====================================================================
-- DATABASE SCHEMA SETUP (TABLES & SEED DATA)
-- ====================================================================

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(4,2)
);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman VALUES (5003, 'Lauson Hen', NULL, 0.12);
INSERT INTO salesman VALUES (5007, 'Paul Adam', 'Rome', 0.13);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customer VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customer VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customer VALUES (3001, 'Brad Guzan', 'London', NULL, 5005);
INSERT INTO customer VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customer VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customer VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customer VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customer VALUES (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002);
INSERT INTO orders VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders VALUES (70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders VALUES (70004, 110.5, '2012-08-17', 3009, 5003);
INSERT INTO orders VALUES (70007, 948.5, '2012-09-10', 3005, 5002);
INSERT INTO orders VALUES (70005, 2400.6, '2012-07-27', 3007, 5001);
INSERT INTO orders VALUES (70008, 5760.0, '2012-09-10', 3002, 5001);
INSERT INTO orders VALUES (70003, 2480.4, '2012-10-10', 3009, 5003);
INSERT INTO orders VALUES (70012, 250.45, '2012-06-27', 3008, 5002);
INSERT INTO orders VALUES (70011, 75.29, '2012-08-17', 3003, 5007);
INSERT INTO orders VALUES (70013, 3045.6, '2012-04-25', 3002, 5001);
INSERT INTO orders VALUES (70010, 1983.43, '2012-10-10', 3004, 5006);

CREATE TABLE company_mast (
    com_id INT PRIMARY KEY,
    com_name VARCHAR(100)
);

INSERT INTO company_mast VALUES (11, 'Samsung');
INSERT INTO company_mast VALUES (12, 'iBall');
INSERT INTO company_mast VALUES (13, 'Epsion');
INSERT INTO company_mast VALUES (14, 'Zebronics');
INSERT INTO company_mast VALUES (15, 'Asus');
INSERT INTO company_mast VALUES (16, 'Frontech');

CREATE TABLE item_mast (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(100),
    pro_price DECIMAL(10,2),
    pro_com INT,
    FOREIGN KEY (pro_com) REFERENCES company_mast(com_id)
);

INSERT INTO item_mast VALUES (101, 'Mother Board', 3200.00, 15);
INSERT INTO item_mast VALUES (102, 'Key Board', 450.00, 16);
INSERT INTO item_mast VALUES (103, 'ZIP drive', 250.00, 14);
INSERT INTO item_mast VALUES (104, 'Speaker', 550.00, 16);
INSERT INTO item_mast VALUES (105, 'Monitor', 5000.00, 11);
INSERT INTO item_mast VALUES (106, 'DVD drive', 900.00, 12);
INSERT INTO item_mast VALUES (107, 'CD drive', 800.00, 12);
INSERT INTO item_mast VALUES (108, 'Printer', 2600.00, 13);
INSERT INTO item_mast VALUES (109, 'Refill cartridge', 350.00, 13);
INSERT INTO item_mast VALUES (110, 'Mouse', 250.00, 12);

CREATE TABLE emp_department (
    dpt_code INT PRIMARY KEY,
    dpt_name VARCHAR(100),
    dpt_allotment DECIMAL(12,2)
);

INSERT INTO emp_department VALUES (57, 'IT', 65000.00);
INSERT INTO emp_department VALUES (63, 'Finance', 15000.00);
INSERT INTO emp_department VALUES (47, 'HR', 240000.00);
INSERT INTO emp_department VALUES (27, 'RD', 55000.00);
INSERT INTO emp_department VALUES (89, 'QC', 75000.00);

CREATE TABLE emp_details (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(100),
    emp_lname VARCHAR(100),
    emp_dept INT,
    FOREIGN KEY (emp_dept) REFERENCES emp_department(dpt_code)
);

INSERT INTO emp_details VALUES (127323, 'Michale', 'Robbin', 57);
INSERT INTO emp_details VALUES (526689, 'Carlos', 'Snares', 63);
INSERT INTO emp_details VALUES (843795, 'Enric', 'Dosio', 57);
INSERT INTO emp_details VALUES (328717, 'Jhon', 'Snares', 63);
INSERT INTO emp_details VALUES (444527, 'Joseph', 'Dosni', 47);
INSERT INTO emp_details VALUES (659831, 'Zanifer', 'Emily', 47);
INSERT INTO emp_details VALUES (847674, 'Kuleswar', 'Sitaraman', 57);
INSERT INTO emp_details VALUES (748681, 'Henrey', 'Gabriel', 47);
INSERT INTO emp_details VALUES (555935, 'Alex', 'Manuel', 57);
INSERT INTO emp_details VALUES (539569, 'George', 'Mardy', 27);
INSERT INTO emp_details VALUES (733843, 'Mario', 'Saule', 63);
INSERT INTO emp_details VALUES (631548, 'Alan', 'Snappy', 27);
INSERT INTO emp_details VALUES (839139, 'Maria', 'Foster', 57);


-- ====================================================================
--  PRACTICE QUERIES (1 - 10)
-- ====================================================================

-- 1) Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
SELECT o.* 
FROM orders o 
INNER JOIN salesman s ON o.salesman_id = s.salesman_id 
WHERE s.name = 'Paul Adam';

-- 2) Write a query to display all the orders for the salesman who belongs to the city London.
SELECT o.* 
FROM orders o 
INNER JOIN salesman s ON o.salesman_id = s.salesman_id 
WHERE s.city = 'London';

-- 3) Write a query to find all orders attributed to a salesman in New York. 
SELECT o.* 
FROM orders o 
INNER JOIN salesman s ON o.salesman_id = s.salesman_id 
WHERE s.city = 'New York';

-- 4) Write a query to display all the orders which values are greater than the average order value for 10th October 2012.  
SELECT * 
FROM orders 
WHERE purch_amt > (SELECT AVG(purch_amt) FROM orders WHERE ord_date = '2012-10-10');

-- 5) Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
SELECT * 
FROM orders 
WHERE salesman_id = (SELECT salesman_id FROM customer WHERE customer_id = 3007);

-- 6) Write a query to count the customers with grades above New York's average.
SELECT COUNT(customer_id) AS count_cust 
FROM customer 
WHERE grade > (SELECT AVG(grade) FROM customer WHERE city = 'New York');

-- 7) Write a query to display the commission of all the salesmen servicing customers in Paris.
SELECT DISTINCT s.commission 
FROM salesman s 
INNER JOIN customer c ON s.salesman_id = c.salesman_id 
WHERE c.city = 'Paris';

-- 8) Write a query to display all the customers whose id is bellow the salesman ID of Mc Lyon.
SELECT * 
FROM customer 
WHERE customer_id < (SELECT salesman_id FROM salesman WHERE name = 'Mc Lyon');

-- 9) Write a query to display all customers with orders on October 5, 2012.
SELECT DISTINCT c.* 
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id 
WHERE o.ord_date = '2012-10-05';

-- 10) Write a query to display all the customers with orders issued on date 17th August, 2012.
SELECT DISTINCT c.* 
FROM customer c  
INNER JOIN orders o ON c.customer_id = o.customer_id 
WHERE o.ord_date = '2012-08-17';


