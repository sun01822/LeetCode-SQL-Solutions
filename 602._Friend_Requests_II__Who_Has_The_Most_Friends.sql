# Using a temporary table

With Temp as(
        select requester_id as id, count(requester_id) as num from RequestAccepted group by requester_id
        Union all
        select accepter_id as id, count(accepter_id) as num from RequestAccepted group by accepter_id
   )

select id, sum(num) as num from Temp
group by id
order by num desc
limit 1;




# Without using temporary table

select id, COUNT(*) as num 
from (
    select requester_id as id from RequestAccepted
    union all
    select accepter_id from RequestAccepted
) as Temp
group by id
order by num desc 
limit 1;
