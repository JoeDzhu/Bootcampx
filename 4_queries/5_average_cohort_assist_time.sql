SELECT cohorts.name AS name,
  AVG(completed_at - started_at) AS average_assistance_time
FROM cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
GROUP BY cohorts.name
ORDER BY average_assistance_time;
-- 如果是一个表，在使用唯一的aggregate的时候，不用group，但如果是多张表join，
-- 使用任何agreegate，则需要group才能produce结果，通常是开始的父表来group；