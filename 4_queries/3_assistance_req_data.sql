SELECT
  teachers.name AS teacher,
  students.name AS student,
  assignments.name AS assignment,
  (completed_at - started_at) AS duration
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN assignments ON assignment_id = assignments.id
-- GROUP BY teachers.name, students.name, assignments.name, (completed_at - started_at)
-- NO GROUP HERE AS NO AGGREGATION;
ORDER BY (completed_at - started_at);