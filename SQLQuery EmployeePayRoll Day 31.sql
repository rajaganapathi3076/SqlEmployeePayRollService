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
----------------------------UC8-----------------------------------
alter table EmpolyeePayRoll add PhoneNo bigint
alter table EmpolyeePayRoll add Address varchar(255) default 'chennai'
alter table EmpolyeePayRoll add Department varchar(255)not Null default 'IT'
----------------------------UC9 introduce new column--------
alter table EmpolyeePayRoll add TaxablePay float,NetPay float,Deductions float,IncomeTax float
---------------------------rename Exisiting Column----------------------
exec sp_rename 'EmpolyeePayRoll.BasiPay','BasicPay'