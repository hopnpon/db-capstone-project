DELIMITER //
CREATE PROCEDURE UpdateBooking (IN input_BookingID INT, IN input_BookingDate DATETIME)
	BEGIN 
		UPDATE Bookings SET BookingDate=input_BookingDate
		WHERE BookingID=input_BookingID;
	END // 
DELIMITER ;  

CALL UpdateBooking(5, "2022-12-17")


