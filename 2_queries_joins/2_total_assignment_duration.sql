SELECT SUM(assignment_submissions.duration) AS total_spent_in_cohort
FROM cohorts JOIN (students JOIN assignment_submissions ON students.id = student_id) ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';

-- 更为简洁直观的写法。
-- SELECT sum(assignment_submissions.duration) as total_duration
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- WHERE cohorts.name = 'FEB12';