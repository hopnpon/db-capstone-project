DELIMITER //

CREATE PROCEDURE AddValidBooking(IN input_BookingDate DATETIME, IN input_TableNumber INT)
	BEGIN
	DECLARE bookingExists INT DEFAULT 0;
	START TRANSACTION;

	SELECT COUNT(*) INTO bookingExists
    FROM Bookings
    WHERE BookingDate = input_BookingDate AND TableNumber = input_TableNumber;
 	IF bookingExists > 0 THEN ROLLBACK;
	SELECT CONCAT('Table ', Table_Number, ' is already booked - booking cancelled') 
	AS "Booking Status";
	ELSE
	INSERT INTO Bookings (BookingDate, TableNumber)
	VALUES(input_BookingDate, input_TableNumber);        	
	COMMIT;
	SELECT 'Booking successful' AS "Booking Status";
    END IF;
END//

DELIMITER ;
CALL AddValidBooking("2022-10-10", 3);
