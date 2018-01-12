USE School;

-- App_Student_List   (for App_Main_Page)
-- App_Student_Add
-- App_Student_Read
-- App_Student_Update
-- App_Student_Delete

DELIMITER $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Student_List $$
CREATE PROCEDURE App_Student_List(student_id INT UNSIGNED)
BEGIN
   SELECT id, stuno, fname, lname, cyear
     FROM Student
    WHERE student_id IS NULL OR id = student_id;
END $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Add $$
CREATE PROCEDURE App_Student_Add(stuno VARCHAR(15),
                                 fname VARCHAR(20),
                                 lname VARCHAR(30),
                                 cyear SMALLINT)
BEGIN
   DECLARE newid INT UNSIGNED;

   INSERT INTO Student (stuno, fname, lname, cyear)
     VALUES(stuno, fname, lname, cyear);

   IF ROW_COUNT()>0 THEN
      SET newid = LAST_INSERT_ID();
      CALL App_Student_List(newid);
   END IF;
END $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Read $$
CREATE PROCEDURE App_Student_Read(student_id INT UNSIGNED)
BEGIN
   SELECT stuno, fname, lname, cyear
     FROM Student
    WHERE id = student_id;
END $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Update $$
CREATE PROCEDURE App_Student_Update(student_id INT UNSIGNED,
                                    stuno VARCHAR(15),
                                    fname VARCHAR(20),
                                    lname VARCHAR(30),
                                    cyear SMALLINT)
BEGIN
   UPDATE Student s
      SET s.stuno = stuno,
          s.fname = fname,
          s.lname = lname,
          s.cyear = cyear
    WHERE s.id = student_id;

   IF ROW_COUNT() > 0 THEN
      CALL App_Student_List(student_id);
   END IF;
END $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Student_Delete $$
CREATE PROCEDURE App_Student_Delete(student_id INT UNSIGNED)
BEGIN
   DELETE FROM Student
    WHERE id = student_id;

   -- Remove student from groups, specifically Course2Student table

   -- Confirm deletion
   -- send updates indication deletions
END $$

DELIMITER ;
