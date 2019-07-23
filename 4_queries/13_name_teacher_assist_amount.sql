SELECT teachers.name AS name,
  cohorts.name AS cohort,
  COUNT(assistance_requests) AS total_assistances
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
-- WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
HAVING cohorts.name = 'JUL02'
ORDER BY teachers.name

-- WHERE or HAVING both work;
-- many to many 而且是跨表的情况，通过每个父系的id group之，最后取得COUNT的值；