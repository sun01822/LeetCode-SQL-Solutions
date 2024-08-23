# My code
With Temp as(
    select account_id, income, 
    case 
        when income > 50000 then 3
        when income between 20000 and 50000 then 2
        when income < 20000 then 1
    end
    as counter
    from Accounts
)

select "Low Salary" as category, sum(if(counter=1, 1, 0)) as accounts_count from Temp
UNION
select "Average Salary", sum(if(counter=2, 1, 0)) from Temp
UNION
select "High Salary", sum(if(counter=3, 1, 0)) from Temp



# Using Sum function, Union operation and without where clause
select "Low Salary" as category, sum(income < 20000) as accounts_count from Accounts
UNION
select "Average Salary", sum(income between 20000 and 50000) from Accounts
UNION
select "High Salary", sum(income > 50000) from Accounts


# Using Count function, Union operation and with where clause
select "Low Salary" as category, count(income) as accounts_count from Accounts
where income < 20000
UNION
select "Average Salary", count(income) from Accounts
where income between 20000 and 50000
UNION
select "High Salary", count(income) from Accounts
where income > 50000
