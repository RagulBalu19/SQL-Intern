use fooddelivery;

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customer c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customer c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

UNION

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customer c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT 
    c.Name AS CustomerName,
    r.Name AS RestaurantName,
    m.Name AS MenuItem,
    m.Price,
    oi.Quantity,
    (m.Price * oi.Quantity) AS SubTotal
FROM Customer c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderItem oi ON o.OrderID = oi.OrderID
INNER JOIN MenuItem m ON oi.ItemID = m.ItemID
INNER JOIN Restaurant r ON m.RestaurantID = r.RestaurantID;
