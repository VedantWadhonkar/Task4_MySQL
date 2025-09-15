-- ========================================
-- Task: Audit Table Changes for Employee Table
-- Objective: Track INSERT, UPDATE, DELETE operations
-- ========================================

-- 1️⃣ Create Database and Use It
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- 2️⃣ Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

-- 3️⃣ Create Audit Table
CREATE TABLE Employee_Audit (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    OperationType VARCHAR(10) NOT NULL,
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    OperationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4️⃣ Trigger: After INSERT
DELIMITER //
CREATE TRIGGER trg_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(OperationType, EmpID, Name, Department, Salary)
    VALUES ('INSERT', NEW.EmpID, NEW.Name, NEW.Department, NEW.Salary);
END;
//
DELIMITER ;

-- 5️⃣ Trigger: After UPDATE
DELIMITER //
CREATE TRIGGER trg_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(OperationType, EmpID, Name, Department, Salary)
    VALUES ('UPDATE', NEW.EmpID, NEW.Name, NEW.Department, NEW.Salary);
END;
//
DELIMITER ;

-- 6️⃣ Trigger: After DELETE
DELIMITER //
CREATE TRIGGER trg_employee_delete
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(OperationType, EmpID, Name, Department, Salary)
    VALUES ('DELETE', OLD.EmpID, OLD.Name, OLD.Department, OLD.Salary);
END;
//
DELIMITER ;

-- 7️⃣ Sample Operations to Test Triggers
INSERT INTO Employee VALUES (1, 'John Doe', 'HR', 50000);
INSERT INTO Employee VALUES (2, 'Jane Smith', 'IT', 60000);

UPDATE Employee SET Salary = 65000 WHERE EmpID = 2;

DELETE FROM Employee WHERE EmpID = 1;

-- 8️⃣ View Audit Logs
SELECT * FROM Employee_Audit;
