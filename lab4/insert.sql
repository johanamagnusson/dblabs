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

INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9004103553, 'Andreas Magnusson', 'andrmag', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9210024536, 'Sebastian Karlsson', 'sebkar', 'Engineering Electronics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (8702071334, 'Oskar Paulander', 'poskar', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9103299485, 'Victor Strand', 'vicsa', 'Engineering Chemistry');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (8912247345, 'Tony Johansson', 'tojo', 'Mathematics Program');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9310304567, 'Aron Kerekes', 'arker', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9002243255, 'Rickard Andersson', 'ricander', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9006104212, 'Malin Johansson', 'mano', 'Information Technology');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (9104205293, 'Elin Pelin', 'elpe', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (6101011337, 'Walter White', 'ww', 'Engineering Chemistry');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (4404103553, 'Emmett Brown', 'ebrown', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (7704103553, 'Leonard Hofstadter', 'lhof', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (7404107785, 'Sheldon Cooper', 'shecoo', 'Engineering Physics');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (7504108998, 'Bernadette Rostenkowski-Wolowitz', 'berros', 'Biotechnology');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (5504104455, 'Han Solo', 'hansol', 'Computer Science and Engineering');
INSERT INTO Students (personNr, studentName, studentID, program) VALUES (5911051959, 'Frank Underwood', 'FraUnd', 'Engineering Chemistry with Physics');

INSERT INTO Selected (student, branch, program) VALUES (9004103553, 'Complex Physics', 'Engineering Physics');
INSERT INTO Selected (student, branch, program) VALUES (9210024536, 'Complex Electronics', 'Engineering Electronics');


INSERT INTO IsTaking (student, course) VALUES (9006104212, 'CSE106');
INSERT INTO IsTaking (student, course) VALUES (9104205293, 'CSE106');
INSERT INTO IsTaking (student, course) VALUES (8912247345, 'CSE106');
INSERT INTO IsTaking (student, course) VALUES (9310304567, 'CSE106');

INSERT INTO IsTaking (student, course) VALUES (9006104212, 'CEE106');
INSERT INTO IsTaking (student, course) VALUES (9104205293, 'CEE106');
INSERT INTO IsTaking (student, course) VALUES (8912247345, 'CEE106');
INSERT INTO IsTaking (student, course) VALUES (9310304567, 'CEE106');

INSERT INTO HasTaken (student, course,grade) VALUES (9004103553, 'CEE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES (9210024536, 'CEE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES (9210024536, 'CEE102','5');
INSERT INTO HasTaken (student, course,grade) VALUES (9002243255, 'CEE101','U');
INSERT INTO HasTaken (student, course,grade) VALUES (9002243255, 'MAT101','3');
INSERT INTO HasTaken (student, course,grade) VALUES (9104205293, 'MAT105','4');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE101','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE102','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE103','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE104','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE105','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'CHE106','5');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'PHY101','4');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'MAT101','3');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'MAT102','4');
INSERT INTO HasTaken (student, course,grade) VALUES (6101011337, 'MAT103','5');


INSERT INTO WaitingFor (student, course, placeInList) VALUES (9004103553, 'CSE106', 1);
INSERT INTO WaitingFor (student, course, placeInList) VALUES (9210024536, 'CSE106', 2);
INSERT INTO WaitingFor (student, course, placeInList) VALUES (8702071334, 'CSE106', 3);

INSERT INTO WaitingFor (student, course, placeInList) VALUES (9004103553, 'CEE106', 1);
INSERT INTO WaitingFor (student, course, placeInList) VALUES (9210024536, 'CEE106', 2);
INSERT INTO WaitingFor (student, course, placeInList) VALUES (8702071334, 'CEE106', 3);

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

