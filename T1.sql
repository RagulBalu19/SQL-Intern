create database FoodDelivery;
use FoodDelivery;

CREATE TABLE Customer (
    CustomerID INT  PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Rating DECIMAL(2,1));

CREATE TABLE MenuItem (
    ItemID INT PRIMARY KEY,
    RestaurantID INT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID));


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));

CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItem(ItemID));

INSERT INTO Customer (CustomerId,Name, Email, Phone, Address) VALUES
(1001,'Ravi Kumar', 'ravi@example.com', '9876543210', 'Chennai'),
(1002, 'Anjali Sharma', 'anjali@example.com', '9876500001', 'Mumbai');

INSERT INTO Restaurant (RestaurantID,Name, Location, Rating) VALUES
(2001,'Spice Garden', 'Delhi', 4.3),
(2002, 'Pizza Hub', 'Bangalore', 4.0);

INSERT INTO MenuItem (ItemID,RestaurantID, Name, Price, Category) VALUES
(301,2001, 'Paneer Butter Masala', 220.00, 'Main Course'),
(302,2001, 'Garlic Naan', 40.00, 'Bread'),
(303,2002, 'Veg Pizza', 180.00, 'Pizza'),
(304,2002, 'Cheese Garlic Bread', 90.00, 'Starter');

INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount) VALUES
(401,1001, '2025-08-04 12:30:00', 260.00),
(402,1002, '2025-08-04 18:45:00', 270.00);

INSERT INTO OrderItem (OrderItemID, OrderID, ItemID, Quantity) VALUES
 (501,401,301,1),
 (502,401,302,1),
 (503,402,303,1),
 (504,402,304,1);
 
 
 SELECT * FROM Customer;
 SELECT * FROM OrderItem;
