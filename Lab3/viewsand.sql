DROP VIEW IF EXISTS PathToGraduation;
CREATE OR REPLACE VIEW PathToGraduation AS
SELECT Students.studentName AS "Student Name",
    Students.personNr AS "Person Number",
    HasTaken.grade AS "GRADE"
FROM HasTaken
    JOIN Students
        ON HasTaken.student = Students.personNr
    JOIN Courses
        ON HasTaken.course = Courses.code
;

DROP VIEW IF EXISTS Registrations;
CREATE OR REPLACE VIEW Registrations AS
SELECT DISTINCT Courses.courseName AS "Course Name",
    Courses.code AS "Course Code",
    Students.studentName AS "Student Name",
    Students.personNr AS "Person Number",
    CASE
        WHEN EXISTS (SELECT * FROM IsTaking WHERE student = Students.personNr)
        THEN 'registered'
        WHEN EXISTS (SELECT * FROM WaitingFor WHERE student = Students.personNr)
        THEN 'waiting'
    END AS "Waiting Status"
FROM Students, Courses, IsTaking, WaitingFor
WHERE (Courses.code = IsTaking.course
    AND Students.personNr = IsTaking.student)
    OR (Courses.code = WaitingFor.course
    AND Students.personNr = WaitingFor.student)
ORDER BY "Waiting Status"
;

