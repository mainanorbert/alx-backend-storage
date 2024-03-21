-- trigger that resets the attribute valid_email only when the email has bee
DELIMITER //
CREATE TRIGGER onchange_reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
	BEGIN
		If NEW.email != OLD.email THEN
			SET NEW.valid_email = 0;
		END IF;
	END; //
DELIMITER ;
