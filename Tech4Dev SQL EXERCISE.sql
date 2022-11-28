CREATE DATABASE Lab1

--EXERCISE - PART 1
USE ASSIGNMENT
SELECT * 
FROM SampleSuperstore
--Select all the record where Region = South
SELECT *
FROM SampleSuperstore
WHERE Region = 'South';


--How many records does South region have? Set column name as 'South_Region'

SELECT COUNT(Region) AS South_Region
FROM SampleSuperstore
WHERE Region = 'South';


-- Count of sales of all Regions

SELECT Region, COUNT(Sales) AS Count_of_Sales
FROM SampleSuperstore
GROUP BY Region;


--Count of sales of all regions by category 

SELECT Region, Category, COUNT(Sales) AS Count_of_Sales
FROM SampleSuperstore
GROUP BY Region, Category;


--Sort the sales in DESC order 

SELECT *
FROM SampleSuperstore
ORDER BY Sales DESC;


--Display the category and subcategory where profit is negative

SELECT Category, Subcategory, Profit
FROM SampleSuperstore
WHERE Profit LIKE '-%';


-- Total Sales of all the states
SELECT State, SUM(Sales) AS Sum_of_Sales
FROM SampleSuperstore
GROUP BY State;



--Which State has the most number of negative profit

SELECT TOP 1
State, COUNT(Profit) AS Most_Negative_Profit
FROM SampleSuperstore
WHERE Profit LIKE '-%'
GROUP BY State
ORDER BY COUNT(Profit) DESC;


--Which Region has the most number of negative profit

SELECT TOP 1
Region, COUNT(Profit) AS Most_Negative_Profit
FROM SampleSuperstore
WHERE Profit LIKE '-%'
GROUP BY Region
ORDER BY COUNT(Profit) DESC;


--Select catagories whose profit lies between 50, 100

SELECT Category, Profit
FROM SampleSuperstore
WHERE Profit BETWEEN 50 AND 100;


-- DISPLAY THE COUNT OF EACH SUBCATEGORY WITH PROFIT BETWEEN 50 AND 100

SELECT Subcategory, COUNT(Subcategory)
FROM SampleSuperstore
WHERE Profit BETWEEN 50 AND 100
GROUP BY Subcategory;



-- DISPLAY THE COUNT OF EACH SUBCATEGORY WITH PROFIT BETWEEN 50 AND 100 for each country

SELECT Country, Subcategory, COUNT(Subcategory)
FROM SampleSuperstore
WHERE Profit BETWEEN 50 AND 100
GROUP BY Subcategory, Country;



--Which country has on average higher quantities of dairy and snacks products

SELECT Country, Category, AVG(Quantity)
FROM SampleSuperstore
WHERE Category IN ('Dairy','Snacks')
GROUP BY Country, Category;


--EXERCISE - PART 2

--1&2. CREATE TABLE COUNTRIES

USE ASSIGNMENT
CREATE TABLE countries(
country_id INT PRIMARY KEY NOT NULL,
country_name VARCHAR(20) NOT NULL,
region_id INT NOT NULL,
);

--3. 

USE ASSIGNMENT
CREATE TABLE jobs(
job_id INT PRIMARY KEY,
job_title VARCHAR(30),
min_salary INT NOT NULL,
max_salary INT,
);

INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (1,' ', 8000, 0)

SELECT * FROM jobs

--4.

USE ASSIGNMENT
CREATE TABLE the_production_company(
productioncompanyid INT PRIMARY KEY,
productioncompany VARCHAR(30),
abbreviation VARCHAR(3),
);

INSERT INTO the_production_company (productioncompanyid,productioncompany,abbreviation)
VALUES (1, 'Solex','SLX'),
(
2, 'Edrich','EDR'),
(
3,'Knewrow','KNR');

SELECT * 
FROM the_production_company

--ALTER TABLES

--1.
USE ASSIGNMENT
CREATE TABLE orders(
order_id INT PRIMARY KEY,
);

USE ASSIGNMENT
CREATE TABLE employees(
employee_id INT PRIMARY KEY,
);

USE ASSIGNMENT
CREATE TABLE job_history(
job_id INT PRIMARY KEY,
);

USE ASSIGNMENT
CREATE TABLE locations(
location_id INT PRIMARY KEY,
);

USE ASSIGNMENT
CREATE TABLE regions(
region_id INT PRIMARY KEY,
);

--rename countries to country_new

EXEC sp_rename 'dbo.countries', 'country_new'

--2
EXEC sp_rename 'dbo.employees.employee_id', 'country_id', 'COLUMN'
ALTER TABLE employees ADD location_id INT
ALTER TABLE employees ADD street_address VARCHAR(20)
ALTER TABLE employees ADD postal_code INT
ALTER TABLE employees ADD city VARCHAR(20)
ALTER TABLE employees ADD state_province VARCHAR(20);


ALTER TABLE locations ADD region_id INT

--3

ALTER TABLE locations
ALTER COLUMN region_id VARCHAR;

--4

ALTER TABLE employees 
DROP COLUMN state_province;

--UPDATE TABLES

--1

CREATE TABLE Employee(
Employee_id INT,
First_name VARCHAR(20),
Last_name VARCHAR(20),
email VARCHAR,
Phone_number INT
);

INSERT INTO Employee(Employee_id, First_name,Last_name,email, Phone_number)
VALUES (100, 'musa','nuhu','musa@gmail.com',0812345678),
(
200, 'amaka','lot','lot@gmail.com',09012345678),
(
300, 'abiola','moses','ab@gmail.com',07033445566),
(
400, 'ubong','willa','willa@gmail.com',08022113388);

UPDATE Employee SET email = 'not available' WHERE Employee_id = 100;
UPDATE Employee SET email = 'not available' WHERE Employee_id = 200;
UPDATE Employee SET email = 'not available' WHERE Employee_id = 300;
UPDATE Employee SET email = 'not available' WHERE Employee_id = 400;


--INSERT INTO
--1
CREATE TABLE travelers(
country_id VARCHAR(2),
country_name VARCHAR(40),
region_id NUMERIC(10,0)
);

--2
INSERT INTO travelers(country_id, country_name,region_id)
VALUES ('USA', 'United States',16345),
(
'NGR', 'Nigeria', 45678),
(
'CAN', 'Canada', 53433);