WITH T1 as
(
SELECT
        DISTINCT 
        LEFT(pay_date, 7)  as pay_month, department_id,
        AVG(amount) OVER (PARTITION BY LEFT(pay_date, 7), department_id ) AvgDep,
        AVG(amount) OVER (PARTITION BY LEFT(pay_date, 7)) AvgMonth
    FROM
        Salary S
            JOIN Employee E
                ON S.employee_id=E.employee_id
    )
SELECT
    pay_month,
    department_id,
    CASE
        WHEN AvgDep > AvgMonth then 'higher'
        WHEN AvgDep = AvgMonth then 'same'
        WHEN AvgDep < AvgMonth then 'lower'
    END 'comparison'
    FROM T1