SELECT teachers.name AS teacher,
  cohorts.name AS cohort
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
-- HAVING cohorts.name = 'JUL02';

-- both works WHERE before group or HAVING after group;

-- suggested answer:
-- SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
-- FROM teachers
-- JOIN assistance_requests ON teacher_id = teachers.id
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.name = 'JUL02'
-- ORDER BY teacher;
-- DISTINCT此处作用是通过combination实现，也就是name+cohort算一条记录，
-- 如果这条是unique，就被筛选出来；