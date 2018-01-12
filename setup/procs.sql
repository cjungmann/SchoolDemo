USE School;

source procs_student.sql
source procs_course.sql

DELIMITER $$



-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Main_Page $$
CREATE PROCEDURE App_Main_Page()
BEGIN
   CALL App_Student_List(NULL);
   CALL App_Course_List(NULL);
END $$


DELIMITER ;
