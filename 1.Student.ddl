CREATE DATABASE StudentDB;

CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    phno VARCHAR(15),
    email_id VARCHAR(50) UNIQUE,
    marks INT CHECK (marks BETWEEN 0 AND 100)
);

CREATE TABLE Courses (
    c_id INT PRIMARY KEY,
    cname VARCHAR(50),
    rollno INT,
    FOREIGN KEY (rollno) REFERENCES Student(rollno)
    ON DELETE CASCADE
);

INSERT INTO Student VALUES
(1,'Yash','Pune','9876543210','yash@gmail.com',85),
(2,'Amit','Mumbai','9123456780','amit@gmail.com',78),
(3,'Riya','Delhi','9988776655','riya@gmail.com',92),
(4,'Neha','Pune','9090909090','neha@gmail.com',67),
(5,'Raj','Nashik','8888888888','raj@gmail.com',55),
(6,'Simran','Nagpur','7777777777','simran@gmail.com',88),
(7,'Kunal','Pune','6666666666','kunal@gmail.com',73);

SELECT * FROM Student;

INSERT INTO Courses VALUES
(101,'DBMS',1),
(102,'OS',2),
(103,'CN',3),
(104,'AI',4),
(105,'ML',5),
(106,'Java',6),
(107,'Python',7);

✅ 7. Constraint Testing
  INSERT INTO Student VALUES
(8,'Test','Pune','9999999999','test@gmail.com',150);
INSERT INTO Student VALUES
(9,'Test2','Pune','9999999998','yash@gmail.com',80);
INSERT INTO Student VALUES
(10,NULL,'Pune','9999999997','test2@gmail.com',70);


DELETE FROM Student WHERE rollno = 1;
SELECT * FROM Courses;

ALTER TABLE Student ADD age INT;

RENAME TABLE Courses TO Course;

TRUNCATE TABLE Course;

DROP TABLE Course;
