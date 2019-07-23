SELECT AVG(total_duration) AS cohort_avg_assist_duration
FROM (
  SELECT cohorts.name AS cohort,
    SUM(completed_at - started_at) AS total_duration
  FROM cohorts
    JOIN students ON cohorts.id = cohort_id
    JOIN assistance_requests ON students.id = student_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) XX;
-- sub query in FROM must have an alias-can be any alias;
--在sub中已经有一栏数据叫做total_duration,带入AVG计算即可；