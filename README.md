# Online Food Delivery System (SQL Project)

A simple SQL-based project for designing a food delivery database, as part of SQL Developer Internship – Task 1.

---

## Domain: Food Delivery

Customers place orders from restaurants. Each order includes multiple menu items.

## Tables Created

- *Customer* (CustomerID, Name, Email, Phone, Address)
- *Restaurant* (RestaurantID, Name, Location, Rating)
- *MenuItem* (ItemID, RestaurantID, Name, Price, Category)
- *Order* (OrderID, CustomerID, OrderDate, TotalAmount)
- *OrderItem* (OrderItemID, OrderID, ItemID, Quantity)

## 🔗 Relationships

- 1 Customer → M Orders  
- 1 Restaurant → M MenuItems  
- 1 Order ↔ M MenuItems (via OrderItem)
  
## Tools Used

- MySQL Workbench    
- GitHub (submission)

## ER Diagram
<img width="1352" height="674" alt="Screenshot 2025-08-04 204622" src="https://github.com/user-attachments/assets/7a1c40b5-cd60-4138-b064-b9729616dae4" />


## Key Concepts

- DDL: CREATE TABLE, AUTO_INCREMENT, FOREIGN KEY
- Normalization (1NF–3NF)
- Composite & Surrogate Keys
- Many-to-Many relationship (OrderItem)

## Files in Repo

- T1.sql – SQL script with schema + data  
- er-diagram.png – ER diagram image  
- README.md – Project overview (this file)

## Instructions

1. Run T1.sql in MySQL Workbench.
2. View ER diagram using er-diagram.png.
3. Explore using:
```sql
SELECT * FROM Customer;
SELECT * FROM OrderItem;
