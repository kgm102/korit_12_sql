CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,
	birth_date DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE students ADD phone VARCHAR(20);

ALTER TABLE students MODIFY COLUMN full_name VARCHAR(100);

-- DROP TABLE students;
INSERT INTO students (full_name, email, birth_date) VALUES
('김일', 'kim1@test.com', '2026-02-12'),
('김이', 'kim2@test.com', '2026-02-12'),
('김삼', 'kim3@test.com', '2026-02-12');
INSERT INTO students (student_id, full_name, email) VALUES
(3,'김삼', 'kim3@test.com');
	
SELECT * FROM students;

UPDATE students SET birth_date = '1990-01-01'
	WHERE student_id = 2;
	
UPDATE students SET phone = '010-3304-2798'
	WHERE student_id = 3;
	
INSERT INTO students (full_name, email, phone) VALUES
	('실수', 'mistake@test.com', '010-1234-5678');
	
DELETE FROM students WHERE student_id = 4;

INSERT INTO students2 (full_name, email)
	VALUES('김일', 'kim@test.com');
	
SELECT * FROM students2;

-- DELETE FROM students2 WHERE students2_id = 1;

INSERT INTO students2 (email)
	VALUES('test@test.com');

UPDATE students2 SET students2_id = 1
	WHERE students2_id = 2;
UPDATE students2 SET students2_id = 2
	WHERE students2_id = 4;
	
DELETE FROM students2 WHERE students2_id = 2;

INSERT INTO students2 (full_name, email, birth_date, phone)
	VALUES('kimgyumin', 'kgm102@naver.com', '1999-01-02', '010-3304-2798');
	
ALTER TABLE students2 AUTO_INCREMENT = 1;

INSERT INTO students2 (full_name, email, birth_date, phone)
	VALUES('kmm', 'khm', '1999-01-02', '010-3304-2798');

truncate students;

SELECT * FROM students;
	
INSERT INTO courses (course_name, professor, credits) values
	('데이터베이스기초', '강교수', 3),
	('자바프로그래밍', '이교수', 4),
	('웹디자인', '박교수', 2);
	
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES
	(1, 1, '2026-02-01'),
	(1, 2, '2026-02-01'),
	(2, 1, '2026-02-02');
	
SELECT * FROM enrollments;
UPDATE enrollments SET enrollments_id = 3
	WHERE enrollments_id = 3;
ALTER TABLE enrollments AUTO_INCREMENT = 1;
ALTER TABLE enrollments AUTO_INCREMENT = 4;
TRUNCATE enrollments;
DROP TABLE enrollments;

CREATE TABLE `enrollments` (
	`enrollments_id` INT(11) NOT NULL AUTO_INCREMENT,
	`student_id` INT(11) NULL DEFAULT NULL,
	`course_id` INT(11) NULL DEFAULT NULL,
	`enroll_date` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`enrollments_id`) USING BTREE,
	INDEX `FK1_student` (`student_id`) USING BTREE,
	INDEX `FK2_course` (`course_id`) USING BTREE,
	CONSTRAINT `FK1_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_uca1400_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT s.full_name, c.course_name, e.enroll_date, c.professor
	FROM students s
	JOIN enrollments e ON s.student_id = e.student_id
	JOIN courses c ON c.course_id = e.course_id
	WHERE s.student_id = 1;

-- 문제 풀기

INSERT INTO students (email, birth_date, phone) VALUES
('park@test.com', '1995-05-05', '010-5555-6666');
SELECT * FROM students;
UPDATE students SET full_name = '박지민'
	WHERE student_id = 4;
	
SELECT * from courses;
INSERT INTO courses (course_name, professor, credits) VALUES
('파이썬 프로그래밍', '최교수', 3);

SELECT * FROM enrollments;
SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES
	(4, 1, '2026-02-12'),
	(4, 4, '2026-02-12');
	
SELECT course_name
	FROM courses 
	WHERE professor = '이교수';
	
SELECT full_name, phone
	FROM students
	WHERE email LIKE '%test.com%';
	
SELECT s.full_name, e.enroll_date
	FROM enrollments e
	JOIN students s ON e.student_id = s.student_id
	WHERE e.course_id = 1;

UPDATE students SET phone = '010-1597-7533'
	WHERE student_id = 2;
	
UPDATE courses SET professor = '김교수'
	WHERE course_id = 3;
	
UPDATE courses SET professor = '김교수'
	WHERE course_id = 3;
	
UPDATE courses SET credits = credits + 1;

SELECT * FROM students;
SELECT * FROM enrollments;

DELETE FROM students WHERE student_id = 2;
DELETE FROM enrollments WHERE enrollments_id = 3;

SELECT * FROM enrollments;
SELECT * FROM students;
SELECT * FROM courses;
DELETE 
FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id 
    FROM enrollments                                                                  
);