SELECT cohorts.name AS cohort_name,
count(assignment_submissions.*) AS total_sub
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.*) DESC;

-- 用count，每一个row代表一次提交作业，计数总共有多少提交，如果用SUM，就是把每次提交的加总（这个就不和逻辑了，没法求SUM）；

-- SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;