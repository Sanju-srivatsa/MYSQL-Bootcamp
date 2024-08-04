---

# MySQL Cheatsheet

## Table of Contents
1. [MySQL Beginner Stage](#mysql-beginner-stage)
   - [Installing MySQL and Creating Databases](#installing-mysql-and-creating-databases)
   - [Creating Tables](#creating-tables)
   - [Inserting Values](#inserting-values)
   - [Select Statements](#select-statements)
   - [Where Clause](#where-clause)
   - [Logical Operators (AND, OR, NOT)](#logical-operators-and-or-not)
   - [LIKE Statement](#like-statement)
   - [Group By](#group-by)
   - [Order By](#order-by)
   - [Having vs Where](#having-vs-where)
   - [Limit](#limit)
   - [Aliasing](#aliasing)
2. [MySQL Intermediate Stage](#mysql-intermediate-stage)
   - [Joins](#joins)
   - [Inner Join](#inner-join)
   - [Outer Joins](#outer-joins)
   - [Self Join](#self-join)
   - [Joining Multiple Tables](#joining-multiple-tables)
   - [Unions](#unions)
   - [String Functions](#string-functions)
   - [Case Statements](#case-statements)
   - [Subqueries](#subqueries)
   - [Window Functions](#window-functions)

## MySQL Beginner Stage

### Installing MySQL and Creating Databases
**Definition:** Install MySQL, create, and select databases.
**Why & When:** Essential for setting up a database environment to store and manage data.

**Syntax:**
```sql
DROP DATABASE IF EXISTS `database_name`;
CREATE DATABASE `database_name`;
USE `database_name`;
```
**Example:**
```sql
DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;
```
**Explanation:** This command sequence ensures you start with a clean database, create a new one, and set it as the current working database.

### Creating Tables
**Definition:** Create tables to store data.
**Why & When:** Needed to define the structure of your data within a database.

**Syntax:**
```sql
CREATE TABLE table_name (
  column1 datatype,
  column2 datatype,
  ...
  PRIMARY KEY (column)
);
```
**Example:**
```sql
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);
```
**Explanation:** This defines the `employee_demographics` table with columns for storing employee details and sets `employee_id` as the primary key.

### Inserting Values
**Definition:** Insert data into tables.
**Why & When:** To add new records to your database tables.

**Syntax:**
```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```
**Example:**
```sql
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (1, 'Leslie', 'Knope', 44, 'Female', '1979-09-25');
```
**Explanation:** This inserts a new record into the `employee_demographics` table.

### Select Statements
**Definition:** Retrieve data from tables.
**Why & When:** To query and display data from the database.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name;
```
**Example:**
```sql
SELECT * FROM employee_demographics;
```
**Sample Result:**
| employee_id | first_name | last_name  | age | gender | birth_date |
|-------------|------------|------------|-----|--------|------------|
| 1           | Leslie     | Knope      | 44  | Female | 1979-09-25 |
| 3           | Tom        | Haverford  | 36  | Male   | 1987-03-04 |
| 4           | April      | Ludgate    | 29  | Female | 1994-03-27 |
**Explanation:** This retrieves all columns for all rows in the `employee_demographics` table.

### Where Clause
**Definition:** Filter records.
**Why & When:** To retrieve specific data that meets certain conditions.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```
**Example:**
```sql
SELECT * FROM employee_salary WHERE salary >= 50000;
```
**Sample Result:**
| employee_id | first_name | last_name  | occupation                          | salary | dept_id |
|-------------|------------|------------|-------------------------------------|--------|---------|
| 1           | Leslie     | Knope      | Deputy Director of Parks and Recreation | 75000  | 1       |
| 2           | Ron        | Swanson    | Director of Parks and Recreation   | 70000  | 1       |
| 6           | Donna      | Meagle     | Office Manager                     | 60000  | 1       |
**Explanation:** This retrieves all employees with a salary of 50,000 or more.

### Logical Operators (AND, OR, NOT)
**Definition:** Combine multiple conditions.
**Why & When:** To create more complex queries with multiple conditions.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2;
```
**Example:**
```sql
SELECT * FROM employee_demographics WHERE birth_date > '1985-03-01' AND gender = 'Male';
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date |
|-------------|------------|-----------|-----|--------|------------|
| 3           | Tom        | Haverford | 36  | Male   | 1987-03-04 |
| 9           | Ben        | Wyatt     | 38  | Male   | 1985-07-26 |
**Explanation:** This retrieves male employees born after March 1, 1985.

### LIKE Statement
**Definition:** Pattern matching.
**Why & When:** To search for a specified pattern in a column.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column LIKE pattern;
```
**Example:**
```sql
SELECT * FROM employee_demographics WHERE first_name LIKE 'Jer%';
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date |
|-------------|------------|-----------|-----|--------|------------|
| 5           | Jerry      | Gergich   | 61  | Male   | 1962-08-28 |
**Explanation:** This retrieves employees whose first name starts with 'Jer'.

### Group By
**Definition:** Group rows that have the same values.
**Why & When:** To aggregate data and perform summary operations.

**Syntax:**
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
```
**Example:**
```sql
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;
```
**Sample Result:**
| gender | AVG(age) |
|--------|----------|
| Female | 39.67    |
| Male   | 41.4     |
**Explanation:** This calculates the average age for each gender.

### Order By
**Definition:** Sort the result set.
**Why & When:** To arrange data in a specific order, either ascending or descending.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC];
```
**Example:**
```sql
SELECT * FROM employee_demographics ORDER BY age

 DESC;
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date |
|-------------|------------|-----------|-----|--------|------------|
| 5           | Jerry      | Gergich   | 61  | Male   | 1962-08-28 |
| 6           | Donna      | Meagle    | 46  | Female | 1977-07-30 |
| 1           | Leslie     | Knope     | 44  | Female | 1979-09-25 |
**Explanation:** This sorts employees by age in descending order.

### Having vs Where
**Definition:** Filter records after grouping.
**Why & When:** Use `HAVING` to filter aggregated data, while `WHERE` is used before grouping.

**Syntax:**
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING condition;
```
**Example:**
```sql
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary) > 75000;
```
**Sample Result:**
| occupation                             | AVG(salary) |
|----------------------------------------|-------------|
| Deputy Director of Parks and Recreation | 75000       |
| City Manager                           | 90000       |
**Explanation:** This retrieves occupations with an average salary greater than 75,000.

### Limit
**Definition:** Limit the number of rows returned.
**Why & When:** To restrict the result set to a specified number of rows.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
LIMIT number;
```
**Example:**
```sql
SELECT * FROM employee_demographics ORDER BY age DESC LIMIT 3;
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date |
|-------------|------------|-----------|-----|--------|------------|
| 5           | Jerry      | Gergich   | 61  | Male   | 1962-08-28 |
| 6           | Donna      | Meagle    | 46  | Female | 1977-07-30 |
| 1           | Leslie     | Knope     | 44  | Female | 1979-09-25 |
**Explanation:** This limits the result set to the top 3 oldest employees.

### Aliasing
**Definition:** Rename a column or table.
**Why & When:** To simplify column names or table references in queries.

**Syntax:**
```sql
SELECT column1 AS alias_name
FROM table_name;
```
**Example:**
```sql
SELECT gender, AVG(age) AS avg_age FROM employee_demographics GROUP BY gender;
```
**Sample Result:**
| gender | avg_age |
|--------|---------|
| Female | 39.67   |
| Male   | 41.4    |
**Explanation:** This renames the calculated average age column as `avg_age`.

## MySQL Intermediate Stage

### Joins
**Definition:** Combine rows from two or more tables.
**Why & When:** To retrieve related data from multiple tables.

**Syntax:**
```sql
SELECT columns
FROM table1
JOIN table2
ON table1.column = table2.column;
```
**Example:**
```sql
SELECT * FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;
```
**Sample Result:**
| employee_id | first_name | last_name     | age | gender | birth_date | occupation                          | salary | dept_id |
|-------------|------------|---------------|-----|--------|------------|-------------------------------------|--------|---------|
| 1           | Leslie     | Knope         | 44  | Female | 1979-09-25 | Deputy Director of Parks and Recreation | 75000  | 1       |
| 3           | Tom        | Haverford     | 36  | Male   | 1987-03-04 | Entrepreneur                        | 50000  | 1       |
| 4           | April      | Ludgate       | 29  | Female | 1994-03-27 | Assistant to the Director of Parks and Recreation | 25000  | 1       |
**Explanation:** This joins the `employee_demographics` and `employee_salary` tables on the `employee_id` column.

### Inner Join
**Definition:** Select records that have matching values in both tables.
**Why & When:** To return rows when there is at least one match in both tables.

**Syntax:**
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```
**Example:**
```sql
SELECT * FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;
```
**Sample Result:**
| employee_id | first_name | last_name     | age | gender | birth_date | occupation                          | salary | dept_id |
|-------------|------------|---------------|-----|--------|------------|-------------------------------------|--------|---------|
| 1           | Leslie     | Knope         | 44  | Female | 1979-09-25 | Deputy Director of Parks and Recreation | 75000  | 1       |
| 3           | Tom        | Haverford     | 36  | Male   | 1987-03-04 | Entrepreneur                        | 50000  | 1       |
| 4           | April      | Ludgate       | 29  | Female | 1994-03-27 | Assistant to the Director of Parks and Recreation | 25000  | 1       |
**Explanation:** This returns only the rows that have matching values in both tables.

### Outer Joins
**Definition:** Select records that have matching values in one of the tables.
**Why & When:** To return all records when there is a match in one of the tables.

**Syntax:**
```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```
**Example:**
```sql
SELECT * FROM employee_demographics
LEFT JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;
```
**Sample Result:**
| employee_id | first_name | last_name     | age | gender | birth_date | occupation                          | salary | dept_id |
|-------------|------------|---------------|-----|--------|------------|-------------------------------------|--------|---------|
| 1           | Leslie     | Knope         | 44  | Female | 1979-09-25 | Deputy Director of Parks and Recreation | 75000  | 1       |
| 3           | Tom        | Haverford     | 36  | Male   | 1987-03-04 | Entrepreneur                        | 50000  | 1       |
| 4           | April      | Ludgate       | 29  | Female | 1994-03-27 | Assistant to the Director of Parks and Recreation | 25000  | 1       |
| 5           | Jerry      | Gergich       | 61  | Male   | 1962-08-28 | NULL                                | NULL   | NULL    |
**Explanation:** This returns all rows from the `employee_demographics` table, and the matched rows from the `employee_salary` table.

### Self Join
**Definition:** Join a table to itself.
**Why & When:** To compare rows within the same table.

**Syntax:**
```sql
SELECT columns
FROM table1 AS alias1
JOIN table1 AS alias2
ON alias1.column = alias2.column;
```
**Example:**
```sql
SELECT emp1.employee_id, emp2.employee_id
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id + 1 = emp2.employee_id;
```
**Sample Result:**
| employee_id | employee_id |
|-------------|-------------|
| 1           | 2           |
| 2           | 3           |
| 3           | 4           |
**Explanation:** This compares rows within the `employee_salary` table.

### Joining Multiple Tables
**Definition:** Combine rows from more than two tables.
**Why & When:** To retrieve complex related data from multiple tables.

**Syntax:**
```sql
SELECT columns
FROM table1
JOIN table2
ON table1.column = table2.column
JOIN table3
ON table2.column = table3.column;
```
**Example:**
```sql
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
ON sal.dept_id = pd.department_id;
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date | occupation                          | salary | dept_id | department_id | department_name           |
|-------------|------------|-----------|-----|--------|------------|-------------------------------------|--------|---------|---------------|---------------------------|
| 1           | Leslie     | Knope     | 44  | Female | 1979-09-25 | Deputy Director of Parks and Recreation | 75000  | 1       | 1             | Parks and Recreation      |
| 2           | Ron        | Swanson   | 57  | Male   | 1967-06-21 | Director of Parks and Recreation   | 70000  | 1       | 1             | Parks and Recreation      |
| 3           | Tom        | Haverford | 36  | Male   | 1987-03-04 | Entrepreneur                        | 

50000  | 1       | 1             | Parks and Recreation      |
**Explanation:** This joins multiple tables to retrieve related data from all of them.

### Unions
**Definition:** Combine the result sets of two or more SELECT statements.
**Why & When:** To merge results from multiple queries into a single result set.

**Syntax:**
```sql
SELECT column1, column2
FROM table1
UNION
SELECT column1, column2
FROM table2;
```
**Example:**
```sql
SELECT first_name, last_name FROM employee_demographics
UNION
SELECT first_name, last_name FROM employee_salary;
```
**Sample Result:**
| first_name | last_name  |
|------------|------------|
| Leslie     | Knope      |
| Tom        | Haverford  |
| April      | Ludgate    |
| Ron        | Swanson    |
**Explanation:** This combines the results of the two SELECT statements, eliminating duplicate rows.

### String Functions
**Definition:** Functions to manipulate string data.
**Why & When:** To perform operations on string data, such as formatting or extracting parts of strings.

**Syntax:**
```sql
SELECT STRING_FUNCTION(column)
FROM table;
```
**Example:**
```sql
SELECT UPPER(first_name) FROM employee_demographics;
```
**Sample Result:**
| UPPER(first_name) |
|-------------------|
| LESLIE            |
| TOM               |
| APRIL             |
**Explanation:** This converts the `first_name` values to uppercase.

### Case Statements
**Definition:** Return values based on conditions.
**Why & When:** To execute conditional logic within a query.

**Syntax:**
```sql
SELECT column1,
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END
FROM table;
```
**Example:**
```sql
SELECT first_name, last_name, age,
CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS Age_Bracket
FROM employee_demographics;
```
**Sample Result:**
| first_name | last_name  | age | Age_Bracket      |
|------------|------------|-----|------------------|
| Leslie     | Knope      | 44  | Old              |
| Tom        | Haverford  | 36  | Old              |
| April      | Ludgate    | 29  | Young            |
| Jerry      | Gergich    | 61  | On Death's Door  |
**Explanation:** This categorizes employees into age brackets based on their age.

### Subqueries
**Definition:** A query within another query.
**Why & When:** To perform operations in a step-by-step manner or to use the result of one query in another.

**Syntax:**
```sql
SELECT column1
FROM table1
WHERE column1 IN (SELECT column1 FROM table2 WHERE condition);
```
**Example:**
```sql
SELECT * FROM employee_demographics
WHERE employee_id IN (SELECT employee_id FROM employee_salary WHERE dept_id = 1);
```
**Sample Result:**
| employee_id | first_name | last_name | age | gender | birth_date |
|-------------|------------|-----------|-----|--------|------------|
| 1           | Leslie     | Knope     | 44  | Female | 1979-09-25 |
| 3           | Tom        | Haverford | 36  | Male   | 1987-03-04 |
| 4           | April      | Ludgate   | 29  | Female | 1994-03-27 |
**Explanation:** This retrieves employees who are in the department with `dept_id` 1.

### Window Functions
**Definition:** Perform calculations across a set of table rows related to the current row.
**Why & When:** To perform complex calculations such as running totals, moving averages, etc.

**Syntax:**
```sql
SELECT column1, aggregate_function(column2) OVER (PARTITION BY column3 ORDER BY column4)
FROM table;
```
**Example:**
```sql
SELECT first_name, last_name, gender, AVG(salary) OVER (PARTITION BY gender) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;
```
**Sample Result:**
| first_name | last_name  | gender | avg_salary |
|------------|------------|--------|------------|
| Leslie     | Knope      | Female | 65000      |
| April      | Ludgate    | Female | 65000      |
| Donna      | Meagle     | Female | 65000      |
| Tom        | Haverford  | Male   | 57500      |
| Ben        | Wyatt      | Male   | 57500      |
| Andy       | Dwyer      | Male   | 57500      |
**Explanation:** This calculates the average salary for each gender, partitioning by gender.

```
This README.md file now provides a comprehensive overview of essential MySQL concepts for both beginner and intermediate stages. It includes definitions, syntax, code examples, brief explanations for why and when to use each topic, sample results for better understanding, and credits to Alex the Analyst's YouTube bootcamp series.
