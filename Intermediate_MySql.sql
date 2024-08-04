-- MySQL Beginner Stage Cheatsheet

-- 1. Installing MySQL and Creating Databases
-- Drop the database if it already exists
DROP DATABASE IF EXISTS `Parks_and_Recreation`;
-- Create a new database
CREATE DATABASE `Parks_and_Recreation`;
-- Use the created database
USE `Parks_and_Recreation`;

-- 2. Creating Tables
-- Create employee_demographics table
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

-- Create employee_salary table
CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

-- Create parks_departments table
CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (department_id)
);

-- 3. Inserting Values
-- Insert values into employee_demographics table
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1, 'Leslie', 'Knope', 44, 'Female', '1979-09-25'),
(3, 'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

-- Insert values into employee_salary table
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000, 1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000, 1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000, 1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000, 1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000, 1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
(7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
(8, 'Chris', 'Traeger', 'City Manager', 90000, 3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1);

-- Insert values into parks_departments table
INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

-- 4. Select Statements
-- Basic SELECT statement
SELECT * FROM parks_and_recreation.employee_demographics;

-- SELECT with specific columns
SELECT first_name, last_name FROM employee_demographics;

-- 5. Where Clause
-- Filtering data with WHERE clause
SELECT * FROM employee_salary WHERE salary > 50000;

-- 6. Group By and Order By
-- Grouping data with GROUP BY
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;

-- Sorting data with ORDER BY
SELECT * FROM employee_demographics ORDER BY age DESC;

-- 7. Having vs Where
-- Using WHERE to filter data before grouping
SELECT * FROM employee_demographics WHERE age > 30;

-- Using HAVING to filter data after grouping
SELECT gender, AVG(age) avg_age FROM employee_demographics GROUP BY gender HAVING avg_age > 35;

-- 8. Limit and Aliasing
-- Limiting the number of rows returned
SELECT * FROM employee_demographics LIMIT 5;

-- Creating aliases for columns
SELECT gender, AVG(age) AS average_age FROM employee_demographics GROUP BY gender;

-- 9. Joins

-- Inner Join
SELECT * FROM employee_demographics INNER JOIN employee_salary ON employee_demographics.employee_id = employee_salary.employee_id;

-- Outer Joins
-- Left Join
SELECT * FROM employee_demographics AS dem LEFT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

-- Right Join
SELECT * FROM employee_demographics AS dem RIGHT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

-- Self Join
SELECT emp1.employee_id AS emp_santa, emp1.first_name AS first_name_santa, emp1.last_name AS last_name_santa, emp2.employee_id AS emp_name, emp2.first_name AS first_name_emp, emp2.last_name AS last_name_emp FROM employee_salary emp1 JOIN employee_salary emp2 ON emp1.employee_id + 1 = emp2.employee_id;

-- Joining multiple tables
SELECT * FROM employee_demographics AS dem INNER JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id INNER JOIN parks_departments pd ON sal.dept_id = pd.department_id;

-- 10. Unions
-- Union to combine results from multiple queries
SELECT first_name, last_name FROM employee_demographics UNION SELECT first_name, last_name FROM employee_salary;

-- Union All
SELECT first_name, last_name FROM employee_demographics UNION ALL SELECT first_name, last_name FROM employee_salary;

-- Labeling data in Union
SELECT first_name, last_name, 'Old Lady' AS Label FROM employee_demographics WHERE age > 40 AND gender = 'Female' UNION SELECT first_name, last_name, 'Old Man' AS Label FROM employee_demographics WHERE age > 40 AND gender = 'Male' UNION SELECT first_name, last_name, 'Highly Paid Employee' AS Label FROM employee_salary WHERE salary > 70000 ORDER BY first_name;

-- 11. String Functions
-- Length of a string
SELECT LENGTH('skyfall');

-- Upper and Lower case conversion
SELECT UPPER('sky');
SELECT LOWER('SKY');

-- Trimming spaces
SELECT TRIM(' sky ') AS trim;

-- Substring functions
SELECT LEFT(first_name, 4), RIGHT(first_name, 4), SUBSTRING(first_name, 3, 2) FROM employee_demographics;

-- Replace function
SELECT first_name, REPLACE(first_name, 'a', 'z') FROM employee_demographics;

-- Locate function
SELECT first_name, LOCATE('AN', first_name) FROM employee_demographics;

-- Concatenation
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name FROM employee_demographics;

-- 12. Case Statements
-- Using CASE to categorize data
SELECT first_name, last_name, age,
CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS Age_Bracket
FROM employee_demographics;

-- 13. Pay Increase and Bonus
-- Calculate new salary and bonus
SELECT first_name, last_name, salary,
CASE
    WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS New_Salary,
CASE
    WHEN dept_id = 6 THEN salary + (salary * 0.1)
END 
FROM employee_salary;

-- 14. Subqueries
-- Subquery to filter results
SELECT * FROM employee_demographics WHERE employee_id IN (SELECT employee_id FROM employee_salary WHERE dept_id = 1);

-- Subquery to calculate average salary
SELECT first_name, salary, (SELECT AVG(salary) FROM employee_salary) FROM employee_salary;

-- Aggregate functions with GROUP BY
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender;

-- Nested subquery
SELECT gender, AVG(`MAX(age)`) FROM (SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender) AS Agg_table GROUP BY gender;

-- Aggregating nested subquery
SELECT AVG(max_age) FROM (SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) FROM employee_demographics GROUP BY gender) AS Agg_table;

-- 15. Window Functions
-- Window function to calculate average salary by gender
SELECT gender, AVG(salary) AS avg_salary FROM employee_demographics dem JOIN employee_salary sal ON dem.employee_id = sal.employee_id GROUP BY gender;

-- Window function with PARTITION BY
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER (PARTITION BY gender) FROM employee_demographics dem JOIN employee_salary sal ON dem.employee_id = sal.employee_id;

-- Rolling total with window function
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER (PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total FROM employee_demographics dem JOIN employee_salary sal ON dem.employee_id = sal.employee_id;

-- Row number and rank with window function
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS row_num, RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num, DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS dense_num FROM employee_demographics dem JOIN employee_salary sal ON dem.employee_id = sal.employee_id;
