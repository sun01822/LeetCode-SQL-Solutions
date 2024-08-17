#Using subquery 
with Temp as(
    select *, (
    select salary from (
    select distinct(salary) from Employee 
    where departmentId = d.id
    order by salary desc
    limit 3) as new 
    order by salary asc
    limit 1) as highest_3 from Department as d
)

select t.name as Department, e.name as Employee, e.salary as Salary from Temp as t join Employee as e
on t.id = e.departmentId
where t.highest_3 <= e.salary;

#Using DENSE_RANK and conditions
 select Department, Employee, Salary from (
 SELECT d.name AS Department
        , e.name AS Employee
        , e.salary
        , DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS ranker
    FROM Employee e JOIN Department d ON e.DepartmentId= d.Id) as Temp
    where ranker <= 3;

