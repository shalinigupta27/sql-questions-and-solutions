-- Solution 1:
with 
new_table AS (
 select stock_name, operation, operation_day, 
    (case when operation="sell" then price
    else -price end) as price
    
 from Stocks
)

select stock_name, sum(price) as capital_gain_loss
from new_table
group by stock_name


-- Solution 2: 
-- select stock_name, 
-- sum(case when operation="buy" then -price
--    else price
--    end) as capital_gain_loss
-- from Stocks
-- group by stock_name