SELECT students.name AS student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohorts.id = cohort_id;