#Using only join

(select u.name as results from Users u join MovieRating m
on u.user_id  = m.user_id
group by u.user_id 
order by count(rating) desc, u.name
limit 1
)
Union all
(select m.title as results from Movies m join MovieRating mr
on m.movie_id = mr.movie_id
where created_at like '2020-02%'
group by m.movie_id
order by avg(rating) desc, m.title
limit 1
)

#Using inner join 

(select u.name as results from Users u inner join MovieRating m
on u.user_id  = m.user_id
group by u.user_id 
order by count(rating) desc, u.name
limit 1
)
Union all
(select m.title as results from Movies m inner join MovieRating mr
on m.movie_id = mr.movie_id
where created_at like '2020-02%'
group by m.movie_id
order by avg(rating) desc, m.title
limit 1
)

#Using inner join and subquery

(select u.name as results from Users u inner join MovieRating m
on u.user_id  = m.user_id
group by u.user_id 
having count(rating) = 
                    (select count(rating) from MovieRating m4
                    group by m4.user_id
                    order by count(rating) desc
                    limit 1)
order by u.name
limit 1
)
Union all
(select m.title as results from Movies m inner join MovieRating mr
on m.movie_id = mr.movie_id
where created_at >= "2020-02-01" and created_at <= "2020-02-29"
group by m.movie_id
having avg(rating) = 
                    (select avg(rating) from MovieRating m2
                    where m2.created_at >= "2020-02-01" and m2.created_at <= "2020-02-29"
                    group by m2.movie_id
                    order by avg(rating) desc
                    limit 1
                    )
order by m.title
limit 1
)

