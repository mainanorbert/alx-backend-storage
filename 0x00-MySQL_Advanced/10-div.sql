--  SQL script that creates a function SafeDiv 
-- Divides i(and returns) the first by the second number or returns 0 if the second number is equal to 0.
DELIMITER //
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE quotient FLOAT DEFAULT 0;
	IF b = 0 THEN
		RETURN quotient;
	ELSE
		SET quotient = a / b;
		RETURN quotient;
	END IF;
END; //
DELIMITER ;
