## Objective

Learn how to create reusable SQL logic using **Stored Procedures** and **Functions**.

## 🛠 Tools

* **DB Browser for SQLite** *(if supported)* or
* **MySQL Workbench** *(recommended for stored procedures & functions)*

##  Deliverables

* One **Stored Procedure** with parameters and conditional logic.
* One **Function** that returns a value based on input.

---

## Overview

Stored Procedures and Functions help in **modularizing SQL logic**, making queries reusable, secure, and easier to maintain.

* **Stored Procedure**: A precompiled set of SQL statements that can take parameters and perform actions.
* **Function**: Similar to procedures but must return a single value and can be used in SELECT queries.

---

## Example Queries

### 1️ Stored Procedure: Get Orders by Customer

```sql
DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN custID INT)
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = custID;
END $$

DELIMITER ;
```

**Usage:**

```sql
CALL GetCustomerOrders(1001);
```

---

### 2️ Function: Calculate Order Total

```sql
DELIMITER $$

CREATE FUNCTION CalculateOrderTotal(orderID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(m.Price * oi.Quantity)
    INTO total
    FROM OrderItem oi
    JOIN MenuItem m ON oi.ItemID = m.ItemID
    WHERE oi.OrderID = orderID;
    RETURN total;
END $$

DELIMITER ;
```

**Usage:**

```sql
SELECT CalculateOrderTotal(401) AS TotalAmount;
```

