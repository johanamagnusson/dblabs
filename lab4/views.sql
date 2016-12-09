DROP VIEW IF EXISTS CourseQueuePositions;
CREATE OR REPLACE VIEW CourseQueuePositions AS
SELECT course as "Course code",
personNr AS "Student person nr.",
studentName AS "Student name",
placeinlist AS "Place in queue"
FROM Students
JOIN WaitingFor
ON Students.personNr = WaitingFor.student
;
