DROP VIEW IF EXISTS CourseQueuePositions;
CREATE OR REPLACE VIEW CourseQueuePositions AS
SELECT course as "Course code", student AS "Student", placeinlist AS
"Place in queue" FROM WaitingFor;
