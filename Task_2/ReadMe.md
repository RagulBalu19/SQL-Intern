# Food Delivery Database - SQL Query Guide

This README provides basic SQL examples for performing **INSERT**, **UPDATE**, and **DELETE** operations in a **Food Delivery** domain. This can be useful for managing data like customers, restaurants, orders, and menu items.

---

## Table Structure Overview

Here are some sample tables used in this guide:

### 1. `customers`
| Column        | Type         |
|---------------|--------------|
| customer_id   | INT (PK)     |
| name          | VARCHAR      |
| phone         | VARCHAR      |
| email         | VARCHAR      |

### 2. `restaurants`
| Column        | Type         |
|---------------|--------------|
| restaurant_id | INT (PK)     |
| name          | VARCHAR      |
| location      | VARCHAR      |
| rating        | FLOAT        |

### 3. `menu_items`
| Column        | Type         |
|---------------|--------------|
| item_id       | INT (PK)     |
| name          | VARCHAR      |
| price         | DECIMAL      |
| restaurant_id | INT (FK)     |

### 4. `orders`
| Column        | Type         |
|---------------|--------------|
| order_id      | INT (PK)     |
| customer_id   | INT (FK)     |
| order_date    | DATE         |
| total_amount  | DECIMAL      |

---

## INSERT Queries

### Insert a new customer
```sql
INSERT INTO customers (customer_id, name, phone, email)
VALUES (101, 'Rahul Sharma', '+919876543210', 'rahul@example.com');
