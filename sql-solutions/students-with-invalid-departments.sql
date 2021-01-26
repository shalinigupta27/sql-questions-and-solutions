SELECT s.id, s.name 
FROM   students s 
LEFT JOIN departments d 
ON d.id = s.department_id 
WHERE  d.id IS NULL