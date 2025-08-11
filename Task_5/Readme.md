
---

# Food Ordering Database – Join Queries

## **Objective**

Learn to combine data from multiple tables using different types of SQL JOINs.

## **Tools Used**

* **DB Browser for SQLite** / **MySQL Workbench**

## **Database Schema**

The project contains five main tables:

1. **Customer** – Stores customer details.
2. **Restaurant** – Stores restaurant details.
3. **MenuItem** – Stores menu items offered by restaurants.
4. **Orders** – Stores order information for each customer.
5. **OrderItem** – Stores individual items ordered.

**ER Diagram**

```
Customer --< Orders --< OrderItem >-- MenuItem >-- Restaurant
```

---

## **Sample Data**

```sql
INSERT INTO Customer VALUES
(1, 'John Doe', 'john@example.com', '9876543210', 'New York'),
(2, 'Alice Smith', 'alice@example.com', '9123456780', 'Los Angeles');

INSERT INTO Restaurant VALUES
(1, 'Spicy Hub', 'New York', 4.5),
(2, 'Pizza Palace', 'Los Angeles', 4.2);

INSERT INTO MenuItem VALUES
(1, 1, 'Chicken Curry', 12.99, 'Main Course'),
(2, 1, 'Veg Biryani', 9.99, 'Main Course'),
(3, 2, 'Margherita Pizza', 8.99, 'Pizza'),
(4, 2, 'Pepperoni Pizza', 10.99, 'Pizza');

INSERT INTO Orders VALUES
(101, 1, '2025-08-10', 22.98),
(102, 2, '2025-08-11', 19.98);

INSERT INTO OrderItem VALUES
(1, 101, 1, 1),
(2, 101, 2, 1),
(3, 102, 3, 2);
```

---

## **SQL Queries Using JOINs**

### ** INNER JOIN** – Get customer orders with item names

```sql
SELECT c.Name AS CustomerName, o.OrderID, m.Name AS ItemName, oi.Quantity
FROM Customer c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderItem oi ON o.OrderID = oi.OrderID
INNER JOIN MenuItem m ON oi.ItemID = m.ItemID;
```

---

### ** LEFT JOIN** – Show all customers and their orders (even if no orders exist)

```sql
SELECT c.Name, o.OrderID, o.TotalAmount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

---

### ** RIGHT JOIN** – Show all orders with customer names (even if customer info missing)

```sql
SELECT o.OrderID, c.Name, o.TotalAmount
FROM Orders o
RIGHT JOIN Customer c ON o.CustomerID = c.CustomerID;
```

*(Note: For SQLite, use `LEFT JOIN` with swapped tables since RIGHT JOIN is not supported.)*

---

### ** FULL OUTER JOIN** – List all customers and orders (matching or not)

```sql
SELECT c.Name, o.OrderID, o.TotalAmount
FROM Customer c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;
```

*(Note: Not supported in MySQL/SQLite directly; use `UNION` of LEFT and RIGHT joins.)*

---

## **Outcome**

By completing these queries, you will:

* Understand **how to merge data** from multiple related tables.
* Gain practical experience with **INNER, LEFT, RIGHT, and FULL OUTER JOIN**.
* Be able to work with relational database structures efficiently.

---