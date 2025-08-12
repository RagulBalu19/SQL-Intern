use fooddelivery;

SELECT 
    Name,
    (SELECT SUM(TotalAmount) 
     FROM Orders 
     WHERE CustomerID = Customer.CustomerID) AS TotalSpent
FROM Customer;


SELECT Name
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
);


SELECT RestaurantID, AvgPrice
FROM (
    SELECT RestaurantID, AVG(Price) AS AvgPrice
    FROM MenuItem
    GROUP BY RestaurantID
) AS PriceTable;

SELECT Name, Price
FROM MenuItem m
WHERE Price > (
    SELECT AVG(Price)
    FROM MenuItem
    WHERE RestaurantID = m.RestaurantID
);

SELECT Name, Price
FROM MenuItem m
WHERE Price < (
    SELECT AVG(Price)
    FROM MenuItem
    WHERE RestaurantID = m.RestaurantID
);
