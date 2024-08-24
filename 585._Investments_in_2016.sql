# My solution

select round(sum(i1.tiv_2016),2) as tiv_2016 from Insurance as i1
where 1 < (select count(i2.tiv_2015) from Insurance as i2
            where i2.tiv_2015 = i1.tiv_2015)
and 1 = (select count(*) from Insurance i3 
            where i3.lat = i1.lat and i3.lon = i1.lon);



# Using in clause

select round(sum(i1.tiv_2016),2) as tiv_2016 from Insurance as i1
where tiv_2015 in (select tiv_2015 from Insurance as i2
                    group by tiv_2015
                    having count(tiv_2015) > 1)
and (lat, lon) in (select lat, lon from Insurance i3 
                    group by lat, lon
                    having count(*) = 1);




# Using over and partition by 

select round(sum(tiv_2016),2) as tiv_2016 from 
    (select *, 
    count(*) over (partition by tiv_2015) as tiv_2015_counter,
    count(*) over (partition by lat, lon) as lat_lon_counter
    from Insurance)
    as temp
    where tiv_2015_counter > 1 and lat_lon_counter = 1;