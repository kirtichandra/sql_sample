show databases;

use badb;

create table employee (emp_id int primary key,
emp_name varchar(25), 
gender varchar(25), 
birthday date,
salary int, 
supervisor_id int ,
foreign key(supervisor_id) references employee(emp_id));

select * from employee;
insert into employee(emp_id, emp_name, gender, birthday, salary, supervisor_id) 
values (101, 'Anand', 'M', '90-06-02', 5000000, null),
(102, 'Brijesh', 'M', '90-07-28', 2500000, 101),
(103, 'Chandni', 'F', '92-09,03', 1500000, 102),
(104, 'Dia', 'F', '92-09-27', 1500000, 102),
(105, 'Faraz', 'm', '96-12-30', 1000000, 103);

select * from branch;
insert into branch(branch_id, branch_name, mgr_id)
values(1, 'Mumbai', 101),
(2, 'Delhi', 104),
(3, 'Banglore', 102);

