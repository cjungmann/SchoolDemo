USE School;

-- App_Course_List   (for App_Main_Page)
-- App_Course_Add
-- App_Course_Read
-- App_Course_Update
-- App_Course_Delete

DELIMITER $$

CREATE PROCEDURE App_Course_List(course_id INT UNSIGNED)
BEGIN
   SELECT id, c_subject, c_number, c_title, c_instructor, c_location
     FROM Course
    WHERE course_id IS NULL OR id = course_id;
END $$

CREATE PROCEDURE App_Course_Add(subject    CHAR(4),
                                number     VARCHAR(8),
                                title      VARCHAR(80),
                                instructor VARCHAR(80),
                                location   VARCHAR(10))
BEGIN
   DECLARE newid INT UNSIGNED;
   INSERT INTO Course (c_subject, c_number, c_title, c_instructor, c_location)
    VALUES (subject, number, title, instructor, location);

   IF ROW_COUNT() > 0 THEN
      SET newid = LAST_INSERT_ID();
      CALL App_Course_List(newid);
   END IF;
END $$


CREATE PROCEDURE App_Course_Read(course_id INT UNSIGNED)
BEGIN
   SELECT id, c_subject, c_number, c_title, c_instructor, c_location
     FROM Course
    WHERE id = course_id;
END $$


CREATE PROCEDURE App_Course_Update(course_id INT UNSIGNED,
                                   subject    CHAR(4),
                                   number     VARCHAR(8),
                                   title      VARCHAR(80),
                                   instructor VARCHAR(80),
                                   location   VARCHAR(10))
BEGIN
   UPDATE Course c
      SET c_subject = subject,
          c_number = number,
          c_title = title,
          c_instructor = instructor,
          c_location = location
    WHERE id = course_id;

   IF ROW_COUNT() > 0 THEN
      CALL App_Course_List(course_id);
   END IF;
END $$

CREATE PROCEDURE App_Course_Delete(course_id INT UNSIGNED, number VARCHAR(8))
BEGIN
   DELETE FROM Course
    WHERE id = course_id AND c_number = number;


   -- Remove course from groups, specifically Course2Student table

   -- Confirm deletion
   -- send updates indication deletions

END $$

DELIMITER ;
