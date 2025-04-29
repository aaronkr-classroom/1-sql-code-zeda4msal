-- 테이블 생성
CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INTEGER NOT NULL
);

-- 데이터 삽입
INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

-- 테이블 생성
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 데이터 삽입
INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

-- student 테이블 생성
CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- student 테이블 데이터 삽입
INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

-- student_course 테이블 생성
CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

-- student_course 테이블 데이터 삽입
INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

SELECT 
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    c.name AS course_name,
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name
FROM student s
LEFT JOIN student_course sc ON s.id = sc.student_id
LEFT JOIN course c ON sc.course_id = c.id
LEFT JOIN teacher t ON c.teacher_id = t.id;


