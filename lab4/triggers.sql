CREATE OR REPLACE FUNCTION insertRegistration() RETURNS
TRIGGER AS $$
DECLARE numStudents INT;
DECLARE maxNumStudents INT;
DECLARE newPlaceInList INT;
BEGIN
    IF EXISTS (SELECT 1 FROM LimitedCourses WHERE
                LimitedCourses.code = NEW.code) THEN
        numStudents := COUNT(student)
        FROM IsTaking
        WHERE IsTaking.course = NEW.code;
        maxNumStudents := maxStudents
        FROM LimitedCourses
        WHERE LimitedCourses.code = NEW.code;
        IF numStudents < maxNumStudents THEN
            INSERT INTO IsTaking (student, course) VALUES (NEW.personnr, NEW.code);
        ELSE
            newPlaceInList :=  MAX(placeInList) + 1
            FROM WaitingFor
            WHERE WaitingFor.course = NEW.code;
            INSERT INTO WaitingFor (student, course, placeInList) VALUES
            (NEW.personnr, NEW.code, newPlaceInList);
        END IF;
    ELSE
        INSERT INTO IsTaking (student, course) VALUES (NEW.personnr, NEW.code);
    END IF;

    RETURN NEW;
END
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS handle_full_course ON Registrations;
CREATE TRIGGER handle_full_course
INSTEAD OF INSERT ON Registrations
FOR EACH ROW
EXECUTE PROCEDURE insertRegistration();
