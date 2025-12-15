CREATE VIEW failed_inspections AS
SELECT 
    o.owner_name,
    b.building_id,
    b.building_name,
    b.location,
    i.inspection_date,
    i.status
FROM inspection i
JOIN building b ON i.building_id = b.building_id
JOIN owner o ON b.owner_id = o.owner_id
WHERE i.status='FAILED';

CREATE VIEW passed_inspections AS
SELECT 
    o.owner_name,
    b.building_id,
    b.building_name,
    b.location,
    i.inspection_date,
    i.status
FROM inspection i
JOIN building b ON i.building_id = b.building_id
JOIN owner o ON b.owner_id = o.owner_id
WHERE i.status='PASSED';

CREATE VIEW owner_buildings AS
SELECT 
    o.owner_name,
    b.building_id,
    b.building_name,
    b.location
FROM owner o
LEFT JOIN building b ON o.owner_id = b.owner_id;

DELIMITER $$

CREATE PROCEDURE update_status(
    IN p_inspection_id INT,
    IN p_new_status ENUM('PASSED','FAILED')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE inspection
    SET status = p_new_status
    WHERE inspection_id = p_inspection_id;

    COMMIT;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE add_building(
    IN p_owner_id INT,
    IN p_building_name VARCHAR(255),
    IN p_location VARCHAR(255),
    In p_status ENUM ('PASSED','FAILED'),
    IN p_inspection_date DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO building (owner_id, building_name, location)
    VALUES (p_owner_id, p_building_name, p_location);
    
    SET @new_building_id = LAST_INSERT_ID();
    
    INSERT INTO inspection (building_id, inspection_date, status)
    VALUES (@new_building_id, p_inspection_date, p_status);

    COMMIT;
END $$