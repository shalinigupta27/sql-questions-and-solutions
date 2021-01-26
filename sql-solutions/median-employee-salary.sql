with count_table As (
    select Company, count(*) as total from Employee
    group by Company
),

second_table As (
    select *, round(total/2,0) as mid, row_number() over(partition by Company order by Salary) as row_num from Employee
    left join
    count_table
    using(Company)
)

select Id, Company, Salary from second_table
where 
(mid=row_num)
or
(mod(total, 2) = 0 and mid+1=row_num)