select if(1 < (select count(distinct salary) from Employee), salary, null) as SecondHighestSalary from (select distinct salary from Employee
order by salary desc 
limit 2) as New
order by salary asc
limit 1;
