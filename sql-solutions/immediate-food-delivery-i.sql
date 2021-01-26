select round(sum(case when order_date=customer_pref_delivery_date then 1 
                     else 0 end)/count(1)*100, 2) as immediate_percentage 
from Delivery

-- SELECT Round(100 * Sum(order_date = customer_pref_delivery_date) / Count(*), 2) 
--        AS immediate_percentage 
-- FROM   delivery;