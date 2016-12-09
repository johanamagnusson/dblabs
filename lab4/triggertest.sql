
-- Tests for trigger handle_course_full --

SELECT * FROM Registrations
WHERE code = 'MAT102';

INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 9004103553);
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 9210024536);
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 8702071334);

SELECT * FROM Registrations
WHERE code = 'MAT102';

