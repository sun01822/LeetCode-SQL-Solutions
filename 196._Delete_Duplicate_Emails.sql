# My solution

with Temp as (
    select p2.id, p2.email from Person p1 inner join Person p2
    on p1.email = p2.email
    where p1.id < p2.id
    group by p2.id
)

delete from Person 
where (id, email) in (select id, email from Temp);



# Using self join 1

delete p2 from Person p1, Person p2 where p1.email = p2.email and p1.id < p2.id;



# Using slef join 2

delete p1 from Person p1, Person p2 where p1.email = p2.email and p1.id > p2.id;



# Using in clause 

delete from 
Person
where  
id not in (select id 
           from 
            (select min(id) as id 
             from Person 
             group by email
            ) p
          );