CREATE DATABASE employee;
USE employee;

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100)
);

CREATE TABLE location(
location_id INT PRIMARY KEY,
location VARCHAR(30)
);
SHOW TABLES;


CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
gender ENUM('M','F'),
age INT,
hire_data DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2)
);
DESCRIBE employees;

SELECT*FROM employees;

-- 2 ALTER
ALTER TABLE employees
ADD email VARCHAR(100);     -- ADDED EMAIL COLUMN

ALTER TABLE employees
MODIFY designation VARCHAR(150);   -- MODIFIED TO WIDE RANGE

ALTER TABLE employees
DROP COLUMN age;               -- DROPPED AGE COLUMN

ALTER TABLE employees
RENAME COLUMN hire_data TO date_of_joining;   -- column renaming

-- 3. RENAME
RENAME TABLE departments TO department_info;      -- table renaming
RENAME TABLE location TO locations;  

-- 4.TRUNCATE
TRUNCATE TABLE employees;
-- 5.DROP
DROP TABLE employees;    -- DROPING TABLE
DROP DATABASE employee;     -- DROPING DATABASE
 
 -- CONSTRAINTS

CREATE DATABASE employee;
USE employee;

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL UNIQUE 
);
CREATE TABLE location(
location_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
gender ENUM('M','F'),
age INT CHECK(age>=18),
hire_data DATE DEFAULT('CURRENT DATE'),
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2),
FOREIGN KEY(department_id)REFERENCES departments(department_id),
FOREIGN KEY(location_id)REFERENCES location(location_id)
);