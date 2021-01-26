-- Solution 1:
with apple_table AS (

    select sale_date, sold_num from Sales
    where fruit = "apples"
),

orange_table AS (
    select sale_date, sold_num from Sales
    where fruit = "oranges"
)


select t1.sale_date, t1.sold_num - t2.sold_num as diff
from apple_table t1
inner join
orange_table t2
on(t1.sale_date = t2.sale_date)

-- Solution 1:
-- select sale_date,
-- sum(case when fruit='apples' then sold_num
--      else -sold_num
--     end) as diff
-- from sales
-- group by sale_date