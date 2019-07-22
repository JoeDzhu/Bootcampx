
SELECT students.name as student,
avg(assignment_submissions.duration) as average_assignment_duration,
avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
-- 不能放入average_estimated_duration，sql不允许在group里面用另一层aggregate的func，但因为用了average，整个关系收缩到了一对一的关系，一个学生就可以reference 起来；
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;


-- SELECT students.name AS student,
-- ROUND(avg(assignment_submissions.duration)) AS average_assignment_duration,
-- assignments.duration AS average_estimated_duration
-- FROM students
-- JOIN assignment_submissions ON students.id = student_id
-- JOIN assignments ON assignment_id = assignments.id
-- WHERE end_date IS NULL
-- GROUP BY student,assignments.duration
-- 此处要两个group的attributes，逻辑和excel的group一样，students和assignments两张都是ass_sub（多）的父表（1），
-- 要汇总就必须要两个attributes都能够统一收缩汇总到一个表才行,每个student是唯一的，而assignments.duration不是，但如果average后者，就能保证一一对应关系
-- 也就是，每个学生都有一个自己的average时间，同样的，每个assingment的average也是对应到每个人（平均的一个人）
-- 关系数据库最麻烦的在于理清关系，可以借鉴excel的grouping，将所有一对多的情况收缩汇总到一对一的情况；
-- HAVING ROUND(avg(assignment_submissions.duration)) < assignments.duration;