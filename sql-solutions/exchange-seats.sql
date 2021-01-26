with counts as 
(SELECT 
    CASE 
        WHEN id%2=0 THEN id-1
        WHEN id%2<>0 THEN id+1
    END AS id,
    Student
FROM seat
ORDER BY id ASC)

SELECT DENSE_RANK() OVER (ORDER BY id) as id, student
FROM counts