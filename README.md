#Task4_MySQL
# Employee Table Audit System

## Overview
This project demonstrates auditing of table changes in a MySQL database.  
It tracks **INSERT**, **UPDATE**, and **DELETE** operations on the Employee table and logs all changes into an Employee_Audit table using triggers.  

## Objective
- Monitor all modifications in the Employee table.  
- Maintain a detailed log of operations with timestamps.  
- Implement triggers (`AFTER INSERT`, `AFTER UPDATE`, `AFTER DELETE`) in MySQL.  

## Tools Used
- MySQL (any version supporting triggers)  
- SQL scripts for creating tables, triggers, and testing operations  

## Database Design

### Employee Table
| Column      | Description                       |
|------------|-----------------------------------|
| EmpID      | Employee ID (Primary Key)         |
| Name       | Employee Name                     |
| Department | Department Name                   |
| Salary     | Employee Salary                   |

### Employee_Audit Table
| Column         | Description                                 |
|----------------|---------------------------------------------|
| AuditID        | Unique Audit ID (Primary Key, Auto Increment) |
| OperationType  | Type of operation (INSERT/UPDATE/DELETE)   |
| EmpID          | Employee ID affected                        |
| Name           | Employee Name                               |
| Department     | Department Name                             |
| Salary         | Employee Salary                             |
| OperationTime  | Timestamp of the operation                  |

## Features
- Logs all **INSERT** operations.  
- Logs all **UPDATE** operations.  
- Logs all **DELETE** operations.  
- Each audit entry includes **operation type, employee details, and timestamp**.  


## Conclusion
This project demonstrates how triggers can be used to **audit table changes efficiently**, ensuring all modifications are tracked automatically, which is crucial for **data integrity and monitoring**.
