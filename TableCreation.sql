-- Table 1 --
-- Dropping existing tables if they exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- Creating the department table
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    name VARCHAR(30),
    phone_num VARCHAR(10),
    num_of_employees INT
);

-- Creating the employee table with a foreign key reference to department
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    is_manager CHAR(1),
    num_of_dependents INT,
    date_of_hire DATE,
    salary INT,
    department INT REFERENCES department(department_id)
);

-- Table 2 --
-- Dropping existing tables if they exist
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS machine;

-- Creating the machine table
CREATE TABLE machine (
    machine_id INT PRIMARY KEY,
    brand VARCHAR(30),
    name VARCHAR(30),
    machine_weight INT,
    service_description VARCHAR(30)
);

-- Creating the customer table with a foreign key reference to machine
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    middle_initial CHAR(1), -- Fixed typo from 'middle_intitial'
    monthly_fee INT,
    date_of_use DATE,
    weight FLOAT,
    city VARCHAR(30),
    us_state CHAR(2), -- Used CHAR(2) to enforce two-letter state codes
    average_attendance INT,
    machine INT REFERENCES machine(machine_id)
);

-- Table 3 --
-- Dropping existing tables if they exist
DROP TABLE IF EXISTS dress;
DROP TABLE IF EXISTS brand;

-- Creating the brand table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50) UNIQUE,
    average_dresses_in_stock INT,
    contract_length INT,
    customer_satisfaction DECIMAL(3,1)
);

-- Creating the dress table with a foreign key reference to brand
CREATE TABLE dress (
    dress_id INT PRIMARY KEY,
    style VARCHAR(50) NOT NULL,
    dress_size INT NOT NULL,
    dress_type VARCHAR(50),
    color VARCHAR(30),
    zipper BIT, -- Assuming this stores a boolean (0 or 1)
    purchase_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    date_acquired DATE,
    brand INT NOT NULL REFERENCES brand(brand_id)
);

-- Single Tables --
--1: Retrieve employees born in the 20th century with a commission rate above 10%.
SELECT last_name, commission_rate, birth_date
FROM employee
WHERE birth_date BETWEEN '1900-01-01' AND '1999-12-31'
AND commission_rate > 0.1;

--2: Select order line items with a quantity below 20 and a price greater than $10, sorted by price.
SELECT line_item, quantity, price, discount
FROM order_line
WHERE quantity < 20 AND price > 10
ORDER BY price;

--3: Retrieve consumers whose phone numbers start with the area code 501 or who have no fax number.
SELECT last_name, phone, fax, credit_limit, favored
FROM consumer
WHERE phone LIKE '(501)%' OR fax IS NULL;

--4: Select states with a population between 25 and 75 million and no web URL listed, ordered by land area.
SELECT name, population, land_area, web_url
FROM state
WHERE population BETWEEN 25000000 AND 75000000
AND web_url IS NULL
ORDER BY land_area;

--5: Retrieve inventory items where the description contains 'medium' or the price exceeds $15.
SELECT name, price, description
FROM inventory
WHERE description LIKE '%medium%' OR price > 15;

--6: Select employees hired between 2000 and 2009 or those who are not assigned to a department.
SELECT last_name, hire_date, birth_date, gender
FROM employee
WHERE hire_date BETWEEN '2000-01-01' AND '2009-12-31'
OR dept IS NULL;