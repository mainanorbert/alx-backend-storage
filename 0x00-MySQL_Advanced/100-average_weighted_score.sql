-- script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- procedure computes and store the average weighted score for a student.

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	DECLARE t_weight DECIMAL(10, 2);
	DECLARE w_sum DECIMAL(10, 2);

	SELECT SUM(weight * score), SUM(weight) INTO w_sum, t_weight
	FROM corrections
	JOIN projects ON corrections.project_id = projects.id
	WHERE corrections.user_id = user_id;

	if t_weight > 0 THEN
		UPDATE users
		SET average_score = w_sum / t_weight
		WHERE id = user_id;
	ELSE
		UPDATE users
		SET average_score = 0
		WHERE id = user_id;
	END IF;
END; //
DELIMITER ;
