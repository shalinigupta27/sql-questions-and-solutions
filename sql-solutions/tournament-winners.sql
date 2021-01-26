with table1 AS
(
    select first_player as id, sum(first_score) as score from Matches
    group by first_player
),

table2 AS
(
    select second_player as id, sum(second_score) as score from Matches
    group by second_player
),

table3 AS
(
    select id, score from table1
    UNION ALL
    select id, score from table2
),

table4 AS 
(
    select id as player_id, sum(score) as score from table3
    group by id
),

table5 AS
(
    select t1.player_id, group_id, ifnull(score, 0) as score from Players t1
    left join table4 t2
    using(player_id)
),

table6 AS
(
    select *, row_number() over (partition by group_id order by score desc, player_id) as r1
    from table5
)
select group_id, player_id 
from table6
where r1 =1
order by group_id