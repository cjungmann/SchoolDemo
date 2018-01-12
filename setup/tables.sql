USE School;

SET default_storage_engine=InnoDB;

CREATE TABLE IF NOT EXISTS Student
(
   id    INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   stuno VARCHAR(15),
   fname VARCHAR(20),
   lname VARCHAR(30),
   cyear SMALLINT
);

CREATE TABLE IF NOT EXISTS Course
(
   id           INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   c_subject    CHAR(4),
   c_number     VARCHAR(8),
   c_title      VARCHAR(80),
   c_instructor VARCHAR(80),
   c_location   VARCHAR(10),
   INDEX(c_number)
);

CREATE TABLE IF NOT EXISTS Course2Student
(
   id_course  INT UNSIGNED NOT NULL,
   id_student INT UNSIGNED NOT NULL,
   INDEX(id_course),
   INDEX(id_student)
);

