-- Q5. identify the latest salary records

WITH salary_records as(
SELECT 
     employee_id,
     salary,
     effective_from_date,
     
     ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY effective_from_date desc) as row_num
 FROM salaries
 )
  SELECT 
       employee_id,
       salary,
       effective_from_date
FROM salary_records
where row_num =1;

-- explain : Row_number is used :we want one latest  record per employee

-- calculate current payrol cost
WITH latest_salary as(
SELECT employee_id,
      salary,
      effective_from_date,
      ROW_NUMBER() OVER (PARTITION BY employee_id  ORDER BY effective_from_date, salary desc) as row_num
FROM salaries
WHERE effective_from_date <= CURDATE()
) 
 SELECT
       SUM(ls.salary) as total_payroll
FROM latest_salary ls
JOIN employees e ON ls.employee_id = e.employee_id
WHERE row_num = 1
AND employee_status = 'active';
