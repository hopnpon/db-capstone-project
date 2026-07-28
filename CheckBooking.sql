DELIMITER //
CREATE PROCEDURE CheckBooking(IN input_BookingDate DATETIME, input_TableNumber INT)
	BEGIN 
	SELECT * FROM Bookings
		WHERE BookingDate=input_BookingDate AND TableNumber=input_TableNumber;
	END // 
DELIMITER ;  
CALL CheckBooking("2022-11-12", 3);