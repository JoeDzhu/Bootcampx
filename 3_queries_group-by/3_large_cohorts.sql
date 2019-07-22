SELECT cohorts.name AS cohort_name, count(students.*) AS student_count
FROM cohorts JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING count(students.*) >= 18
ORDER BY cohorts.name;

-- SELECT cohorts.name AS cohort_name, count(students.*) AS student_count
-- FROM students JOIN cohorts  ON cohorts.id = cohort_id
-- WHERE count(students.*) >= 18
-- GROUP BY cohorts.name
-- ORDER BY cohorts.name;
-- 这个不会run，原因（暂时理解）如下：
-- 在1对多的关系中，group是按照父系（也就是1）的attribute来group的，一个cohort有多个学生，所以能把所有学生按照cohort来group，整个运算逻辑是从父到子，所以如果想要用
-- where语句，那么where 的应该是父一级的attributes，而不是子一级的，此时只能是在grouping后用HAVING；

-- 但如果是在父级进行条件筛选，哪怕有aggregation，则可以使用WHERE，例如：
-- SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE end_date IS NULL
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;