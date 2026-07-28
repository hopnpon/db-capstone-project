DELIMITER //
CREATE PROCEDURE AddBooking (IN input_BookingID INT, IN input_CustomerID INT, IN input_BookingDate DATETIME, IN input_TableNumber INT)
	BEGIN 
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) 
	VALUES (input_BookingID, input_CustomerID, input_BookingDate, input_TableNumber);
	END // 
DELIMITER ;  
CALL AddBooking(5, 2, "2022-12-30", 1);

