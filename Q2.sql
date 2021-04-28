--a)
SELECT COUNT(OrderID)
FROM Orders;
-- There are a total of 196 orders

--b)
SELECT LastName
FROM Employees
WHERE EmployeeID IN (
SELECT EmployeeID
FROM Orders
GROUP BY EmployeeID
ORDER BY COUNT(EmployeeID) DESC
LIMIT 1);
-- The Employee with the LastName "Peacock" has the most orders

--c)
SELECT ProductName 
FROM Products
WHERE ProductID IN(
SELECT ProductID
FROM OrderDetails
WHERE OrderID IN (
SELECT OrderID
FROM Orders
WHERE Orders.CustomerID IN (
SELECT CustomerID
FROM Customers
WHERE Country = 'Germany'))
GROUP BY ProductID
ORDER BY SUM(Quantity) DESC
LIMIT 1);
-- The best-selling item to German customers is "boston crab meat"

