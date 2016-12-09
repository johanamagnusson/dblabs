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
SELECT Students.studentName,
  Students.personNr,
  Courses.courseName,
  Courses.code, 
  Courses.credits,
  HasTaken.grade
FROM HasTaken
  JOIN Students
    ON HasTaken.student = Students.personNr
  JOIN Courses
    ON HasTaken.course = Courses.code
WHERE HasTaken.grade = '3' OR HasTaken.grade = '4' OR HasTaken.grade = '5';

DROP VIEW IF EXISTS UnreadMandatory;
CREATE OR REPLACE VIEW UnreadMandatory AS
SELECT unreadMandatoryProgram.personnr, unreadMandatoryProgram.studentname, unreadMandatoryProgram.course AS "course"
FROM
( 
SELECT Students.personnr AS "personnr", Students.studentname AS "studentname", ProgramMandatory.course AS "course"
FROM Students 
JOIN ProgramMandatory
  ON ProgramMandatory.program = Students.program
) AS unreadMandatoryProgram
UNION ALL
SELECT unreadMandatoryBranch.personnr, unreadMandatoryBranch.studentname, unreadMandatoryBranch.course AS "course"
FROM
(
SELECT Students.personnr AS "personnr", Students.studentname AS "studentname", BranchMandatory.course AS "course"--,HasTaken.grade--
FROM Students 
JOIN Selected
  ON Students.personNr = Selected.student
JOIN BranchMandatory
  ON BranchMandatory.branch = Selected.branch
) AS unreadMandatoryBranch
EXCEPT SELECT personNr,studentName,code AS course FROM PassedCourses
ORDER BY studentName
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

DROP VIEW IF EXISTS PathToGraduation;
CREATE OR REPLACE VIEW PathToGraduation AS
SELECT
Students.personNr as "Person number",
Students.studentName as "Name",
totalCredits.sumcredits as "Total credits",
numUnreadMandatory.coursecount as "Mandatory courses left",
mathCredits.sumcredits as "Mathematical credits",
researchCredits.sumcredits as "Research credits",
numSeminar.coursecount as "Number of seminar",
CASE
    WHEN mathCredits.sumcredits >= 20 AND
        researchCredits.sumcredits >= 10 AND
        numSeminar.coursecount >= 1 AND
        numUnreadMandatory.coursecount IS NULL AND
        recommendedCredits.sumcredits >= 10
    THEN 'Yes'
    ELSE 'No'
END AS "Can graduate"
FROM Students
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    SUM(credits) as "sumcredits"
    FROM PassedCourses
    GROUP BY personNr, studentName
) AS totalCredits
ON Students.personNr = totalCredits.personnr
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    COUNT(course) as "coursecount"
    FROM UnreadMandatory
    GROUP BY personNr, studentName
) AS numUnreadMandatory
ON Students.personNr = numUnreadMandatory.personNr
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    SUM(credits) as "sumcredits"
    FROM PassedCourses
    JOIN ClassifiedBy
    ON PassedCourses.code = ClassifiedBy.course
    WHERE ClassifiedBy.classification = 'Mathematical'
    GROUP BY personNr, studentName
) AS mathCredits
ON Students.personNr = mathCredits.personNr
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    SUM(credits) as "sumcredits"
    FROM PassedCourses
    JOIN ClassifiedBy
    ON PassedCourses.code = ClassifiedBy.course
    WHERE ClassifiedBy.classification = 'Research'
    GROUP BY personNr, studentName
) AS researchCredits
ON Students.personNr = researchCredits.personNr
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    COUNT(course) as "coursecount"
    FROM PassedCourses
    JOIN ClassifiedBy
    ON PassedCourses.code = ClassifiedBy.course
    WHERE ClassifiedBy.classification = 'Seminar'
    GROUP BY personNr, studentName
) AS numSeminar
ON Students.personNr = numSeminar.personNr
LEFT JOIN
(
    SELECT
    personNr as "personnr",
    studentName as "studentname",
    SUM(credits) as "sumcredits"
    FROM PassedCourses
    JOIN Recommended
    ON PassedCourses.code = Recommended.course
    GROUP BY personNr, studentName
) AS recommendedCredits
ON Students.personNr = researchCredits.personNr
ORDER BY Students.studentName
;

