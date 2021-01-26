select name as customers
from customers c
left join orders o
on o.customerid = c.id
where o.customerid is null