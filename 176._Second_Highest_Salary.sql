select if(1 < (select count(distinct salary) from Employee), salary, null) as SecondHighestSalary from (select distinct salary from Employee
order by salary desc 
limit 2) as New
order by salary asc
limit 1;

# Using Max function and not condition

SELECT  MAX(SALARY) AS SecondHighestSalary FROM EMPLOYEE 
WHERE SALARY <>(SELECT MAX(SALARY) FROM EMPLOYEE);


# Using offset and limit

select (
    select distinct salary from Employee
    order by salary desc
    limit 1 offset 1
) as SecondHighestSalary;



