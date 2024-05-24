-- Write a SQL query to find those employees whose salary is higher than 9000. Return
-- first name, last name and department number and salary.

select first_name, last_name, department_id, salary
from employee_hr_data
where salary>9000;

-- Write a SQL query to identify employees who do not have a department number. Return
-- employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
-- salary,commission_pct, manager_id and department_id

select * from employee_hr_data 
where department_id=0;

-- Write a SQL query to find those employees whose first name does not contain the letter
-- ‘T’. Sort the result-set in ascending order by department ID. Return full name (first and
-- last name together), hire_date, salary and department_id.

select concat(first_name, last_name) as full_name,
 hire_date, salary, department_id 
from employee_hr_data
where first_name not like '%t%'
order by department_id asc;

-- Write a SQL query to find those employees who earn between 9000 and 12000 (Begin
-- and end values are included.) and get some commission. Return all fields.

select * from employee_hr_data 
where salary between 9000 and 12000;

-- Write a SQL query to find those employees who do not earn any commission. Return full name (first and last name),
--  and salary.

select concat(first_name, last_name) as full_name,
salary from employee_hr_data 
where commission_pct = 0;

-- Write a SQL query to find those employees who work under a manager. Return full name
-- (first and last name), salary, and manager ID.

select concat(first_name, last_name) as full_name, salary, manager_id
from employee_hr_data
where manager_id!=0;

--Write a SQL query to find employees whose first names contain the letters F, T, or M.
-- Sort the result-set in descending order by salary. Return all fields.

select * from employee_hr_data
where first_name like '%f%' or first_name like '%t%' or first_name like '%m' 
order by salary desc;

-- Write a SQL query to find those employees who earn above 12000 or the seventh
-- character in their phone number is 3. Sort the result-set in descending order by first
-- name. Return full name (first name and last name), hire date, commission percentage,
-- email, and telephone separated by '-', and salary.

select concat(first_name, last_name) 
as full_name, hire_date, commission_pct, 
concat(email,'-',phone_number) as email_phone, salary
from employee_hr_data
where salary>12000 or phone_number like '______3%'
order by first_name desc;

-- Write a SQL query to find those employees whose first name contains a character 's' in
-- the third position. Return first_name, last_name and department id.

select first_name, last_name, department_id from employee_hr_data
where first_name like '___s%';

-- Write a SQL query to find those employees who worked more than two jobs in the past.
-- Return employee id.

select employee_id
from job_history_hr_data
group by employee_id
having count(*)>=2;

-- Write a SQL query to count the number of employees, the sum of all salary, and
-- difference between the highest salary and lowest salaries by each job id. Return job_id,
-- count, sum, salary_difference.

select job_id, count(department_id) as number_of_employee, 
sum(salary) as total_salary, max(salary)-min(salary) as salary_difference
from employee_hr_data
group by job_id;

-- Write a SQL query to find each job ids where two or more employees worked for more
-- than 300 days. Return job id.

select job_id from job_history_hr_data
where(end_date-start_date)*365>300
group by job_id
having count(department_id)>=2;


-- Write a SQL query to count the number of employees worked under each manager.
-- Return manager ID and number of employees.

select manager_id, count(employee_id) as number_of_employees
from employee_hr_data
group by manager_id;

-- Write a SQL query to calculate the average salary of employees who receive a
-- commission percentage for each department. Return department id, average salary.

select department_id, avg(salary)as average_salary 
from employee_hr_data
where commission_pct is not null
group by department_id;

-- Write a SQL query to find the departments where more than ten employees receive
-- commissions. Return department id.

select department_id from employee_hr_data
group by department_id
having count(commission_pct)>=10;

-- Write a SQL query to find those job titles where maximum salary falls between 10000
-- and 15000 (Begin and end values are included.). Return job_title, max_salarymin_salary.

Select job_title, max_salary-min_salary  from jobs_hr_data
where max_salary between 10000 and 15000;

-- Write a SQL query to find details of those jobs where the minimum salary exceeds 9000.
-- Return all the fields of jobs

select * from jobs_hr_data
where min_salary>=9000;

