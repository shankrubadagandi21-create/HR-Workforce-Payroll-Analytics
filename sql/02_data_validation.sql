-- STEP 1. data validations
-- 1.Find employees without departments
SELECT distinct e.department_id
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 2.find duplicate employees
SELECT employee_id,
       COUNT(*) AS duplicate_employees
FROM employees
GROUP BY employee_id
HAVING COUNT(*) >1;

-- CHEACK THE DUPLICATE EMPLOYEE  NAME
SELECT employee_name,
       COUNT(*) AS duplicate_employee_count
FROM employees
GROUP BY employee_name
HAVING COUNT(*) >1;

-- 3.missing employement status
select * from employees
where employee_status IS NULL
ANd TRIM(employee_status) ='';

-- check the invalid hire_date
select * from employees
where hire_date <curdate();

-- Find invalid salary records
SELECT * 
FROM salaries
WHERE salary <=0;

-- 4.MISSING ATTENDENCE DATES
SELECT *
FROM attendence
WHERE attendence_date IS NULL;

-- 5.DUPLICATE ATTENDENCE RECORDS
SELECT employee_id,
       attendence_date,
       COUNT(*) AS duplicate_attendence_count
FROM attendence
GROUP BY employee_id,attendence_date
HAVING COUNT(*) >1;

-- 6.FIND INCORRECT LEAVE DATES
SELECT *
FROM leaves
WHERE end_date <start_date;
