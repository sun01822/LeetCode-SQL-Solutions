#Using another table

WITH TEMP AS(
    SELECT REPORTS_TO, COUNT(*) AS REPORTS_COUNT, ROUND(AVG(AGE)) AS AVERAGE_AGE
    FROM EMPLOYEES
    WHERE REPORTS_TO IS NOT NULL
    GROUP BY REPORTS_TO 
)

SELECT E.EMPLOYEE_ID, E.NAME, T.REPORTS_COUNT, CEIL(T.AVERAGE_AGE) AS AVERAGE_AGE
FROM EMPLOYEES AS E INNER JOIN TEMP AS T
ON E.EMPLOYEE_ID = T.REPORTS_TO
ORDER BY E.EMPLOYEE_ID ASC;


#Using Self Join
select e1.employee_id, e1.name, count(e2.employee_id) as reports_count,
round(avg(e2.age)) as average_age 
from Employees e1 inner join Employees e2
on e1.employee_id = e2.reports_to
group by e1.employee_id
order by e1.employee_id;
