USE BiobankDB;

DELIMITER //

CREATE TRIGGER CheckSampleUsageQuantity
BEFORE INSERT ON SampleUsage
FOR EACH ROW
BEGIN
    IF NEW.quantity_used <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity used must be greater than zero';
    END IF;
END //

DELIMITER ;