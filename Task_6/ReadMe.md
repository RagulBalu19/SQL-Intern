# SQL Subquery Practice – Food Delivery Database

## **Objective**
Learn how to use subqueries in `SELECT`, `WHERE`, and `FROM` clauses with both scalar and correlated logic.

## **Tools**
- DB Browser for SQLite  
- MySQL Workbench

## **Database Schema**
The database contains the following tables:
- **Customer**: Stores customer details  
- **Restaurant**: Stores restaurant information  
- **MenuItem**: Contains menu items offered by restaurants  
- **Orders**: Stores order information for each customer  
- **OrderItem**: Stores individual items within an order  

## **Practice Queries**

### **1. Subquery in SELECT**
Get each customer’s total spending:
```sql
SELECT 
    Name,
    (SELECT SUM(TotalAmount) 
     FROM Orders 
     WHERE CustomerID = Customer.CustomerID) AS TotalSpent
FROM Customer;
````

---

### **2. Subquery in WHERE (IN)**

Find customers who have placed at least one order:

```sql
SELECT Name
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
);
```

---

### **3. Subquery in FROM**

Show average menu price for each restaurant:

```sql
SELECT RestaurantID, AvgPrice
FROM (
    SELECT RestaurantID, AVG(Price) AS AvgPrice
    FROM MenuItem
    GROUP BY RestaurantID
) AS PriceTable;
```

---

### **4. Correlated Subquery**

List menu items that cost more than their restaurant’s average price:

```sql
SELECT Name, Price
FROM MenuItem m
WHERE Price > (
    SELECT AVG(Price)
    FROM MenuItem
    WHERE RestaurantID = m.RestaurantID
);
```

---

## **Outcome**

By completing this module, you will:

* Understand scalar, correlated, and nested subqueries
* Use subqueries in `SELECT`, `WHERE`, and `FROM` clauses
* Apply `IN`, `EXISTS`, and comparison operators in subqueries
* Improve ability to write advanced SQL queries

---