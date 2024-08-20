# Using concat, upper, lower and length function

select user_id, concat(upper(substring(name, 1, 1)),lower(substring(name, 2, length(name)-1 )))as name from Users
order by user_id;


# Using left, right and length function

select user_id, concat(upper(left(name, 1)),lower(right(name, length(name)-1 )))as name from Users
order by user_id;
