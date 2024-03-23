-- script that creates a stored procedure ComputeAverageWeightedScoreForUsers
-- script computes and store the average weighted score for all students.

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
	DECLARE user_id INT;
	DECLARE t_weight DECIMAL(10, 2);
	DECLARE w_sum DECIMAL(10, 2);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT id FROM users;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	OPEN cur;
	read_loop: LOOP
		FETCH cur INTO user_id;
		IF done THEN
			LEAVE read_loop;
		END IF;
		-- CALL ComputeAverageWeightedScoreForUser(user_id);
		-- DECLARE t_weight DECIMAL(10, 2);
		-- DECLARE w_sum DECIMAL(10, 2);
		SELECT SUM(weight * score), SUM(weight) INTO w_sum, t_weight
		FROM corrections
		JOIN projects ON corrections.project_id = projects.id
		WHERE corrections.user_id = user_id;
		IF t_weight > 0 THEN
			UPDATE users
			SET average_score = w_sum / t_weight
			WHERE id = user_id;
		ELSE
			UPDATE users
			SET average_score = 0
			WHERE id = user_id;
		END IF;
	END LOOP;
	CLOSE cur;
END; //
DELIMITER ;
