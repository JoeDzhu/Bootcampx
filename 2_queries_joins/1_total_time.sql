SELECT SUM(assignment_submissions.duration) AS total_time_spent
FROM students JOIN assignment_submissions ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';