# My solution

with Temp as (select * from Queue
order by turn asc)

select q.person_name from Temp as q
            where 1001 > (select sum(weight) from Temp as t
            where t.turn <= q.turn)
            order by q.turn desc limit 1;



# Without using Temporary table

select q.person_name from Queue q
            where 1001 > (select sum(weight) from Queue as t
            where t.turn <= q.turn)
            order by q.turn desc limit 1;



# Using join operation

SELECT 
    q1.person_name
FROM Queue q1 JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1


# Using Over 

select person_name from (select person_name, turn, sum(weight) over (order by turn) AS counter
FROM Queue) as New
where counter < 1001 
order by turn desc
limit 1;