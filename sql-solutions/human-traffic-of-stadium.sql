with t1 AS (
select *, 
    lead(people, 1) over (order by visit_date) as prev1, 
    lead(people, 2) over (order by visit_date) as prev2, 
    lag(people, 1) over (order by visit_date) as next1,
    lag(people, 2) over (order by visit_date) as next2
from Stadium
)

select id, visit_date, people from t1
where
(prev2>=100 and prev1>=100 and people>=100)
or
(prev1>=100 and people>=100 and next1>=100)
or
(people>=100 and next1>=100 and next2>=100)