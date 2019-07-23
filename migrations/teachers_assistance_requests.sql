CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE,
  is_active BOOLEAN DEFAULT TRUE
  -- 给布林值设定default初值；
);

CREATE TABLE assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  -- reference到其他表的PK的时候，用括弧，写法不一样，因为是身出其他表内；
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  -- 到具体时点，用TIMESTAMP而不是DATE
  student_feedback TEXT,
  teacher_feedback TEXT
);

SELECT students.name AS name, assimengt.name AS assignment_name FROM studnets JOIN JT ON students.id = student_id JOIN A on assi.id=ass_id;

