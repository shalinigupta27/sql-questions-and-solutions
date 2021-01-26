with t1 as
(
select activity, desnse_rank() OVER (ORDER BY count(id) desc) AS rdesc,
DENSE_RANK() OVER (ORDER BY count(id) asc) AS rasc
from friends
group by activity
)
select activity 
from t1
where rdesc!=1 and rasc!=1