SELECT students.name AS student_name, cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date, students.start_date AS student_start_date
FROM students
JOIN cohorts ON cohorts.id = cohort_id
-- 此处已经join了，两表合一，那么两边的数据也连在一起了，接下来就可以用where做比较了；
WHERE students.start_date <> cohorts.start_date
ORDER BY cohorts.name;