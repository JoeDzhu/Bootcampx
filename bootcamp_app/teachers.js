const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  host: "localhost",
  database: "bootcampx",
  password: "vagrant"
});

// console.log("good connection");
// console.log(process.argv[2]);

pool
  .query(
    `
    SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
    FROM teachers
    JOIN assistance_requests ON teacher_id = teachers.id
    JOIN students ON student_id = students.id
    JOIN cohorts ON cohort_id = cohorts.id
    WHERE cohorts.name = '${process.argv[2]}'
    ORDER BY teacher;
  `
  )
  .then(res => {
    console.log("connected");
    // console.log(res.rows);
    res.rows.forEach(info => {
      console.log(`${info.cohort}: ${info.teacher}`);
    });
  })
  .catch(error => console.log("query error", error.stack));
