CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary INT
);

DELIMITER //
CREATE TRIGGER check_salary
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be >= 10000';
    END IF;
END //
DELIMITER ;

INSERT INTO Employee VALUES
(1,'ABC','IT',15000),
(2,'BCD','HR',12000),
(3,'CDE','Finance',18000),
(4,'DEF','IT',20000),
(5,'EFG','Sales',11000),
(6,'FGH','HR',14000),
(7,'GHI','IT',17000),
(8,'HIJ','Finance',16000);

INSERT INTO Employee VALUES (9,'XYZ','IT',5000);

DELIMITER //

CREATE PROCEDURE ShowEmployees()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_dept VARCHAR(50);
    DECLARE v_salary INT;
    DECLARE total INT DEFAULT 0;
    DECLARE emp_cursor CURSOR FOR 
        SELECT emp_id, emp_name, department, salary FROM Employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN emp_cursor;
    read_loop: LOOP
        FETCH emp_cursor INTO v_id, v_name, v_dept, v_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT v_id, v_name, v_dept, v_salary;
        SET total = total + v_salary;
    END LOOP;
    CLOSE emp_cursor;
    SELECT total AS Total_Salary;
END //
DELIMITER ;


CALL ShowEmployees();
