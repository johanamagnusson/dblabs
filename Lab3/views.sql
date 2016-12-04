DROP VIEW IF EXISTS StudentsFollowing;
CREATE OR REPLACE VIEW StudentsFollowing AS 
SELECT Students.StudentName AS "Student Name",
  Students.personNr AS "Person Number",
  Students.studentId AS "Student ID",
  Students.program AS "Program",
  Selected.branch AS "Branch"
FROM Students FULL JOIN Selected
  ON personNr = student
;

DROP VIEW IF EXISTS FinishedCourses;
CREATE OR REPLACE VIEW FinishedCourses AS
SELECT Students.studentName AS "Student Name",
  Students.personNr AS "Person Number",
  Courses.courseName AS "Course Name",
  Courses.code AS "Course Code", 
  Courses.credits AS "Credits",
  HasTaken.grade AS "GRADE"
FROM HasTaken
  JOIN Students
    ON HasTaken.student = Students.personNr
  JOIN Courses
    ON HasTaken.course = Courses.code
;

DROP VIEW IF EXISTS PassedCourses;
CREATE OR REPLACE VIEW PassedCourses AS
SELECT Students.studentName AS "Student Name",
  Students.personNr AS "Person Number",
  Courses.courseName AS "Course Name",
  Courses.code AS "Course Code", 
  Courses.credits AS "Credits",
  HasTaken.grade AS "GRADE"
FROM HasTaken
  JOIN Students
    ON HasTaken.student = Students.personNr
  JOIN Courses
    ON HasTaken.course = Courses.code
WHERE HasTaken.grade = '3' OR HasTaken.grade = '4' OR HasTaken.grade = '5';

DROP VIEW IF EXISTS Registrations;
CREATE OR REPLACE VIEW Registrations AS
SELECT Students.studentName AS "Student Name",
Students.personNr AS "Person Number",