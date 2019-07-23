SELECT COUNT(assistance_requests.*) AS total_assistances,
  teachers.name AS name
FROM teachers JOIN assistance_requests ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;
-- 容易迷惑的地方在于，即便选了name=someone，并不会自动group，因为使用了COUNT-是一个
-- aggregate的func，也就要求GROUP BY；如果把WHERE name= comment out就容易理解了；
--由于是程序语言，和人类语言不同，GROUP不会自动加总，实际上是两个步骤，把目标按照
-- 名字group以及各个名字对应的count加总；两者必须同时写入；