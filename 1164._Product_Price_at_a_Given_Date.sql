# My solutions

with Temp as (
    select distinct product_id from Products
)

select *, ifnull((select new_price from Products as p where p.product_id = t.product_id and change_date <= "2019-08-16" order by change_date desc limit 1), 10) as price from Temp as t;


# Easy solutions

select distinct product_id, 10 as price from Products where product_id not in (select distinct product_id from Products where change_date <= "2019-08-16")
union
select product_id, new_price from Products where (product_id, change_date) in (select distinct product_id, max(change_date) from Products where change_date <= "2019-08-16" group by product_id)


# Using patition no and rank function

WITH Temp AS
(SELECT *, RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS r 
FROM Products
WHERE change_date<= '2019-08-16')

select product_id, new_price as price from Temp
where r = 1
union
select product_id, 10 from Products where product_id not in (select product_id from Temp);