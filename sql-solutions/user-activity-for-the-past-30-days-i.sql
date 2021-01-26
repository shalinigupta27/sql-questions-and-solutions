select activity_date as day, Count(Distinct user_id) as active_users
from Activity
group by activity_date
having datediff("2019-07-27", activity_date) < 30