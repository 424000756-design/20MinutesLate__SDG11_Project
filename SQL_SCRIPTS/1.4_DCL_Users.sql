DROP USER IF EXISTS 'auditor'@'localhost';
DROP USER IF EXISTS 'viewer'@'localhost';

CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'Auditor123!';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON sdg11_db.* TO 'auditor'@'localhost';

CREATE USER 'viewer'@'localhost' IDENTIFIED BY 'Viewer123!';
GRANT SELECT ON sdg11_db.* TO 'viewer'@'localhost';

FLUSH PRIVILEGES;