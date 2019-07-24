const { Pool } = require("pg");
const args = process.argv.splice(2);

console.log(args);

const pool = new Pool({
  user: "vagrant",
  host: "localhost",
  database: "bootcampx",
  password: "vagrant"
});

pool
  .query(
    //     `
    // SELECT students.id AS id, students.name AS name, cohorts.name AS cohort_name
    // FROM students
    // JOIN cohorts ON cohorts.id = cohort_id
    // LIMIT 5;
    // `
    `
    SELECT students.id AS id, students.name AS name, cohorts.name AS cohort_name
    FROM students
    JOIN cohorts ON cohorts.id = cohort_id
    WHERE cohorts.name LIKE '%${args[0]}%'
    LIMIT ${args[1]};
`
  )
  // .then(res => {
  //   console.log(res.rows);
  // })
  .then(res => {
    res.rows.forEach(user => {
      console.log(
        `${user.name} has an id of ${user.id} and was in the ${
          user.cohort_name
        } cohort`
      );
    });
  })
  .catch(err => console.error("query error", err.stack));
