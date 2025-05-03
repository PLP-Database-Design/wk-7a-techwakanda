-- Question 1 
USE salesdb;
-- 1. Create the original (denormalized) table
-- CREATE TABLE ProductDetail (
--   OrderID        INT        NOT NULL,
--   CustomerName   VARCHAR(100) NOT NULL,
--   Products       VARCHAR(500) NOT NULL
-- );

-- 2. Insert the sample data
-- INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
--   (101, 'John Doe',    'Laptop, Mouse'),
--   (102, 'Jane Smith',  'Tablet, Keyboard, Mouse'),
--   (103, 'Emily Clark', 'Phone');

-- 3. Create the new 1NF table
 CREATE TABLE ProductDetail_1NF (
 OrderID        INT        NOT NULL,
   CustomerName   VARCHAR(100) NOT NULL,
   Product        VARCHAR(100) NOT NULL
 );

 -- Question 2
 Use salesdb;
-- 0. (Optional) Clean slate
-- DROP TABLE IF EXISTS OrderDetails;
-- DROP TABLE IF EXISTS Orders;

-- 1. Create and populate the original OrderDetails (already in 1NF)
-- CREATE TABLE OrderDetails (
--   OrderID       INT          NOT NULL,
--   CustomerName  VARCHAR(100) NOT NULL,
--   Product       VARCHAR(100) NOT NULL,
--   Quantity      INT          NOT NULL,
--   PRIMARY KEY (OrderID, Product)
-- );

-- INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
--   (101, 'John Doe',    'Laptop',   2),
--   (101, 'John Doe',    'Mouse',    1),
--   (102, 'Jane Smith',  'Tablet',   3),
--   (102, 'Jane Smith',  'Keyboard', 1),
--   (102, 'Jane Smith',  'Mouse',    2),
--   (103, 'Emily Clark', 'Phone',    1);

-- 2. Create the parent Orders table (OrderID → CustomerName)
-- CREATE TABLE Orders (
--   OrderID       INT          NOT NULL,
--   CustomerName  VARCHAR(100) NOT NULL,
--   PRIMARY KEY (OrderID)
-- );

-- 3. Populate Orders with one row per order
-- INSERT INTO Orders (OrderID, CustomerName)
-- SELECT DISTINCT OrderID, CustomerName
-- FROM OrderDetails;

-- 4. Create the child OrderItems table (composite key → Quantity)
-- CREATE TABLE OrderItems (
--   OrderID   INT          NOT NULL,
--   Product   VARCHAR(100) NOT NULL,
--   Quantity  INT          NOT NULL,
--   PRIMARY KEY (OrderID, Product),
--   FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
-- );

-- 5. Populate OrderItems with the remaining columns
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;