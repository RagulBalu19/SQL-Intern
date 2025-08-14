use fooddelivery;

CREATE VIEW CustomerOrderDetails AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM 
    Customer c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW FullOrderSummary AS
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    r.Name AS RestaurantName,
    m.Name AS ItemName,
    m.Category,
    m.Price,
    oi.Quantity,
    (m.Price * oi.Quantity) AS ItemTotal,
    o.TotalAmount
FROM 
    Orders o
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
JOIN 
    OrderItem oi ON o.OrderID = oi.OrderID
JOIN 
    MenuItem m ON oi.ItemID = m.ItemID
JOIN 
    Restaurant r ON m.RestaurantID = r.RestaurantID;


SELECT * FROM CustomerOrderDetails;


SELECT * FROM CustomerOrderDetails
WHERE TotalAmount > 250;


SELECT * FROM FullOrderSummary
WHERE Category = 'Pizza';
