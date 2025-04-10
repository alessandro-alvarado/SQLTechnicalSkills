-- Dropping tables if they exist to avoid conflicts when re-running the script
DROP TABLE sales;
DROP TABLE customer;

-- Creating the customer table with various attributes
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,     -- Unique identifier for each customer
    company_name VARCHAR(30),    -- Name of the company
    company_age INT,             -- Age of the company in years
    c_address VARCHAR(30),       -- Street address
    c_city VARCHAR(25),          -- City
    c_state VARCHAR(2),          -- State (2-letter code)
    c_zip INT,                   -- ZIP code (to be later altered)
    days_absent NUMERIC(5,1),    -- Number of days the customer was absent
    ave_earnings NUMERIC(10,2),  -- Average earnings
    poc_last_name VARCHAR(30),   -- Point of contact's last name
    poc_phone VARCHAR(20),       -- Point of contact's phone number (to be later dropped)
    poc_pin VARCHAR(8)           -- PIN for the point of contact (to be later altered)
);

-- Creating the sales table
CREATE TABLE sales (
    sales_id INT PRIMARY KEY,  -- Unique sales transaction ID
    type CHAR(1) CHECK (type = 'R' OR type = 'L'),       -- Sale type: Remote (R) or Local (L)
    quantity INT,  -- Quantity of items sold
    sales_amount MONEY,  -- Total sales amount
    customer INT NOT NULL REFERENCES customer (cust_id)  -- Foreign key linking to customer
);

-- Inserting sample data into the customer table
INSERT INTO customer VALUES (1, 'Bob''s Big House', 3, '2 Oak St.', 'Harborville', 'ME', 02939, 5, 102035, 'Mendez', '2024529385', 111222);
INSERT INTO customer VALUES (2, 'Lobster Roll Island', 5, '42 Red Maple Lane', 'Cannuck', 'ME', 02941, 11, 1303328, 'Johnson', '2025920400', 222333);
INSERT INTO customer VALUES (3, 'Chowder Fantasy', 1, '18 Sycamore Island Road', 'Fisheries', 'ME', 02999, 3, 33940, 'Latrouz', '2023940316', 333444);
INSERT INTO customer VALUES (4, 'Only Lobsters', 3, '1205 Big Piney Lane', 'Coastal Heights', 'ME', 02582, 7, 232058, 'Smitty', '2023490387', 444555);

-- Inserting sample data into the sales table
INSERT INTO sales VALUES (100, 'R', 5, 45.67, 2);
INSERT INTO sales VALUES (101, 'R', 11, 109.75, 1);
INSERT INTO sales VALUES (102, 'L', 2, 88.25, 1);
INSERT INTO sales VALUES (103, 'L', 11, 68.11, 2);
INSERT INTO sales VALUES (104, 'L', 4, 31.22, 4);
INSERT INTO sales VALUES (105, 'R', 6, 55.55, 3);

-- Altering the sales table to add a sale_date column
ALTER TABLE sales
ADD sale_date DATETIME;

-- Updating specific sales records to include sale dates
UPDATE sales SET sale_date = '2023-01-13 11:01:00' WHERE sales_id = 100;
UPDATE sales SET sale_date = '2023-01-14 09:00:00' WHERE sales_id = 101;
UPDATE sales SET sale_date = '2024-01-11 15:30:00' WHERE sales_id = 102;

-- Deleting a specific sales record
DELETE FROM sales WHERE sales_id = 103;

-- Altering the customer table: Changing ZIP code to CHAR(10) for better formatting
ALTER TABLE customer ALTER COLUMN c_zip CHAR(10);

-- Altering the customer table: Changing POC_PIN to INT and making it NOT NULL
ALTER TABLE customer ALTER COLUMN poc_pin INT NOT NULL;

-- Dropping the POC phone column as it is no longer needed
ALTER TABLE customer DROP COLUMN poc_phone;

-- Altering the customer table: Making average earnings a required field
ALTER TABLE customer ALTER COLUMN ave_earnings MONEY NOT NULL;

-- Renaming a column in the sales table from 'sales_amount' to 'subtotal'
SP_RENAME 'sales.sales_amount', 'subtotal';
