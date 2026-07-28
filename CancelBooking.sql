DELIMITER //
CREATE PROCEDURE CancelBooking (IN input_BookingID INT)
	BEGIN 
		DELETE FROM Bookings 
		WHERE BookingID=input_BookingID;
	END // 
DELIMITER ;  

CALL CancelBooking(5);



