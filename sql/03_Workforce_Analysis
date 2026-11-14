-- STEP 2. ANALYSE WORKFORCE DATA
-- Q1 Total employees
SELECT 
     COUNT(*) AS total_employees
FROM employees;

-- Q2. Activr employees
SELECT 
     COUNT(*) as active_employees
FROM employees
WHERE employee_status = 'active';

-- Q3.department wise head count
SELECT d.department_name,
      COUNT(e.employee_id) as employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count desc;

-- Q4. NEW hires by month
SELECT  
     DATE_FORMAt(hire_date,'%Y-%m') as hiring_month,
     COUNT(*) AS employee_hired
FROM employees
GROUP BY DATE_FORMAT(hire_date,'%Y-%m') 
order by employee_hired desc;

-- Q5 Calculate employee tenure
SELECT 
     employee_id,
     employee_name,
     hire_date,
     CURDATE() AS today_date,
     TIMESTAMPDIFF(
                   year,
                   hire_date,
                   CURDATE()
              ) AS completed_year
FROM employees;
