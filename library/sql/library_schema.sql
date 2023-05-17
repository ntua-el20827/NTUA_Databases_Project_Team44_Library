DROP SCHEMA IF EXISTS library;
CREATE SCHEMA library;
USE library;


---
--- Tables
---

--- Table 'school'
CREATE TABLE school (
  school_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  school_name VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  street VARCHAR(45) NOT NULL,
  postal_code INT UNSIGNED NOT NULL,
  email VARCHAR(45) NOT NULL,
  principal_lastname VARCHAR(45) NOT NULL,
  principal_firstname VARCHAR(45) NOT NULL,
  school_admin_lastname VARCHAR(45) NOT NULL,
  school_admin_firstname VARCHAR(45) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CHECK(postal_code > 9999 and postal_code < 100000),
  PRIMARY KEY  (school_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--- Table 'school_phone'
CREATE TABLE school_phone(
  phone INT NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (phone,school_id),
  KEY fk_school_id (school_id), -- πιθανόν να μην χρειαζεται
  CONSTRAINT fk_school_id FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'lib_user'
CREATE TABLE lib_user(
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_pwd INT UNSIGNED NOT NULL,
    user_name VARCHAR(45) NOT NULL,
    school_id INT UNSIGNED NOT NULL,
    role_name ENUM('student', 'teacher', 'admin', 'super_admin') NOT NULL,
    user_email VARCHAR(45) NOT NULL, -- new ->george
    user_firstname VARCHAR(45) NOT NULL, -- new ->george
    user_lastname VARCHAR(45) NOT NULL, -- new ->george
    user_date_of_birth BIGINT UNSIGNED NOT NULL, ---new ->baba BIGINT so that it can store Unix timestamps, which are 64-bit integers
    -- user_date_of_birth -- new ->george // δεν εχει συμπληρωθεί πλήρωνς
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id),
    KEY fk_user_school_id (school_id),
    CONSTRAINT fk_user_school_id FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 
-- ισως: ON DELETE CASCADE 

-- Table 'book'
CREATE TABLE book (
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(45) NOT NULL,
  publisher VARCHAR(45) NOT NULL,
  pages INT UNSIGNED NOT NULL,
  ISBN INT UNSIGNED NOT NULL,
  summary VARCHAR(45),
  number_of_books INT UNSIGNED NOT NULL, 	
  number_of_available_books INT UNSIGNED NOT NULL,
  book_image VARCHAR(256) NOT NULL, 
  book_language VARCHAR(45),
  borrow_count INT NOT NULL DEFAULT 0, --- new->baba
  user_id INT UNSIGNED NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id),
  KEY fk_book_user_id (user_id),
  KEY fk_book_school_id (school_id),
  CONSTRAINT fk_book_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_school_id FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--- ΛΕΙΠΕΙ Η ΕΙΚΟΝΑ / ΤΟ SUMMARY ΙΣΩΣ ΝΑ ΘΕΛΕΙ ΜΕΓΑΛΥΤΕΡΟ ΜΕΓΕΘΟΣ

/*-- Table 'reservation'
CREATE TABLE reservation (
  book_id INT UNSIGNED NOT NULL,
  res_date DATE NOT NULL,
  res_id INT NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (res_id,user_id,book_id),
  KEY fk_reserv_user_id (user_id),
  CONSTRAINT fk_reserv_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY fk_reserv_school_id (school_id),
  CONSTRAINT fk_reserv_school_id FOREIGN KEY(school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--- Ειναι σωστο το primary key?*/

--- > george
-- Χρειάζεται επειγόντως το table με τους δανεισμούς (many to many) ωστε να κάνουμε store ολους
-- τους δανεισμούς. Το table reservation ισως να μην χρειάζετια και να μπορούμε να το κάνουμε με το view!

--- new -> baba suggestion for reservation/borrowing
CREATE TABLE book_status (
  book_status_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  status ENUM('borrowed', 'reserved') NOT NULL,
  request_date DATE NOT NULL,
  approval_date DATE,
  return_date DATE,
  PRIMARY KEY (book_status_id),
  KEY fk_book_status_book_id (book_id),
  KEY fk_book_status_user_id (user_id),
  KEY fk_book_status_school_id (school_id),
  CONSTRAINT fk_book_status_book_id FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_status_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_status_school_id FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Table 'book_keywords'
CREATE TABLE book_keywords (
  keywords  VARCHAR(100) NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (keywords),
  KEY fk_book_keywords_book_id (book_id),
  CONSTRAINT fk_book_keywords_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'book_theme'
CREATE TABLE book_theme (
  theme VARCHAR(30) NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (theme),
  KEY fk_book_theme_book_id (book_id),
  CONSTRAINT fk_book_theme_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'book_author'
CREATE TABLE book_author (
	author  VARCHAR(100) NOT NULL,
	book_id INT UNSIGNED NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (author),
  KEY fk_book_author_book_id (book_id),
	CONSTRAINT fk_book_author_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'review'
CREATE TABLE review (
  rev_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  rev_date INT UNSIGNED NOT NULL,
  rating ENUM('1', '2', '3', '4', '5') NOT NULL, 
  PRIMARY KEY (rev_id,user_id,book_id),
  KEY fk_review_user_id (user_id),
  CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY fk_review_book_id (book_id),
  CONSTRAINT fk_review_book_id FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--- Ειναι σωστο το primary key?

---
--- Views
---

/*---All schools with their names
CREATE VIEW all_schools AS
SELECT school_id, school_name
FROM school;

---All the books with image, title, name, review
CREATE VIEW all_books_with_info AS
SELECT b.book_image, b.title, CONCAT(u.user_firstname, ' ', u.user_lastname) AS name, r.review_text AS review
FROM book b
INNER JOIN lib_user u ON b.user_id = u.user_id
LEFT JOIN review r ON b.book_id = r.book_id;
*/



---
--- Triggers
---

/* ---Ensure that our db has only one superadmin
CREATE TRIGGER trg_lib_user_super_admin
BEFORE INSERT OR UPDATE ON lib_user
FOR EACH ROW
BEGIN
    IF NEW.role_name = 'super_admin' OR IF OLD.role_name = 'super_admin' THEN
        IF (SELECT COUNT(*) FROM lib_user WHERE role_name = 'super_admin') > 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can be only one superadmin in the lib_user table';
        END IF;
    END IF;
END;

---Ensure that the insertion of second admin for a school is forbidden
CREATE TRIGGER trg_lib_user_admin_count
BEFORE INSERT OR UPDATE ON lib_user
FOR EACH ROW
BEGIN
    IF NEW.role_name = 'admin' OR OLD.role_name = 'admin' THEN
        IF (SELECT COUNT(*) FROM lib_user WHERE role_name = 'admin' AND school_id = NEW.school_id) > 1 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Each school can have only one admin in the lib_user table';
        END IF;
    END IF;
END; 

--- Each user can only submit one review per book title
CREATE TRIGGER trg_review_unique_title
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
  DECLARE cnt INT;
  SELECT COUNT(*) INTO cnt FROM review WHERE user_id = NEW.user_id AND book_title = NEW.book_title;
  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Each user can only submit one review per book title';
  END IF;
END;*/