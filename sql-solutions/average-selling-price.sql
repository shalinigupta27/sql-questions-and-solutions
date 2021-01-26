select p.product_id, round(sum(u.units*p.price)/sum(u.units),2) as average_price
from Prices p
inner join UnitsSold u
on p.product_id = u.product_id
where u.purchase_date between start_date and end_date
group by product_id