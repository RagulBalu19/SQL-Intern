# Food Delivery SQL Database

This project simulates a basic **Food Delivery System** using SQL. It includes multiple tables such as `Customer`, `Restaurant`, `MenuItem`, `Orders`, and `OrderItem`, along with sample data and practice SQL queries using clauses like `WHERE`, `AND`, `OR`, `ORDER BY`, `LIKE`, and `BETWEEN`.

---

## Database Tables

### 1. Customer
Stores information about the customers.

| Column       | Data Type | Description             |
|--------------|-----------|-------------------------|
| CustomerId   | INT       | Primary Key             |
| Name         | TEXT      | Customer name           |
| Email        | TEXT      | Email address           |
| Phone        | TEXT      | Contact number          |
| Address      | TEXT      | City                    |

---

### 2. Restaurant
Stores details of restaurants.

| Column       | Data Type | Description             |
|--------------|-----------|-------------------------|
| RestaurantID | INT       | Primary Key             |
| Name         | TEXT      | Restaurant name         |
| Location     | TEXT      | City of the restaurant  |
| Rating       | FLOAT     | Rating out of 5         |

---

### 3. MenuItem
Stores items available in restaurants.

| Column       | Data Type | Description             |
|--------------|-----------|-------------------------|
| ItemID       | INT       | Primary Key             |
| RestaurantID | INT       | Foreign Key to Restaurant |
| Name         | TEXT      | Item name               |
| Price        | FLOAT     | Price of the item       |
| Category     | TEXT      | E.g., Main Course, Bread |

---

### 4. Orders
Stores customer orders.

| Column     | Data Type | Description              |
|------------|-----------|--------------------------|
| OrderID    | INT       | Primary Key              |
| CustomerID | INT       | Foreign Key to Customer  |
| OrderDate  | DATETIME  | Date and time of order   |
| TotalAmount| FLOAT     | Total bill amount        |

---

### 5. OrderItem
Stores items in each order.

| Column       | Data Type | Description             |
|--------------|-----------|-------------------------|
| OrderItemID  | INT       | Primary Key             |
| OrderID      | INT       | Foreign Key to Orders   |
| ItemID       | INT       | Foreign Key to MenuItem |
| Quantity     | INT       | Quantity ordered        |

---

## Sample Data

Here’s the sample data used to populate the tables:

```sql
-- Customers
INSERT INTO Customer (CustomerId, Name, Email, Phone, Address) VALUES
(1001, 'Ravi Kumar', 'ravi@example.com', '9876543210', 'Chennai'),
(1002, 'Anjali Sharma', 'anjali@example.com', '9876500001', 'Mumbai');

-- Restaurants
INSERT INTO Restaurant (RestaurantID, Name, Location, Rating) VALUES
(2001, 'Spice Garden', 'Delhi', 4.3),
(2002, 'Pizza Hub', 'Bangalore', 4.0);

-- Menu Items
INSERT INTO MenuItem (ItemID, RestaurantID, Name, Price, Category) VALUES
(301, 2001, 'Paneer Butter Masala', 220.00, 'Main Course'),
(302, 2001, 'Garlic Naan', 40.00, 'Bread'),
(303, 2002, 'Veg Pizza', 180.00, 'Pizza'),
(304, 2002, 'Cheese Garlic Bread', 90.00, 'Starter');

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(401, 1001, '2025-08-04 12:30:00', 260.00),
(402, 1002, '2025-08-04 18:45:00', 270.00);

-- Order Items
INSERT INTO OrderItem (OrderItemID, OrderID, ItemID, Quantity) VALUES
(501, 401, 301, 1),
(502, 401, 302, 1),
(503, 402, 303, 1),
(504, 402, 304, 1);
````

---

## SQL Query Examples

### Basic Filtering

* Find customers from Mumbai:

```sql
SELECT * FROM Customer WHERE Address = 'Mumbai';
```

### AND Condition

* Menu items from Restaurant 2001 with price > 100:

```sql
SELECT * FROM MenuItem WHERE RestaurantID = 2001 AND Price > 100;
```

### OR Condition

* Orders from CustomerID 1001 or 1002:

```sql
SELECT * FROM Orders WHERE CustomerID = 1001 OR CustomerID = 1002;
```

### LIKE

* Items with "Garlic" in the name:

```sql
SELECT * FROM MenuItem WHERE Name LIKE '%Garlic%';
```

### BETWEEN

* Orders placed between two timestamps:

```sql
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2025-08-04 12:00:00' AND '2025-08-04 19:00:00';
```

### ORDER BY

* Menu items by descending price:

```sql
SELECT * FROM MenuItem ORDER BY Price DESC;
```

---