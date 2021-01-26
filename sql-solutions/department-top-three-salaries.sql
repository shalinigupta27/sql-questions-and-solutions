with t1 as (
select d.Name as Department, e.Name as Employee, e.Salary, dense_rank() over(partition by DepartmentId order by Salary Desc) as rnk 
    from Employee e
    left join Department d
    on e.DepartmentId = d.Id
    
)
select Department, Employee, Salary from t1
where rnk <=3 and Department is not null