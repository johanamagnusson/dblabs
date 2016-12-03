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
INSERT INTO Programs (name, abbr) VALUES ('Engineering Chemistry with Phyiscs', 'ECP');
INSERT INTO Programs (name, abbr) VALUES ('Biotechnology', 'BIO');
INSERT INTO Programs (name, abbr) VALUES ('Mathematics Program', 'MP');

INSERT INTO HostedBy (programName, departmentName) VALUES ('Information Technology', 'Computer Science');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Science');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Computer Science and Engineering', 'Computer Engineering');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Physics', 'Physics');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Electronics', 'Electronics');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry', 'Chemistry');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry with Phyiscs', 'Chemistry');
INSERT INTO HostedBy (programName, departmentName) VALUES ('Engineering Chemistry with Phyiscs', 'Physics');
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
INSERT INTO Branches (name, program) VALUES ('Applied Chemistry with Phyiscs', 'Engineering Chemistry with Phyiscs');
INSERT INTO Branches (name, program) VALUES ('Complex Chemistry with Phyiscs', 'Engineering Chemistry with Phyiscs');
INSERT INTO Branches (name, program) VALUES ('Theoretical Chemistry with Phyiscs', 'Engineering Chemistry with Phyiscs');
INSERT INTO Branches (name, program) VALUES ('Applied Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Complex Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Theoretical Biotechnology', 'Biotechnology');
INSERT INTO Branches (name, program) VALUES ('Applied Mathematics', 'Mathematics Program');
INSERT INTO Branches (name, program) VALUES ('Complex Mathematics', 'Mathematics Program');
INSERT INTO Branches (name, program) VALUES ('Theoretical Mathematics', 'Mathematics Program');

INSERT INTO Courses (code, name,credits,department) VALUES ('CSE101', 'Computer Science 1',15,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CSE102', 'Computer Science 2',7.5,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CSE103', 'Computer Science 3',7.5,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CSE104', 'Computer Science 4',7.5,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CSE105', 'Computer Science 5',7.5,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CSE106', 'Computer Science 6',7.5,'Computer Science');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE101', 'Computer Engineering 1',15,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE102', 'Computer Engineering 2',7.5,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE103', 'Computer Engineering 3',7.5,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE104', 'Computer Engineering 4',7.5,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE105', 'Computer Engineering 5',7.5,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('CEE106', 'Computer Engineering 6',7.5,'Computer Engineering');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY101', 'Physics 1',15,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY102', 'Physics 2',7.5,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY103', 'Physics 3',7.5,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY104', 'Physics 4',7.5,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY105', 'Physics 5',7.5,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('PHY106', 'Physics 6',7.5,'Physics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE101', 'Electronics 1',15,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE102', 'Electronics 2',7.5,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE103', 'Electronics 3',7.5,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE104', 'Electronics 4',7.5,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE105', 'Electronics 5',7.5,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('ELE106', 'Electronics 6',7.5,'Electronics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT101', 'Mathematics 1',15,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT102', 'Mathematics 2',7.5,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT103', 'Mathematics 3',7.5,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT104', 'Mathematics 4',7.5,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT105', 'Mathematics 5',7.5,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('MAT106', 'Mathematics 6',7.5,'Mathematics');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE101', 'Chemistry 1',15,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE102', 'Chemistry 2',7.5,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE103', 'Chemistry 3',7.5,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE104', 'Chemistry 4',7.5,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE105', 'Chemistry 5',7.5,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('CHE106', 'Chemistry 6',7.5,'Chemistry');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO101', 'Biology 1',15,'Biology');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO102', 'Biology 2',7.5,'Biology');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO103', 'Biology 3',7.5,'Biology');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO104', 'Biology 4',7.5,'Biology');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO105', 'Biology 5',7.5,'Biology');
INSERT INTO Courses (code, name,credits,department) VALUES ('BIO106', 'Biology 6',7.5,'Biology');

INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CSE106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CEE106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('PHY106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('MAT106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('CHE106',10);
INSERT INTO LimitedCourses (code, maxStudents) VALUES ('BIO106',10);

INSERT INTO Students (personNr, name, studentID, program) VALUES ('9004103553', 'Andreas Magnusson', 'andrmag', 'Engineering Physics')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9210024536', 'Sebastian Karlsson', 'sebkar', 'Engineering Electronics')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('8702071334', 'Oskar Paulander', 'poskar', 'Engineering Physics')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9103299485', 'Victor Strand', 'vicsa', 'Engineering Chemistry')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('8912247345', 'Tony Johansson', 'tojo', 'Mathematics Program')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9310304567', 'Aron Kerekes', 'arker', 'Computer Science and Engineering')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9002243255', 'Rickard Andersson', 'ricander', 'Engineering Physics')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9006104212', 'Malin Johansson', 'mano', 'Information Technology')
INSERT INTO Students (personNr, name, studentID, program) VALUES ('9104205293', 'Elin Pelin', 'elpe', 'Computer Science and Engineering ')
