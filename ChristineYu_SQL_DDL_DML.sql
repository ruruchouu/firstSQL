create database HR;
create table employee
( EmployeeID int primary key, 
FirstName varchar (20), 
LastName varchar(20), 
DOB date, 
PhoneNumber char (10), 
Email varchar(30), 
JobID varchar (10), 
HireDate date, 
Salary int,
DepartmentID int
); 

insert into employee 
(EmployeeID, FirstName, LastName, DOB, PhoneNumber, Email, JobID, HireDate, Salary, DepartmentID)
values 
(1, 'Mike', 'Wazowski', 19901111, 8587906758, 'mwazowski@gmail.com', 'IT_PROG', 20011111, 11000, 60),
(2,'Boo','Radley', 19701111, 9083538908,'babyboo@yahoo.com','IT_VP', 20021211, 12000, 60), 
(3, 'Elon','Musk',19881111, 7899759777, 'elonmusk@tesla.us', 'FI_VP', 20030311, 10000, 100),
(4,'Albert','Einstein',19781111,9056789000,'alberteinstein@science.com', 'FI_ACCOUNT', 20040401, 9000, 100 ),
(5,'Barack' ,'Obama',19701111,9516776218,'bobama@gmail.com','MK_REP', 20010122, 8000, 20),
(6,'Bruce', 'Lee', 19681111, 8086267890,'kungfu@gmail.com','MK_MAN',20020425,7000, 20),
(7,'Tiger','Woods',19851111,9990010009,'woods@golf.net','HR_REP',20030921,8500,40),
(8,'Jennifer','Lawrence',19891111,9699995678,'jlawrence@acting.com','HR_VP',20041102, 9500,40),
(9,'Noah','Cyrus',19791111,1234567890,'ncyrus@gmail.com','IT_PROG',20011207,11000,60),
(10,'Ariana','Grande',19801111,7870109090,'agrande@starbucks.com','IT_VP',20020109,12000,60);

#Displays the ID, First Name and Last Name of All Employees
select EmployeeID, FirstName, LastName from employee; 

#Displays all the employees that work in IT
select EmployeeID, FirstName, LastName 
from employee
where DepartmentID = 60; 

#Update salary for  VP of Finance department to '11500'
update employee
set Salary = 11500
where JobID = 'FI_VP';







