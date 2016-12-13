
-- Tests for trigger handle_course_full --

SELECT * FROM Registrations
WHERE code = 'MAT102';

INSERT INTO Registrations (code, personnr) VALUES ('MAT102', '900410-3553');
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', '921002-4536');
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', '870207-1334');

SELECT * FROM Registrations
WHERE code = 'MAT102';

-- Tests for trigger handle_delete_registration --
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', '740410-7785');
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = '921002-4536';

SELECT * FROM Registrations
WHERE code = 'MAT102';

INSERT INTO IsTaking (student, course) VALUES ('440410-3553', 'MAT102'); -- Force add to full course
INSERT INTO Registrations (code, personnr) VALUES ('MAT102', '921002-4536');
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = '900410-3553';
DELETE FROM Registrations WHERE code = 'MAT102' AND personnr = '440410-3553';

SELECT * FROM Registrations
WHERE code = 'MAT102';

