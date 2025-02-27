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

-- SELECT with specific columns and expressions
SELECT first_name, last_name, birth_date, age, age + 10 FROM parks_and_recreation.employee_demographics;

-- DISTINCT keyword to fetch unique values
SELECT DISTINCT first_name, gender FROM parks_and_recreation.employee_demographics;

-- 5. Where Clause
-- Filtering data with WHERE clause
SELECT * FROM employee_salary WHERE first_name = 'Leslie';

SELECT * FROM employee_salary WHERE salary >= 50000;

SELECT * FROM employee_demographics WHERE gender != 'Female';

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01';

-- Logical Operators (AND, OR, NOT)
SELECT * FROM employee_demographics WHERE birth_date > '1985-03-01' AND gender = 'Male';

SELECT * FROM employee_demographics WHERE birth_date > '1985-03-01' OR gender = 'Male';

SELECT * FROM employee_demographics WHERE birth_date > '1985-03-01' AND NOT gender = 'Male';

SELECT * FROM employee_demographics WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

-- 6. LIKE Statement
-- Pattern matching with LIKE
SELECT * FROM employee_demographics WHERE first_name LIKE 'Jerry';

SELECT * FROM employee_demographics WHERE first_name LIKE 'Jer%';

SELECT * FROM employee_demographics WHERE first_name LIKE '%e%';

SELECT * FROM employee_demographics WHERE first_name LIKE 'a__%';

-- 7. Group By
-- Grouping data with GROUP BY
SELECT gender FROM employee_demographics GROUP BY gender;

SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender;

-- 8. Order By
-- Sorting data with ORDER BY
SELECT * FROM employee_demographics ORDER BY gender;

SELECT * FROM employee_demographics ORDER BY gender, age DESC;

SELECT * FROM employee_demographics ORDER BY age, gender;

SELECT * FROM employee_demographics ORDER BY 5, 4;

-- 9. Having vs Where
-- Using WHERE to filter data before grouping
SELECT gender, AVG(age) FROM employee_demographics WHERE AVG(age) > 40 GROUP BY gender;

-- Using HAVING to filter data after grouping
SELECT occupation, AVG(salary) FROM employee_salary GROUP BY occupation;

SELECT occupation, AVG(salary) FROM employee_salary WHERE occupation LIKE '%manager%' GROUP BY occupation;

SELECT occupation, AVG(salary) FROM employee_salary WHERE occupation LIKE '%manager%' GROUP BY occupation HAVING AVG(salary) > 75000;

-- 10. Limit
-- Limiting the number of rows returned
SELECT * FROM employee_demographics ORDER BY age DESC LIMIT 4, 4;

-- 11. Aliasing
-- Creating aliases for columns
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;

SELECT gender, AVG(age) AS avg_age FROM employee_demographics GROUP BY gender HAVING avg_age > 40;

SELECT gender, AVG(age) avg_age FROM employee_demographics GROUP BY gender HAVING avg_age > 38;
