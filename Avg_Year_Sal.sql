--Grabs the average salary and average years worked per department

--The average years worked is the months since hired divided by 12
Select department_name, 
       ROUND(AVG(MONTHS_BETWEEN(CURRENT_DATE, hire_date) / 12)) As avg_years_worked, 
       ROUND(AVG(salary)) as avg_salary

--Joins on the job 
From employees e
Join departments d On e.department_id = d.department_id

Group By department_name

Order By avg_years_worked asc, avg_salary desc