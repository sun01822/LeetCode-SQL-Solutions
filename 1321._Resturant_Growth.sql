with Temp as(
select visited_on, date_add(visited_on, interval 6 day) as present_date from Customer
having present_date <= (select max(visited_on) from Customer)
)

select t.present_date as visited_on, (select sum(amount) from Customer as c
            where c.visited_on between t.visited_on and t.present_date) as amount, round((select sum(amount)/7 from Customer as c
            where c.visited_on between t.visited_on and t.present_date),2) as average_amount from Temp as t 
            group by t.visited_on;
