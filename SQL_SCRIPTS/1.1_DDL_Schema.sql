CREATE TABLE owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL
);

CREATE TABLE building (
    building_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    building_name VARCHAR(100) NOT NULL,
    location VARCHAR(200) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

CREATE TABLE inspection (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    building_id INT NOT NULL,
    inspection_date DATE NOT NULL,
    status ENUM('PASSED','FAILED') NOT NULL,
    notes TEXT,
    FOREIGN KEY (building_id) REFERENCES building(building_id)
);