-- Write a SQL query to find those employees who work in the same department as ‘Clara’.
-- Exclude all those records where first name is ‘Clara’. Return first name, last name and
-- hire date

Select first_name, last_name, hire_date
from employee_hr_data
where DEPARTMENT_ID=( select DEPARTMENT_ID from
employee_hr_data
where FIRST_NAME like '%Clara%')
and first_name != 'clara';

-- Write a SQL query to find those employees who earn more than the average salary and
-- work in the same department as an employee whose first name contains the letter 'J'.
-- Return employee ID, first name and salary.

select employee_id, first_name, salary 
from employee_hr_data
where salary > (select avg(salary) 
from employee_hr_data)
and DEPARTMENT_ID in (select department_id from employee_hr_data
 where first_name like '%j%');
 
-- Write a query to display the employee id, name ( first name and last name ) and the job
-- id column with a modified title SALESMAN for those employees whose job title is
-- ST_MAN and DEVELOPER for whose job title is IT_PROG.

select employee_id, first_name, last_name, 
case job_id 
when 'ST_MAN' then 'SALESMAN' 
When 'IT_PROG' then 'Developer'
else job_id
end designation, salary
from employee_hr_data;
 
 
 
-- joins

-- Write a SQL query to find the first name, last name, department, city, and state
-- province for each employee.

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
 from employee_hr_data e JOIN department_hr_data d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
 JOIN location_hr_data  l on d.LOCATION_ID = l.LOCATION_ID;
 
 -- Write a SQL query to find the first name, last name, salary, and job grade for all
-- employees

select e.first_name, e.last_name, e.salary, j.grade_level
from employee_hr_data e
join job_grades_hr_data j 
on j.LOWEST_SAL = e.salary;

-- Write a SQL query to find all those employees who work in department ID 80 or 40.
-- Return first name, last name, department number and department name

select e.first_name, e.last_name, e.department_id, d.department_name
from employee_hr_data e
join department_hr_data d
on e.DEPARTMENT_ID = d.department_id
and e.DEPARTMENT_ID in (80,40);
 
 
 -- Write a SQL query to find those employees whose first name contains the letter ‘z’.
-- Return first name, last name, department, city, and state province.

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employee_hr_data e
join department_hr_data d
on e.department_id = d.DEPARTMENT_ID
join location_hr_data l
on d.LOCATION_ID = l.LOCATION_ID
where e.FIRST_NAME like '%z%';

-- Write a SQL query to find all employees who joined on 1st January 1993 and left on
-- or before 31 August 1997. Return job title, department name, employee name, and
-- joining date of the job.

select e.job_id, d.department_name, e.first_name, e.last_name, h.start_date from employee_hr_data e join 
department_hr_data d 
on e.department_id = d.department_id  
join job_history_hr_data h
on d.department_id = h.department_id
where start_date >= '1993-01-01' and end_date < 1997-08-31;



-- Write a SQL query to calculate the difference between the maximum salary of the job
-- and the employee's salary. Return job title, employee name, and salary difference.

select j.job_title, e.first_name, e.last_name, e.salary
from employee_hr_data e 
join jobs_hr_data j 
on e.job_id = j.job_id
where salary = max_salary - salary;


-- Write a SQL query to find the department name and the full name (first and last
-- name) of the manager.

select department_name, concat(first_name, last_name) as name_of_manager 
from department_hr_data d
join employee_hr_data e
on d.DEPARTMENT_ID = e.DEPARTMENT_ID;


-- Write a SQL query to find the department name, full name (first and last name) of the
-- manager and their city.

select department_name, concat(first_name, last_name) as name_of_manager, city 
from department_hr_data d
join employee_hr_data e
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
join location_hr_data l 
on d.LOCATION_ID = l.LOCATION_ID;

-- Write a SQL query to find out the full name (first and last name) of the employee with
-- an ID and the name of the country where he/she is currently employed.

select concat(first_name, last_name) as employee_name, 
employee_id, country_name 
from employee_hr_data e
join department_hr_data d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join location_hr_data l 
on d.LOCATION_ID = l.LOCATION_ID
join countries_hr_data c
on l.COUNTRY_ID = c.COUNTRY_ID;