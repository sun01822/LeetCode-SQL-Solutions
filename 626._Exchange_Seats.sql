#Using multiple subquery
select s1.id, 
case
    when s1.id%2 = 0 then (select student from Seat as s2 where s2.id = s1.id-1)
    when s1.id% 2 <> 0 and id <> (select count(*) from Seat as s3) then (select student from Seat as s4 where s4.id = s1.id+1)
    else s1.student
end as student
from Seat as s1;


#Easy solution
select
case
    when id% 2 <> 0 and id = (select count(*) from Seat) then id
    when id%2 = 0 then id-1
    else id+1
end as id, student
from Seat
order by id asc;


#Without any extra table
select if(id < (select max(id) from Seat),
            if(id % 2 = 0, id-1, id+1),
            if(id % 2 = 0, id-1, id)
        ) as id, student
from Seat
order by id asc;
