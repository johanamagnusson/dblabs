DROP TABLE IF EXISTS Departments CASCADE;
CREATE TABLE Departments (
    name TEXT PRIMARY KEY,
    abbr TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Programs CASCADE;
CREATE TABLE Programs (
    name TEXT PRIMARY KEY,
    abbr TEXT NOT NULL
);

DROP TABLE IF EXISTS HostedBy CASCADE;
CREATE TABLE HostedBy (
    departmentName TEXT,
    programName TEXT,
    PRIMARY KEY (departmentName, programName),
    FOREIGN KEY (departmentName) REFERENCES Departments (name),
    FOREIGN KEY (programName) REFERENCES Programs (name)
);

DROP TABLE IF EXISTS Branches CASCADE;
CREATE TABLE Branches (
    name TEXT,
    program TEXT,
    PRIMARY KEY (name, program),
    FOREIGN KEY (program) REFERENCES Programs (name)
);

DROP TABLE IF EXISTS Students CASCADE;
CREATE TABLE Students (
    personNr CHAR(11) PRIMARY KEY,
    studentName TEXT NOT NULL,
    studentID TEXT NOT NULL UNIQUE,
    program TEXT REFERENCES Programs (name),
    UNIQUE (personNr, program)
);

DROP TABLE IF EXISTS Selected CASCADE;
CREATE TABLE Selected (
    student CHAR(11) PRIMARY KEY,
    branch TEXT,
    program TEXT,
    FOREIGN KEY (student, program) REFERENCES Students (personNr, program),
    FOREIGN KEY (branch, program) REFERENCES Branches (name, program)
);

DROP TABLE IF EXISTS Courses CASCADE;
CREATE TABLE Courses (
    code CHAR(6) PRIMARY KEY,
    courseName TEXT NOT NULL,
    credits FLOAT NOT NULL,
    department TEXT REFERENCES Departments (name)
);

DROP TABLE IF EXISTS LimitedCourses CASCADE;
CREATE TABLE LimitedCourses (
    code CHAR(6) PRIMARY KEY,
    maxStudents INT NOT NULL,
    FOREIGN KEY (code) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS Classifications CASCADE;
CREATE TABLE Classifications (
    name TEXT PRIMARY KEY
);

DROP TABLE IF EXISTS ClassifiedBy CASCADE;
CREATE TABLE ClassifiedBy (
    course CHAR(6),
    classification TEXT,
    PRIMARY KEY (course, classification),
    FOREIGN KEY (course) REFERENCES Courses (code),
    FOREIGN KEY (classification) REFERENCES Classifications (name)
);

DROP TABLE IF EXISTS HasPrerequisities CASCADE;
CREATE TABLE HasPrerequisities (
    course CHAR(6),
    prerequisity CHAR(6),
    PRIMARY KEY (course, prerequisity),
    FOREIGN KEY (course) REFERENCES Courses (code),
    FOREIGN KEY (prerequisity) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS ProgramMandatory CASCADE;
CREATE TABLE ProgramMandatory (
    program TEXT,
    course CHAR(6),
    PRIMARY KEY (program, course),
    FOREIGN KEY (program) REFERENCES Programs (name),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS BranchMandatory CASCADE;
CREATE TABLE BranchMandatory (
    branch TEXT,
    program TEXT,
    course CHAR(6),
    PRIMARY KEY (branch, program, course),
    FOREIGN KEY (branch, program) REFERENCES Branches (name, program),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS Recommended CASCADE;
CREATE TABLE Recommended (
    branch TEXT,
    program TEXT,
    course CHAR(6),
    PRIMARY KEY (branch, program, course),
    FOREIGN KEY (branch, program) REFERENCES Branches (name, program),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS IsTaking CASCADE;
CREATE TABLE IsTaking (
    student CHAR(11),
    course CHAR(6),
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS HasTaken CASCADE;
CREATE TABLE HasTaken (
    student CHAR(11),
    course CHAR(6),
    grade CHAR(1) NOT NULL,
    CHECK(grade='3' OR grade='4' OR grade='5' OR grade='U'),
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES Courses (code)
  );

DROP TABLE IF EXISTS WaitingFor CASCADE;
CREATE TABLE WaitingFor (
    student CHAR(11),
    course CHAR(6),
    placeInList INT NOT NULL,
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES LimitedCourses (code),
    UNIQUE (course, placeInList)
);
INSERT INTO Departments (name, abbr) VALUES ('Computer Science', 'CS');
INSERT INTO Departments (name, abbr) VALUES ('Computer Engineering', 'CE');
INSERT INTO Departments (name, abbr) VALUES ('Physics', 'P');
INSERT INTO Departments (name, abbr) VALUES ('Electronics', 'E');
INSERT INTO Departments (name, abbr) VALUES ('Mathematics', 'M');
INSERT INTO Departments (name, abbr) VALUES ('Chemistry', 'CH');
INSERT INTO Departments (name, abbr) VALUES ('Biology', 'B');

INSERT INTO Programs (name, abbr) VALUES ('Information Technology', 'IT');
INSERT INTO Programs (name, abbr) VALUES ('Computer Science and Engineering', 'CSE');
INSERT INTO Programs (name, abbr) VALUES ('Engineering Physics', 'EP');
INSERT INTO Programs (name, abbr) VALUES ('Engineering Electronics', 'EE');
INSERT INTO Programs (name, abbr) VALUES ('Engineering Chemistry', 'EC');
INSERT INTO Programs (name, abbr) VALUES ('Engineering Chemistry with Physics', 'ECP');
INSERT INTO Programs (name, abbr) VALUES ('Biotechnology', 'BIO');
INSERT INTO Programs (name, abbr) VALUES ('Mathematics Program', 'MP');

INSERT INTO HostedBy (programName, departmentName) VALUES ('Information Technology', 'Computer Science');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Science');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Engineering');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Physics', 'Physics');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Electronics', 'Electronics');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry', 'Chemistry');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry with Physics', 'Chemistry');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry with Physics', 'Physics');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Biotechnology', 'Biology');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Mathematics Program', 'Mathematics');

INSERT INTO Branches (name, program) VALUES ('Applied Information Technology', 'Information Technology');
INSERT INTO Branches (name, program) VALUES ('Complex Information Technology', 'Information Technology');
INSERT INTO Branches (name, program) VALUES ('Theoretical Information Technology', 'Information Technology');
INSERT INTO Branches (name, program) VALUES ('Applied Computer Science', 'Computer Science and Engineering');
INSERT INTO Branches (name, program) VALUES ('Complex Computer Science', 'Computer Science and Engineering');
INSERT INTO Branches (name, program) VALUES ('Theoretical Computer Science', 'Computer Science and Engineering');
INSERT INTO Branches (name, program) VALUES ('Applied Physics', 'Engineering Physics');
INSERT INTO Branches (name, program) VALUES ('Complex Physics', 'Engineering Physics');
INSERT INTO Branches (name, program) VALUES ('Theoretical Physics', 'Engineering Physics');
INSERT INTO Branches (name, program) VALUES ('Applied Electronics', 'Engineering Electronics');
INSERT INTO Branches (name, program) VALUES ('Complex Electronics', 'Engineering Electronics');
INSERT INTO Branches (name, program) VALUES ('Theoretical Electronics', 'Engineering Electronics');
INSERT INTO Branches (name, program) VALUES ('Applied Chemistry', 'Engineering Chemistry');
INSERT INTO Branches (name, program) VALUES ('Complex Chemistry', 'Engineering Chemistry');
INSERT INTO Branches (name, program) VALUES ('Theoretical Chemistry', 'Engineering Chemistry');
INSERT INTO Branches (name, program) VALUES ('Applied Chemistry with Physics', 'Engineering Chemistry with Physics');
INSERT INTO Branches (name, program) VALUES ('Complex Chemistry with Physics', 'Engineering Chemistry with Physics');
INSERT INTO Branches (name, program) VALUES ('Theoretical Chemistry with Physics', 'Engineering Chemistry with Physics');
INSERT INTO Branches (name, program) VALUES ('Applied Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Complex Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Theoretical Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Applied Mathematics', 'Mathematics Program');
INSERT INTO Branches (name, program) VALUES ('Complex Mathematics', 'Mathematics Program');
INSERT INTO Branches (name, program) VALUES ('Theoretical Mathematics', 'Mathematics Program');

INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE101', 'Computer Science 1',15,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE102', 'Computer Science 2',7.5,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE103', 'Computer Science 3',7.5,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE104', 'Computer Science 4',7.5,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE105', 'Computer Science 5',7.5,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CSE106', 'Computer Science 6',7.5,'Computer Science');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE101', 'Computer Engineering 1',15,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE102', 'Computer Engineering 2',7.5,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE103', 'Computer Engineering 3',7.5,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE104', 'Computer Engineering 4',7.5,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE105', 'Computer Engineering 5',7.5,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CEE106', 'Computer Engineering 6',7.5,'Computer Engineering');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY101', 'Physics 1',15,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY102', 'Physics 2',7.5,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY103', 'Physics 3',7.5,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY104', 'Physics 4',7.5,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY105', 'Physics 5',7.5,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('PHY106', 'Physics 6',7.5,'Physics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE101', 'Electronics 1',15,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE102', 'Electronics 2',7.5,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE103', 'Electronics 3',7.5,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE104', 'Electronics 4',7.5,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE105', 'Electronics 5',7.5,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('ELE106', 'Electronics 6',7.5,'Electronics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT101', 'Mathematics 1',15,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT102', 'Mathematics 2',7.5,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT103', 'Mathematics 3',7.5,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT104', 'Mathematics 4',7.5,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT105', 'Mathematics 5',7.5,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('MAT106', 'Mathematics 6',7.5,'Mathematics');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE101', 'Chemistry 1',15,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE102', 'Chemistry 2',7.5,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE103', 'Chemistry 3',7.5,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE104', 'Chemistry 4',7.5,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE105', 'Chemistry 5',7.5,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('CHE106', 'Chemistry 6',7.5,'Chemistry');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO101', 'Biology 1',15,'Biology');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO102', 'Biology 2',7.5,'Biology');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO103', 'Biology 3',7.5,'Biology');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO104', 'Biology 4',7.5,'Biology');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO105', 'Biology 5',7.5,'Biology');
INSERT INTO Courses (code, courseName,credits,department) VALUES ('BIO106', 'Biology 6',7.5,'Biology');

INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CSE103','CSE101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CSE103','CSE102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CEE103','CEE101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CEE103','CEE102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('PHY103','PHY101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('PHY103','PHY102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('ELE103','ELE101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('ELE103','ELE102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('MAT103','MAT101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('MAT103','MAT102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CHE103','CHE101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('CHE103','CHE102');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('BIO103','BIO101');
INSERT INTO HasPrerequisities (course,prerequisity) VALUES('BIO103','BIO102');

INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CSE106',4);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CEE106',4);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('PHY106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('MAT106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CHE106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('BIO106',10);

INSERT INTO Classifications (name) VALUES ('Mathematical');
INSERT INTO Classifications (name) VALUES ('Research');
INSERT INTO Classifications (name) VALUES ('Seminar');

INSERT INTO ClassifiedBy (course,classification) VALUES ('CSE101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('CEE101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('PHY101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('MAT101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('CHE101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('BIO101', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('BIO101', 'Research');
INSERT INTO ClassifiedBy (course,classification) VALUES ('BIO101', 'Seminar');
INSERT INTO ClassifiedBy (course,classification) VALUES ('CSE106', 'Seminar');
INSERT INTO ClassifiedBy (course,classification) VALUES ('CHE105', 'Research');
INSERT INTO ClassifiedBy (course,classification) VALUES ('CHE106', 'Research');
INSERT INTO ClassifiedBy (course,classification) VALUES ('MAT102', 'Mathematical');
INSERT INTO ClassifiedBy (course,classification) VALUES ('MAT103', 'Mathematical');

INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('900410-3553', 'Andreas Magnusson', 'andrmag', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('921002-4536', 'Sebastian Karlsson', 'sebkar', 'Engineering Electronics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('870207-1334', 'Oskar Paulander', 'poskar', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('910329-9485', 'Victor Strand', 'vicsa', 'Engineering Chemistry');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('891224-7345', 'Tony Johansson', 'tojo', 'Mathematics Program');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('931030-4567', 'Aron Kerekes', 'arker', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('900224-3255', 'Rickard Andersson', 'ricander', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('900610-4212', 'Malin Johansson', 'mano', 'Information Technology');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('910420-5293', 'Elin Pelin', 'elpe', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('610101-1337', 'Walter White', 'ww', 'Engineering Chemistry');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('440410-3553', 'Emmett Brown', 'ebrown', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('770410-3553', 'Leonard Hofstadter', 'lhof', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('740410-7785', 'Sheldon Cooper', 'shecoo', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('7504108-998', 'Bernadette Rostenkowski-Wolowitz', 'berros', 'Biotechnology');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('550410-4455', 'Han Solo', 'hansol', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES ('591105-1959', 'Frank Underwood', 'FraUnd', 'Engineering Chemistry with Physics');

INSERT INTO Selected (student, branch, program) VALUES ('900410-3553', 'Complex Physics', 'Engineering Physics');
INSERT INTO Selected (student, branch, program) VALUES ('921002-4536', 'Complex Electronics', 'Engineering Electronics');
INSERT INTO Selected (student, branch, program) VALUES ('610101-1337', 'Theoretical Chemistry', 'Engineering Chemistry');


INSERT INTO IsTaking (student, course) VALUES ('900610-4212', 'CSE106');
INSERT INTO IsTaking (student, course) VALUES ('910420-5293', 'CSE106');
INSERT INTO IsTaking (student, course) VALUES ('891224-7345', 'CSE106');
INSERT INTO IsTaking (student, course) VALUES ('931030-4567', 'CSE106');

INSERT INTO IsTaking (student, course) VALUES ('900610-4212', 'CEE106');
INSERT INTO IsTaking (student, course) VALUES ('910420-5293', 'CEE106');
INSERT INTO IsTaking (student, course) VALUES ('891224-7345', 'CEE106');
INSERT INTO IsTaking (student, course) VALUES ('931030-4567', 'CEE106');

INSERT INTO HasTaken (student, course,grade) VALUES ('900410-3553', 'CEE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('921002-4536', 'CEE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('921002-4536', 'CEE102','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('900224-3255', 'CEE101','U');
INSERT INTO HasTaken (student, course,grade) VALUES ('900224-3255', 'MAT101','3');
INSERT INTO HasTaken (student, course,grade) VALUES ('910420-5293', 'MAT105','4');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE102','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE103','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE104','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE105','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'CHE106','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'PHY101','4');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'MAT101','3');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'MAT102','4');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'MAT103','5');
INSERT INTO HasTaken (student, course,grade) VALUES ('610101-1337', 'BIO101','5');

INSERT INTO WaitingFor (student, course, placeInList) VALUES ('900410-3553', 'CSE106', 1);
INSERT INTO WaitingFor (student, course, placeInList) VALUES ('921002-4536', 'CSE106', 2);
INSERT INTO WaitingFor (student, course, placeInList) VALUES ('870207-1334', 'CSE106', 3);

INSERT INTO WaitingFor (student, course, placeInList) VALUES ('900410-3553', 'CEE106', 1);
INSERT INTO WaitingFor (student, course, placeInList) VALUES ('921002-4536', 'CEE106', 2);
INSERT INTO WaitingFor (student, course, placeInList) VALUES ('870207-1334', 'CEE106', 3);

INSERT INTO ProgramMandatory (program, course) VALUES ('Information Technology', 'CSE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Computer Science and Engineering', 'CSE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Computer Science and Engineering', 'CEE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Engineering Physics', 'PHY101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Engineering Chemistry with Physics', 'PHY101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Engineering Electronics', 'ELE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Mathematics Program', 'MAT101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Engineering Chemistry', 'CHE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Engineering Chemistry with Physics', 'CHE101');
INSERT INTO ProgramMandatory (program, course) VALUES ('Biotechnology', 'BIO101');

INSERT INTO BranchMandatory (branch, program, course) VALUES ('Complex Physics', 'Engineering Physics', 'PHY102');
INSERT INTO BranchMandatory (branch, program, course) VALUES ('Applied Physics','Engineering Physics', 'PHY102');
INSERT INTO BranchMandatory (branch, program, course) VALUES ('Applied Mathematics', 'Mathematics Program', 'MAT102');
INSERT INTO BranchMandatory (branch, program, course) VALUES ('Complex Computer Science', 'Computer Science and Engineering', 'CEE102');
INSERT INTO BranchMandatory (branch, program, course) VALUES ('Applied Biotechnology', 'Biotechnology', 'BIO102');
INSERT INTO BranchMandatory (branch, program, course) VALUES ('Theoretical Chemistry', 'Engineering Chemistry', 'CHE102');

INSERT INTO Recommended (branch, program, course) VALUES ('Complex Physics', 'Engineering Physics', 'PHY103');
INSERT INTO Recommended (branch, program, course) VALUES ('Applied Physics','Engineering Physics', 'PHY104');
INSERT INTO Recommended (branch, program, course) VALUES ('Applied Mathematics', 'Mathematics Program', 'MAT103');
INSERT INTO Recommended (branch, program, course) VALUES ('Complex Computer Science', 'Computer Science and Engineering', 'CEE103');
INSERT INTO Recommended (branch, program, course) VALUES ('Applied Biotechnology', 'Biotechnology', 'BIO103');
INSERT INTO Recommended (branch, program, course) VALUES ('Theoretical Chemistry', 'Engineering Chemistry', 'CHE103');
INSERT INTO Recommended (branch, program, course) VALUES ('Theoretical Chemistry', 'Engineering Chemistry', 'CHE104');

-- DATA FOR TRIGGER TESTS --
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('MAT102',3);
INSERT INTO IsTaking (student, course) VALUES ('900610-4212', 'MAT102');
INSERT INTO IsTaking (student, course) VALUES ('910420-5293', 'MAT102');
INSERT INTO HasTaken (student, course, grade) VALUES ('900410-3553', 'MAT101', '5');
INSERT INTO HasTaken (student, course, grade) VALUES ('921002-4536', 'MAT101', '5');
INSERT INTO HasTaken (student, course, grade) VALUES ('740410-7785', 'MAT101', '5');

INSERT INTO HasPrerequisities (course, prerequisity) VALUES ('MAT102', 'MAT101');

----------------------------

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
SELECT DISTINCT
    Courses.code AS "code",
    Courses.coursename AS "name",
    Students.personNr AS "personnr",
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

DROP VIEW IF EXISTS CourseQueuePositions;
CREATE OR REPLACE VIEW CourseQueuePositions AS
SELECT course as "Course code",
personNr AS "Student person nr.",
studentName AS "Student name",
placeinlist AS "Place in queue"
FROM Students
JOIN WaitingFor
ON Students.personNr = WaitingFor.student
;
