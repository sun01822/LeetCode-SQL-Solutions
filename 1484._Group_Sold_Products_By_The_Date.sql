# My solution

select sell_date, count(distinct product) as num_sold, (select group_concat(distinct product SEPARATOR ',') from Activities as a2 where a2.sell_date = a1.sell_date  order by product asc) as products from Activities as a1
group by sell_date;


# Easy solution without using subquery

select sell_date, count(distinct product) as num_sold,  group_concat(distinct product order by product asc SEPARATOR ',') as products from Activities as a1
group by sell_date;


# Without using separator 

SELECT sell_date,
       COUNT(DISTINCT(product)) AS num_sold, 
       GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date;