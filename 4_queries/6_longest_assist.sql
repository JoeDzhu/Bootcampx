SELECT cohorts.name AS name,
  AVG(completed_at - started_at) AS longest_assist
FROM cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
GROUP BY cohorts.name
ORDER BY longest_assist DESC
LIMIT 1;

-- SELECT cohorts.name AS name,
--   MAX(completed_at - started_at) AS longest_assist
-- FROM cohorts
--   JOIN students ON cohorts.id = cohort_id
--   JOIN assistance_requests ON students.id = student_id
-- GROUP BY cohorts.name
-- ORDER BY longest_assist DESC
-- LIMIT 1;

-- 前面是平均每个cohort的时长，逆序选第一个；
-- 后者是找出每个cohort里面最长的-会有很多个，然后逆序第一个；