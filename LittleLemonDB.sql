DELIMITER //  

CREATE PROCEDURE CancelOrder(IN input_OrderID INT)
BEGIN 
	DELETE FROM Orders
	WHERE OrderID=input_OrderID;
END // 
DELIMITER ;  




