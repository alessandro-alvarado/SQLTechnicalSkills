-- Query 1: Retrieve inventory items with price greater than 12.50, sorted by price (descending)
SELECT country_name, name, price, on_hand
FROM country, inventory
WHERE country.country_id = inventory.country
AND price > 12.50
ORDER BY price DESC;

-- Query 2: Select consumers with no credit limit or those marked as favored
SELECT first_name, last_name, credit_limit, favored
FROM consumer
WHERE credit_limit IS NULL OR favored = 1;

-- Query 3: Retrieve female employees from the accounting department
SELECT dept_name, first_name, last_name, gender, commission_rate
FROM department, employee
WHERE department.dept_id = employee.dept
AND gender IN ('F') AND dept_name IN ('accounting');

-- Query 4: Retrieve employees whose last names start with 'P' or who had orders between specific dates, sorted by order date
SELECT first_name, last_name, commission_rate, order_date
FROM employee, orders
WHERE employee.employee_id = orders.employee
AND last_name LIKE 'P%' OR order_date BETWEEN '2018-10-01' AND '2018-10-04'
ORDER BY order_date;

-- Query 5: Retrieve order dates and department names, excluding the accounting department
SELECT order_date, dept_name
FROM orders, employee, department
WHERE department.dept_id = employee.dept
AND employee.employee_id = orders.employee
AND dept_name != ('accounting');

-- Query 6: Retrieve order dates and consumer names for orders placed between October 4 and October 5, 2018
SELECT order_date, name
FROM orders, consumer, state
WHERE state.state_id = consumer.state
AND consumer.consumer_id = orders.consumer
AND order_date BETWEEN '2018-10-04' AND '2018-10-05';

-- Query 7: Retrieve employee and consumer details for transactions where credit limits are 7500 or less, and commission rates are between 4% and 6%
SELECT employee.first_name, employee.last_name, commission_rate, order_date, consumer.last_name, credit_limit
FROM employee, orders, consumer
WHERE employee.employee_id = orders.employee
AND orders.consumer = consumer.consumer_id 
AND credit_limit <= 7500 AND commission_rate BETWEEN 0.04 AND 0.06;

-- Query 8: Retrieve order details for transactions where quantity is at least 10, sorted by quantity
SELECT dept_name, first_name, last_name, quantity, price, discount
FROM department, employee, orders, order_line
WHERE department.dept_id = employee.dept
AND employee.employee_id = orders.employee
AND orders.order_id = order_line.order_id
AND quantity >= 10
ORDER BY quantity;