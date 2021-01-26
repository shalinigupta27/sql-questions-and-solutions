CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      with Row_table as
      (
      select salary, dense_rank() over(order by Salary desc) as Highest
      from Employee
      )
     select salary as getNthHighestSalary
     from Row_table
     where N=Highest
      limit 1
  );
END

