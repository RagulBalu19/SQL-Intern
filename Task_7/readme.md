##  Objective
Learn to create and use **SQL Views** to simplify complex queries, improve abstraction, and enhance security in a food delivery database.

## Tools
- DB Browser for SQLite  
- MySQL Workbench  

## Task Deliverables
- View definitions using `CREATE VIEW`
- Example queries that use the created views

---

## Database Schema
Tables used:
1. **Customer**
2. **Restaurant**
3. **MenuItem**
4. **Orders**
5. **OrderItem**



### 1️ Create View – `CustomerOrderDetails`

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
````

**Purpose:** Displays basic order info for each customer.

---

### 2 Create View – `FullOrderSummary`

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
```
```

-- 1. View all customer orders
SELECT * FROM CustomerOrderDetails;

-- 2. Orders above ₹250
SELECT * FROM CustomerOrderDetails
WHERE TotalAmount > 250;

-- 3. Pizza items from full order summary
SELECT * FROM FullOrderSummary
WHERE Category = 'Pizza';
```