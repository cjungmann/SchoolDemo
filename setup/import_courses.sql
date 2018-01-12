USE School;

SET default_storage_engine=InnoDB;

CREATE TABLE IF NOT EXISTS QT_Course
(
   id_session INT UNSIGNED,
   c_subject  CHAR(4),
   c_number   VARCHAR(8),
   c_title    VARCHAR(80),
   c_instructor VARCHAR(80),
   c_location   VARCHAR(10)
);

GRANT INSERT ON School.QT_Course TO 'webuser'@'localhost';
GRANT FILE ON *.* to 'webuser'@'localhost';

DELIMITER $$

-- -------------------------------------------------
DROP PROCEDURE IF EXISTS App_Course_Import_Review $$
CREATE PROCEDURE App_Course_Import_Review()
BEGIN
   SELECT c_subject, c_number, c_title, c_instructor, c_location
    FROM QT_Course
   WHERE id_session = @session_confirmed_id;
END $$

-- --------------------------------------------------
DROP PROCEDURE IF EXISTS App_Course_Import_Abandon $$
CREATE PROCEDURE App_Course_Import_Abandon()
BEGIN
   DELETE
     FROM QT_Course
    WHERE id_session = @session_confirmed_id;
END $$

-- -------------------------------------------------
DROP PROCEDURE IF EXISTS App_Course_Import_Accept $$
CREATE PROCEDURE App_Course_Import_Accept()
BEGIN
   INSERT INTO Course (c_subject, c_number, c_title, c_instructor, c_location)
   SELECT c_subject, c_number, c_title, c_instructor, c_location
     FROM QT_Course
    WHERE id_session = @session_confirmed_id;

   CALL App_Course_Import_Abandon();
END $$
