use FoodDelivery;

SELECT 
    COUNT(*) AS TotalOrders,
    AVG(TotalAmount) AS AverageOrderAmount,
    MAX(TotalAmount) AS MaxOrderAmount,
    MIN(TotalAmount) AS MinOrderAmount
FROM Orders;


SELECT 
    m.Category,
    SUM(oi.Quantity) AS TotalItemsOrdered
FROM OrderItem oi
JOIN MenuItem m ON oi.ItemID = m.ItemID
GROUP BY m.Category;

SELECT 
    m.Category,
    SUM(oi.Quantity) AS TotalItemsOrdered
FROM OrderItem oi
JOIN MenuItem m ON oi.ItemID = m.ItemID
GROUP BY m.Category
HAVING SUM(oi.Quantity) > 1;


SELECT 
    c.Name,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent,
    AVG(o.TotalAmount) AS AvgOrderValue
FROM Customer c
JOIN Orders o ON c.CustomerId = o.CustomerID
GROUP BY c.Name
HAVING SUM(o.TotalAmount) > 250;
