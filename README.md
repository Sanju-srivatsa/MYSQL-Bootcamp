
---

# MySQL Beginner Stage Cheatsheet

## 1. Installing MySQL and Creating Databases
- **Definition**: Installation of MySQL server and client tools, and creating a database to store tables and data.
- **Example**:
    ```sql
    DROP DATABASE IF EXISTS `Parks_and_Recreation`;
    CREATE DATABASE `Parks_and_Recreation`;
    USE `Parks_and_Recreation`;
    ```

## 2. Select Statement in MySQL
- **Definition**: The `SELECT` statement is used to query and retrieve data from a database.
- **Example**:
    ```sql
    SELECT first_name, last_name FROM employee_demographics;
    ```

## 3. Where Clause in MySQL
- **Definition**: The `WHERE` clause is used to filter records that meet a certain condition.
- **Example**:
    ```sql
    SELECT * FROM employee_salary WHERE salary > 50000;
    ```

## 4. Group By and Order By in MySQL
- **Group By**:
  - **Definition**: The `GROUP BY` statement is used to arrange identical data into groups.
  - **Example**:
    ```sql
    SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;
    ```

- **Order By**:
  - **Definition**: The `ORDER BY` statement is used to sort the result set in ascending or descending order.
  - **Example**:
    ```sql
    SELECT * FROM employee_demographics ORDER BY age DESC;
    ```

## 5. Having vs Where in MySQL
- **Where**:
  - **Definition**: The `WHERE` clause is used to filter records before any groupings are made.
  - **Example**:
    ```sql
    SELECT * FROM employee_demographics WHERE age > 30;
    ```

- **Having**:
  - **Definition**: The `HAVING` clause is used to filter records after groupings are made.
  - **Example**:
    ```sql
    SELECT gender, AVG(age) avg_age FROM employee_demographics GROUP BY gender HAVING avg_age > 35;
    ```

## 6. Limit and Aliasing in MySQL
- **Limit**:
  - **Definition**: The `LIMIT` clause is used to specify the number of records to return.
  - **Example**:
    ```sql
    SELECT * FROM employee_demographics LIMIT 5;
    ```

- **Aliasing**:
  - **Definition**: Aliasing is a temporary name given to a table or column for the purpose of a particular SQL query.
  - **Example**:
    ```sql
    SELECT gender, AVG(age) AS average_age FROM employee_demographics GROUP BY gender;
    ```

## Example Database and Tables

### Database: `Parks_and_Recreation`
This example database contains information about employees in a fictional Parks and Recreation department.

### Tables
- **employee_demographics**: Stores demographic information about employees.
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

- **employee_salary**: Stores salary and occupation details of employees.
    ```sql
    CREATE TABLE employee_salary (
      employee_id INT NOT NULL,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      occupation VARCHAR(50),
      salary INT,
      dept_id INT
    );
    ```

- **parks_departments**: Stores information about different departments.
    ```sql
    CREATE TABLE parks_departments (
      department_id INT NOT NULL AUTO_INCREMENT,
      department_name VARCHAR(50) NOT NULL,
      PRIMARY KEY (department_id)
    );
    ```

## Sample Data Insertions
```sql
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27');

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1);
```

---
