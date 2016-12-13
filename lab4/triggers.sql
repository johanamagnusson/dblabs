CREATE OR REPLACE FUNCTION insertRegistration() RETURNS
TRIGGER AS $$
DECLARE numStudents INT;
DECLARE maxNumStudents INT;
DECLARE newPlaceInList INT;
BEGIN
    IF NOT EXISTS (
        SELECT prerequisity
        FROM HasPrerequisities
        WHERE HasPrerequisities.course = NEW.code
        EXCEPT
        SELECT code
        FROM PassedCourses
        WHERE PassedCourses.personnr = NEW.personnr
        ) THEN
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
                newPlaceInList :=  MAX(placeInList)
                FROM WaitingFor
                WHERE WaitingFor.course = NEW.code;
                IF newPlaceInList IS NULL THEN
                    newPlaceInList := 1;
                ELSE
                    newPlaceInList := newPlaceInList + 1;
                END IF;
                INSERT INTO WaitingFor (student, course, placeInList) VALUES
                (NEW.personnr, NEW.code, newPlaceInList);
            END IF;
        ELSE
            INSERT INTO IsTaking (student, course) VALUES (NEW.personnr, NEW.code);
        END IF;
    ELSE
        RAISE EXCEPTION 'Missing prerequisities';
    END IF;

    RETURN NEW;
END
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS handle_full_course ON Registrations;
CREATE TRIGGER handle_full_course
INSTEAD OF INSERT ON Registrations
FOR EACH ROW
EXECUTE PROCEDURE insertRegistration();

-- ----------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION deleteRegistration() RETURNS
TRIGGER AS $$
DECLARE waitingStatus TEXT;
DECLARE newStudentPersonNr CHAR(11);
DECLARE placeInQueue INT;
DECLARE numStudents INT;
DECLARE maxNumStudents INT;

BEGIN
    IF EXISTS (SELECT 1 FROM Registrations WHERE
        Registrations.personnr = OLD.personnr) THEN
        waitingStatus := Registrations."Waiting Status"
        FROM Registrations
        WHERE Registrations.personnr = OLD.personnr AND
            Registrations.code = OLD.code;
        IF waitingStatus = 'waiting' THEN
			placeInQueue := (SELECT placeInList 
			FROM WaitingFor
			WHERE student = OLD.personnr AND course = OLD.code); 
			DELETE FROM WaitingFor WHERE student = OLD.personnr AND course = OLD.code;
			UPDATE WaitingFor SET placeInList = placeInList-1
			WHERE placeInList > placeInQueue AND course = OLD.code;
		ELSIF waitingStatus = 'registered' THEN
			DELETE FROM IsTaking WHERE student = OLD.personnr AND course = OLD.code;
			IF EXISTS (SELECT 1 FROM WaitingFor WHERE
                    WaitingFor.course = OLD.code) THEN
		        numStudents := COUNT(student)
                FROM IsTaking
                WHERE IsTaking.course = OLD.code;
                maxNumStudents := maxStudents
                FROM LimitedCourses
                WHERE LimitedCourses.code = OLD.code;
			    IF numStudents < maxNumStudents THEN
					newStudentPersonNr = student 
					FROM WaitingFor
					WHERE course = OLD.code AND placeInList = 1;
					DELETE FROM WaitingFor WHERE student = newStudentPersonNr AND course = OLD.code;
					INSERT INTO IsTaking (student, course) VALUES (newStudentPersonNr, OLD.code);
					UPDATE WaitingFor SET placeInList = placeInList-1
					WHERE placeInList > 1 AND course = OLD.code;
				END IF;
			END IF;
        END IF;
    ELSE
        RAISE EXCEPTION 'Student not registered or waiting';
    END IF;
    RETURN OLD;
END
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS handle_delete_registration ON Registrations;
CREATE TRIGGER handle_delete_registration
INSTEAD OF DELETE ON Registrations
FOR EACH ROW
EXECUTE PROCEDURE deleteRegistration();
