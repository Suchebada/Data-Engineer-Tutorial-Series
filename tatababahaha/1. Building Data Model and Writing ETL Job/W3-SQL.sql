-- Get all columns from Customers table
SELECT * FROM Customers;
-- Write a statement that will select the City column from the Customers table.
SELECT City FROM Customers;
-- Select all the different values from the Country column in the Customers table.
SELECT DISTINCT Country FROM Customers;
-- Select all records where the City column has the value "Berlin".
SELECT * FROM Customers         -- Select all records where City is NOT "Berlin".
WHERE City = 'Berlin';             WHERE NOT City = 'Berlin';
-- Select all records where the City column has the value 'Berlin' or 'London'.
SELECT * FROM Customers
WHERE City = 'Berlin'
OR City = 'London';
-- Select all records from the Customers table, sort alphabetically first by column Country, then, by column City.
SELECT * FROM Customers
ORDER BY Country, City;
-- Insert a new record in the Customers table.
INSERT INTO Customers (
    CustomerName,
    Address,
    City,
    PostalCode,
    Country)
VALUES (
    'Hekkan Burger',
    'Gateveien 15',
    'Sandnes',
    4306,
    'Norway');
-- Select all records from the Customers where the PostalCode column is empty.
SELECT * FROM Customers
WHERE PostalCode IS NULL;
-- Select all records from the Customers where the PostalCode column is NOT empty.
SELECT * FROM Customers
WHERE PostalCode IS NOT NULL;
-- Update/Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
UPDATE Customers
SET City = 'Oslo'
WHERE Country = 'Norway';
-- Update the City value and the Country value.
UPDATE Customers
SET City = 'Oslo',
Country = 'Norway'
WHERE CustomerID = 32;
-- Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM Customers                   -- Delete all the records from the Customers table.
WHERE Country = 'Norway';                  DELETE FROM Customers;
-- Aggregation
SELECT MIN(Price)     MAX(Price)      AVG(Price)          SUM(Price)      
FROM Products;
-- Select all records where the value of the City column starts with the letter "a".
SELECT * FROM Customers     -- ends with the letter "a"     -- contains letter "a"      -- starts with "a" ends with "b"    -- does NOT start w "a"
WHERE City LIKE 'a%';        WHERE City LIKE '%a';            WHERE City LIKE '%a%';    WHERE City LIKE 'a%b';               WHERE City NOT LIKE 'a%';
-- Select all records where the second letter of the City is an "a".
SELECT * FROM Customers
WHERE City LIKE '_a%';
-- Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT * FROM Customers
WHERE City LIKE '[acs]%';
-- Select all records where the first letter of the City starts with anything from an "a" to an "f"
SELECT * FROM Customers
WHERE City LIKE '[a-f]%';
-- Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
SELECT * FROM Customers
WHERE City LIKE '[!acf]%';
-- Use the IN operator to select all the records where Country is either "Norway" or "France".
SELECT * FROM Customers                                 -- Country is NOT "Norway" and "France"
WHERE Country IN ('Norway', 'France');                  WHERE Country NOT IN ('Norway', 'France');
-- Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20.
SELECT * FROM Products                                  -- where Price NOT between 10 and 20
WHERE Price BETWEEN 10 AND 20;                          WHERE Price NOT BETWEEN 10 AND 20;
-- Select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
SELECT * FROM Products
WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova';
-- Join the two tables Orders and Customers, using the CustomerID field in both tables as the relationship between the two tables.
SELECT *
FROM Orders                                         -- Select all records from two tables where there is a match in both tables.
LEFT JOIN Customers                                 INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
-- Select all the records from the Customers table plus all the matches in the Orders table.
SELECT *
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
-- List the number of customers in each country, ordered by the country with the most customers first.
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
-- Create new database, testDB              -- Delete database, testDB
CREATE DATABASE testDB;                     DROP DATABASE testDB;
-- Create new table, Persons                -- Delete table, Persons
CREATE TABLE Persons (                      DROP TABLE Persons;
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);
-- Use the TRUNCATE statement to delete all data inside a table.
TRUNCATE TABLE Persons;
-- Add a column of type DATE called Birthday.
ALTER TABLE Persons
ADD Birthday DATE;
-- Delete the column Birthday from the Persons table.
ALTER TABLE Persons
DROP COLUMN Birthday;