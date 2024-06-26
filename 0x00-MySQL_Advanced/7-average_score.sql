-- script that creates a stored procedure ComputeAverageScoreForUser
DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE total_score DECIMAL(10, 2);
	DECLARE total_proj INT;

	SELECT SUM(score), COUNT(DISTINCT project_id)
	INTO total_score, total_proj
	FROM corrections
	WHERE corrections.user_id = user_id;
	UPDATE users
	SET users.average_score = IFNULL(total_score / total_proj, 0)
	WHERE users.id = user_id;
END;//
DELIMITER ;
