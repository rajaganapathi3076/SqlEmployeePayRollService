------------------------Uc1-------------------------------------
create database PayRollService
use PayRollService
-----------------------UC2---------------------------------
create table EmpolyeePayRoll
(
EmployeeId int identity(1,1),
Name varchar(255),
Salary float,
StartDate date

)
--------------------------uc3------------------------
insert into EmpolyeePayRoll values('Raja',5000,getdate())
select *from EmpolyeePayRoll
insert into EmpolyeePayRoll values('Suresh',6500,getdate())
--------------------------UC4------------------------------------
select *from EmpolyeePayRoll
select  Name,Salary from EmpolyeePayRoll
------------------------UC5---------------------------
select  Name,Salary from EmpolyeePayRoll where Name='Raja';
---------------------updateQuery----------------
update EmpolyeePayRoll set StartDate='05-12-2000',Salary=8000 where Name='Suresh';
insert into EmpolyeePayRoll Values('Lal',900034,'2003-12-01')
-------------------------UC5-------------------
select *from EmpolyeePayRoll where Name='Raja';
select *from EmpolyeePayRoll where StartDate between '2000-01-01'and GETDATE();
---------------------------UC6--------------------------
alter table EmpolyeePayRoll add Gender char(1)
update EmpolyeePayRoll set Gender='M'
insert into EmpolyeePayRoll values('Priya',10000,'1997-08-21','F'),('Sandhya',12000,'2001-08-25','F'),('Hema',14000,'2005-08-01','F');

update EmpolyeePayRoll set EmployeeId=2 where Name='Suresh'
-----------------------------UC7------------------------------------
select sum(Salary) as TotalSalary,Gender from EmpolyeePayRoll group by Gender
select *from EmpolyeePayRoll
select Avg(Salary) as AverageSalary,Gender from EmpolyeePayRoll group by Gender
select max(Salary) as MaxSalary,Gender from EmpolyeePayRoll group by Gender
select min(Salary) as MinSalary,Gender from EmpolyeePayRoll group by Gender
select *from EmpolyeePayRoll
select *from EmpolyeePayRoll where Salary in(select max(Salary) as MaxSalary from EmpolyeePayRoll group by Gender)
select count(Salary) as NumberOfEmployees,Gender from EmpolyeePayRoll group by Gender
-------------------------------------ER Diagaram-------------------------------------------------
----------------------------UC8-----------------------------------
alter table EmpolyeePayRoll add PhoneNo bigint
alter table EmpolyeePayRoll add Address varchar(255) default 'chennai'
alter table EmpolyeePayRoll add Department varchar(255)not Null default 'IT'
----------------------------UC9 introduce new column--------
alter table EmpolyeePayRoll add TaxablePay float,NetPay float,Deductions float,IncomeTax float
---------------------------rename Exisiting Column----------------------
exec sp_rename 'EmpolyeePayRoll.BasiPay','BasicPay'
select *from [dbo].[EmpolyeePayRoll]
select *from EmpolyeePayRoll

----------------------------------------UC10---------------------------------------------------------
INSERT INTO EmpolyeePayRoll(Name, Department, BasicPay)
VALUES ( 'Terissa', 'Sales and Marketing', 5500);
---------------------------------------ER Diagram------------------------------------------------------------
create database EmployeePayRollService


--------------------------------------------------UC10&UC11-----------------------------------------------------------------

-- Create the Company table
CREATE TABLE Company (
  company_id int PRIMARY KEY,
  company_name varchar(255),
  address VARCHAR(255)
);
use EmployeePayRollService


create table Company
(
Company_id int primary key,
Company_name varchar(255),
Address varchar(255)
)

-- Create the Department table
CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255),
  manager_id INT,
   CONSTRAINT Fk_Department
  FOREIGN KEY (manager_id) REFERENCES Employee(Employee_id)
);
-- Create the Employee table
CREATE TABLE Employee (
  Employee_id INT ,
  Full_name VARCHAR(255),
  Department VARCHAR(255),
  Role VARCHAR(255),
  Hire_date DATE,
  
);

-- Create the Employee table
CREATE TABLE Employee (
  Employee_id INT PRIMARY KEY,
  Full_name VARCHAR(255),
  Department VARCHAR(255),
  Role VARCHAR(255),
  Hire_date DATE
);

-- Create the Payroll table
CREATE TABLE Payroll (
  Payroll_id INT PRIMARY KEY,
  Employee_id INT,
  Salary DECIMAL(10, 2),
  Start_date DATE,
  End_date DATE,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


select *from Employee
insert into Employee values (9,'Shanmugam',124,60000);
insert into Department values (124,'IT');

select *from Payroll
 ----------------------------------------------------------------------------------------------------------------------
 

 select @@VERSION

 insert into Employee values(1,'SenthilKumar','Mech','Operator','2020-07-12');
 select *from Employee
  insert into Employee values(2,'Murugesan','EEE','Operator','2020-07-10')
  ,(3,'Thillainayagam','Mech','Operator','2020-04-12'),
  (4,'SentamilSelvan','ECE','Supervisor','2021-12-06'),
  (5,'Leo','Accounts','AuditPerson','2021-07-12'),
  (6,'VelMurugan','Mech','Operator','2022-07-12');

  insert into Payroll values (101,1,50000,'2020-07-12',''),
  (102,2,65000,'2020-07-10',''),
  (103,3,50000,'2020-04-12',''),
  (104,4,150000,'2021-12-06',''),
  (105,5,95000,'2021-07-12',''),
  (106,6,50000,'2022-07-12','');

  insert into Department(department_id,department_name) values (121,'Mech'),
  (158,'EEE'),(162,'ECE'),(143,'Accounts')

  select*from Company
  select*from Employee
  select*from Department
  select*from Payroll



SELECT Employee.full_name, Employee.department, Employee.role, Employee.hire_date
FROM Employee
JOIN Payroll ON Payroll.employee_id = Employee.employee_id
JOIN Department ON Department.department_id = Department_id
INNER JOIN Company ON Company.company_id = company_id
inner join Payroll on Salary=




SELECT Employee.Full_name,  call.start_time, call.end_time, call_outcome.outcome_text
FROM employee
INNER JOIN call ON call.employee_id = employee.id
INNER JOIN call_outcome ON call.call_outcome_id = call_outcome.id
ORDER BY call.start_time ASC;
