USE School;

SET default_storage_engine=InnoDB;

CREATE TABLE IF NOT EXISTS QT_Student
(
   id_session INT UNSIGNED,
   fname VARCHAR(20),
   lname VARCHAR(30),
   cyear SMALLINT
);

GRANT INSERT ON School.QT_Student TO 'webuser'@'localhost';
GRANT FILE ON *.* to 'webuser'@'localhost';

DELIMITER $$

-- --------------------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Import_Review $$
CREATE PROCEDURE App_Student_Import_Review()
BEGIN
   SELECT fname, lname, cyear
    FROM QT_Student
   WHERE id_session = @session_confirmed_id;
END $$

-- --------------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Import_Abandon $$
CREATE PROCEDURE App_Student_Import_Abandon()
BEGIN
   DELETE
     FROM QT_Student
    WHERE id_session = @session_confirmed_id;
END $$

-- -------------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Import_Accept $$
CREATE PROCEDURE App_Student_Import_Accept()
BEGIN
   INSERT INTO Student(stuno, fname, lname, cyear)
   SELECT LAST_INSERT_ID(), fname, lname, cyear
     FROM QT_Student
    WHERE id_session = @session_confirmed_id;

   CALL App_Student_Import_Abandon();
END $$

DELIMITER ;
