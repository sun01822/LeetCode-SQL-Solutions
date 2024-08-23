select product_name, sum(o.unit) as unit from Orders as o inner join Products as p
on o.product_id = p.product_id 
where o.order_date like "2020-02-%"
group by o.product_id
having sum(o.unit) >= 100;