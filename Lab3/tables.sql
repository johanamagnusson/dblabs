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
    personNr BIGINT PRIMARY KEY,
    studentName TEXT NOT NULL,
    studentID TEXT NOT NULL UNIQUE,
    program TEXT REFERENCES Programs (name),
    UNIQUE (personNr, program)
);

DROP TABLE IF EXISTS Selected CASCADE;
CREATE TABLE Selected (
    student BIGINT PRIMARY KEY,
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
    student BIGINT,
    course CHAR(6),
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS HasTaken CASCADE;
CREATE TABLE HasTaken (
    student BIGINT,
    course CHAR(6),
    grade CHAR(1) NOT NULL,
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES Courses (code)
);

DROP TABLE IF EXISTS WaitingFor CASCADE;
CREATE TABLE WaitingFor (
    student BIGINT,
    course CHAR(6),
    placeInList INT NOT NULL,
    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students (personNr),
    FOREIGN KEY (course) REFERENCES Courses (code),
    UNIQUE (course, placeInList)
);
