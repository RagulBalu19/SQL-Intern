# Food Delivery SQL – Aggregate & Grouping Queries

This section of the project demonstrates how to analyze tabular data using **SQL aggregate functions**, **GROUP BY**, and **HAVING** clauses on the food delivery database.

---

## Objectives

- Apply aggregate functions like `SUM`, `COUNT`, `AVG`, `MIN`, and `MAX`
- Use `GROUP BY` to summarize data into categories
- Use `HAVING` to filter grouped results based on conditions

---

## Tables Used

- `Orders`: Stores customer orders with total amounts
- `MenuItem`: Stores item details like name, price, category
- `OrderItem`: Maps each order to multiple items and quantities
- `Customer`: Stores customer personal info

---

## Sample Queries

### Total Order Summary
```sql
SELECT 
    COUNT(*) AS TotalOrders,
    AVG(TotalAmount) AS AverageOrderAmount,
    MAX(TotalAmount) AS MaxOrderAmount,
    MIN(TotalAmount) AS MinOrderAmount
FROM Orders;
