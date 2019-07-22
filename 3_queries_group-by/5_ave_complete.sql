SELECT students.name as student, ROUND(avg(assignment_submissions.duration)) as average_assignment_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;




-- WRONG ANSWER：
-- SELECT students.name AS student,
-- assignments.duration AS average_time
-- FROM cohorts
-- JOIN students ON cohorts.id = cohort_id
-- JOIN assignment_submissions ON students.id = student_id
-- JOIN assignments ON assignments.id = assignment_id
-- GROUP BY students.name
-- ORDER BY assignments.duration DESC;

-- one explanation this doesn't work，取的俩个值在距离最远的两个表里面，没有直接的relationship，
-- 无法直接group，除非 GROUP BY students.name， assignments.duration；