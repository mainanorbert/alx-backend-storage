-- SQL script that creates a trigger that decreases the quantity
CREATE TRIGGER decrease_quantity_of_items
AFTER INSERT ON orders
FOR EACH ROW
	UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;

