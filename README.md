**Project Title:** Building Inspection Management System  
**SDG Goal:** SDG 11 – Sustainable Cities and Communities  
**Problem Solved:** Ensures proper building maintenance and inspection tracking to promote safe, sustainable urban infrastructure in Manila.

## Project Description
This project uses a relational database with three main tables: `Owner`, `Building`, and `Inspection`. Core DBMS concepts implemented include:

- **Normalization (3NF):** Eliminates redundancy and ensures data integrity.  
- **Foreign Keys and Constraints:** Enforce relationships and prevent invalid data entry.  
- **Stored Procedures:** Encapsulate transactional logic while maintaining ACID properties.  
- **Views:** Simplify reporting for failed/passed inspections and buildings per owner.  
- **Entity-Relationship Modeling:** Defines real-world relationships, e.g., one owner → many buildings, one building → one inspection.

The system supports city audits by allowing easy tracking of building inspections and compliance with safety standards.

## Installation / Setup
1. Install MySQL or MariaDB.  
2. Open the Command Line Interface (CLI) or MySQL Shell.  
3. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>

  Run the SQL scripts in the following order:
  mysql -u root -p sdg11_db < 1_SQL_SCRIPTS/1.1_DDL_Schema.sql
  mysql -u root -p sdg11_db < 1_SQL_SCRIPTS/1.2_DML_TestData.sql
  mysql -u root -p sdg11_db < 1_SQL_SCRIPTS/1.3_StoredLogic.sql
  mysql -u root -p sdg11_db < 1_SQL_SCRIPTS/1.4_DCL_Users.sql

  mysql -u <username> -p
  USE sdg11_db;

  RUN THIS EXAMPLE QUERIES:
  SELECT * FROM passed_inspections;
  Select * From faield_inspections"
  CALL add_building();
  CALL delete_building();


  CONTRIBUTORS;

  SEAN XANDER AGUIRRE - Main Leader of the group, Refined SDG and problem statement, developed ERD diagrams, led stored procedures and views, participated in ACID testing, 
                        consolidated documentation, completed transaction flowchart, coordinated presentation, assisted in CLI testing and debugging.

  MELJOHN VERA -        Refined SDG and problem statement, assisted conceptual ERD, supported SDAD document writing/editing, set GitHub collaboration guidelines, 
                        participated in DDL and normalization, helped produce consistent mock data, supported stored procedures and views development,
                        participated in ACID testing, consolidated documentation, completed transaction flowchart, coordinated presentation, assisted with final CLI testing and debugging.

  ALLEN ILOSEO -        Assisted in SDG and problem statement, contributed to logical and physical ERD, wrote and reviewed SDAD sections, managed GitHub workflow, implemented DDL and normalization, 
                        generated mock data, led transactional stored procedure development, created views, conducted ACID compliance tests, refined documentation and flowchart, 
                        prepared presentation, tested and debugged system.
  
