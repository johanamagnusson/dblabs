INSERT INTO Departments(name, abbr) VALUES ('Computer Science', 'CS');
INSERT INTO Departments(name, abbr) VALUES ('Computer Engineering', 'CE');
INSERT INTO Departments(name, abbr) VALUES ('Physics', 'P');
INSERT INTO Departments(name, abbr) VALUES ('Electronics', 'E');
INSERT INTO Departments(name, abbr) VALUES ('Mathematics', 'M');
INSERT INTO Departments(name, abbr) VALUES ('Chemistry', 'CH');
INSERT INTO Departments(name, abbr) VALUES ('Biology', 'B');
INSERT INTO Programs(name, abbr) VALUES ('Information Technology', 'IT');
INSERT INTO Programs(name, abbr) VALUES ('Computer Science and Engineering', 'CSE');
INSERT INTO Programs(name, abbr) VALUES ('Engineering Physics', 'EP');
INSERT INTO Programs(name, abbr) VALUES ('Engineering Electronics', 'EE');
INSERT INTO Programs(name, abbr) VALUES ('Engineering Chemistry', 'EC');
INSERT INTO Programs(name, abbr) VALUES ('Engineering Chemistry with Phyiscs', 'ECP');
INSERT INTO Programs(name, abbr) VALUES ('Biotechnology', 'BIO');
INSERT INTO Programs(name, abbr) VALUES ('Mathematics Program', 'MP');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Information Technology', 'Computer Science');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Science');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Engieering');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Engineering Physics', 'Physics');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Engineering Electronics', 'Electronics');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Engineering Chemistry', 'Chemistry');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Engineering Chemistry with Phyiscs', 'Chemistry');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Engineering Chemistry with Phyiscs', 'Physics');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Biotechnology', 'Biology');
INSERT INTO HostedBy(programName, departmentName) VALUES ('Mathematics Program', 'Mathematics');
