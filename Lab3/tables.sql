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
    personNr INT PRIMARY KEY,
    name TEXT NOT NULL,
    studentID INT NOT NULL UNIQUE,
    program TEXT REFERENCES Programs (name),
    UNIQUE program
);

DROP TABLE IF EXISTS Selected CASCADE;
CREATE TABLE Selected (
    student TEXT PRIMARY KEY,
    branch TEXT,
    program TEXT,
    FOREIGN KEY (student, program) REFERENCES Students (personNr, program),
    UNIQUE (student, program)
    --(branch, program) REFERENCES Branches (name, program)
);
