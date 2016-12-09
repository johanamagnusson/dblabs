CREATE OR REPLACE FUNCTION insertRegistration() RETURNS
TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM LimitedCourses WHERE LimitedCourses.code = NEW.code) THEN
        (
            SELECT COUNT(student) as "countstudent"
            FROM IsTaking
            WHERE IsTaking.course = NEW.code
        ) AS numStudents
        (
            SELECT maxStudents as "max"
            FROM LimitedCourses
            WHERE LimitedCourses.code = NEW.code
        ) as limitedCourse
        IF numStudents.countstudent < limitedCourse.max THEN
            INSERT INTO IsTaking (student, course) VALUES (NEW.personnr, NEW.code);
        ELSE
            (
                SELECT MAX(placeInList) as maxplaceinlist
                FROM WaitingFor
                WHERE WaitingFor.course = NEW.code
            ) AS whereInList
            INSERT INTO WaitingFor (student, course, placeInList) VALUES
            (NEW.personnr, NEW.code, whereInList.maxplaceinlist + 1);
        END IF
    ELSE
        INSERT INTO IsTaking (student, course) VALUES (NEW.personnr, NEW.code);
    END IF

    RETURN NEW;
END
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS handle_full_course ON Registrations;
CREATE TRIGGER handle_full_course
INSTEAD OF INSERT ON Registrations
FOR EACH ROW
EXECUTE PROCEDURE insertRegistration();
