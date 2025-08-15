use fooddelivery;

DELIMITER $$

CREATE PROCEDURE GetOrdersByCustomer(
    IN cust_id INT
)
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = cust_id;
END $$

DELIMITER ;

CALL GetOrdersByCustomer(1001);

DELIMITER $$

CREATE FUNCTION GetTotalSpentByCustomer(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);

    SELECT SUM(TotalAmount)
    INTO total_spent
    FROM Orders
    WHERE CustomerID = cust_id;

    RETURN IFNULL(total_spent, 0);
END $$

DELIMITER ;

SELECT GetTotalSpentByCustomer(1001) AS TotalSpent;
