
-- Tests for trigger handle_course_full --

SELECT * FROM Registrations
WHERE code = 'MAT102';

INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 9004103553);
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 9210024536);
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 8702071334);

SELECT * FROM Registrations
WHERE code = 'MAT102';

-- Tests for trigger handle_delete_registration --
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 7404107785);
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = 9210024536;

SELECT * FROM Registrations
WHERE code = 'MAT102';

INSERT INTO IsTaking (student, course) VALUES (4404103553, 'MAT102'); -- Force add to full course
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', 9210024536);
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = 9004103553;
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = 4404103553;

SELECT * FROM Registrations
WHERE code = 'MAT102';

