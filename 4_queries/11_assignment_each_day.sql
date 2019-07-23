SELECT day, COUNT(*) AS number_of_assignment, SUM(duration) AS duration
FROM assignments
GROUP BY assignments.day
ORDER BY day ASC;
-- 一个表，多个aggregation，用值group，而且aggregation的计算（count和sum）不能作为group的值；