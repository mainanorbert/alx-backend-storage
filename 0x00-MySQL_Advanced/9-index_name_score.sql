-- creates an index idx_name_first_score on the table names 
-- The first letter of name and the score
CREATE INDEX idx_name_first_score on names(name(1), score);
