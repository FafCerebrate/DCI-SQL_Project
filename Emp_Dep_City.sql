--Grabs a count of how many employees and departments per city

--Create a Table that counts how many employees per department
With empcnt As (
    Select location_id, d.department_id, COUNT(employee_id) As employee_count
    From departments d
    Join employees e On d.department_id = e.department_id
    Group By location_id, d.department_id)

--sum up the departments and employees per city
Select city, COUNT(department_id) As deparment_count, SUM(employee_count) As employee_count

--join the employee per department table
From locations l
Join empcnt On l.location_id = empcnt.location_id

Group By city

Order By employee_count desc