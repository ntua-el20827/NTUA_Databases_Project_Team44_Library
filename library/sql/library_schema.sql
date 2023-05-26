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
  pending_flag ENUM('pending'),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CHECK(postal_code > 9999 and postal_code < 100000),
  PRIMARY KEY  (school_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--- Table 'school_phone'
CREATE TABLE school_phone(
  phone BIGINT NOT NULL,
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
    user_email VARCHAR(45) NOT NULL,
    user_firstname VARCHAR(45) NOT NULL, 
    user_lastname VARCHAR(45) NOT NULL,
    user_date_of_birth DATE NOT NULL, 
    user_pending_flag ENUM('waiting'),
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
  ISBN BIGINT UNSIGNED NOT NULL,
  summary VARCHAR(400),
  number_of_books INT UNSIGNED NOT NULL, 	
  number_of_available_books INT UNSIGNED NOT NULL,
  book_image VARCHAR(256) NOT NULL, 
  book_language VARCHAR(45),
  borrow_count INT NOT NULL DEFAULT 0,
  school_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id),
  KEY fk_book_school_id (school_id),
  CONSTRAINT fk_book_school_id FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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


CREATE TABLE book_status (
  book_status_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  status ENUM('borrowed','reserved') NOT NULL,
  request_date DATE,
  approval_date DATE,
  return_date DATE,
  PRIMARY KEY (book_status_id),
  KEY fk_book_status_book_id (book_id),
  KEY fk_book_status_user_id (user_id),
  CONSTRAINT fk_book_status_book_id FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_status_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Table 'book_keywords'
CREATE TABLE book_keywords (
  keywords  VARCHAR(100) NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (keywords,book_id),
  KEY fk_book_keywords_book_id (book_id),
  CONSTRAINT fk_book_keywords_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'book_theme'
CREATE TABLE book_theme (
  theme ENUM('Fiction', 'Non-fiction','Dystopia','Gothic','Tragedy','Science Fiction', 'Science','Drama', 'Adventure','Mystery', 'Romance','War', 'Classic','Thriller', 'Horror', 'Fantasy', 'Biography', 'Autobiography', 'History', 'Poetry', 'Comics', 'Cookbooks', 'Travel', 'Religion', 'Self-help', 'Art', 'Music','Coming of Age', 'Sports', 'Humor', 'Children','Reference') NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (theme, book_id),
  KEY fk_book_theme_book_id (book_id),
  CONSTRAINT fk_book_theme_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'book_author'
CREATE TABLE book_author (
	author  VARCHAR(100) NOT NULL,
	book_id INT UNSIGNED NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (author,book_id),
  KEY fk_book_author_book_id (book_id),
	CONSTRAINT fk_book_author_book_id FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'review'
CREATE TABLE review (
  rev_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  review_text VARCHAR(400),
  rev_date DATE NULL,
  rating ENUM('1', '2', '3', '4', '5') NOT NULL, 
  review_pending_flag ENUM('pending'),
  PRIMARY KEY (rev_id,user_id,book_id),
  KEY fk_review_user_id (user_id),
  CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT,
  KEY fk_review_book_id (book_id),
  CONSTRAINT fk_review_book_id FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--- Ειναι σωστο το primary key?

/*
---
--- Events (?)
---

---Every day the db needs to check whether a reservation deadline has expired
CREATE EVENT delete_old_reservations
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    -- Delete old reservations
    DELETE FROM book_status
    WHERE status = 'reserved'
    AND request_date < DATE_SUB(NOW(), INTERVAL 1 WEEK);
END;
*/

---
--- Views
---

---All schools with their names
CREATE VIEW all_schools AS
SELECT school_id, school_name
FROM school;

CREATE VIEW library_applications AS
SELECT s.school_name, s.city, s.street, s.postal_code, s.email, s.principal_lastname, s.principal_firstname, s.school_admin_lastname, s.school_admin_firstname, sp.phone, lu.user_pwd, lu.user_name, lu.user_email, lu.user_firstname, lu.user_lastname, lu.user_date_of_birth, lu.user_pending_flag
FROM school s
JOIN school_phone sp ON s.school_id = sp.school_id
JOIN lib_user lu ON s.school_id = lu.school_id
WHERE s.pending_flag = 'pending' AND lu.user_pending_flag = 'waiting' AND lu.role_name = 'admin';

---only include reviews submitted by users with the student role,
---and with a NULL rev_date indicating that they require approval
/* CREATE VIEW review_approval AS 
SELECT *
FROM review r
JOIN lib_user u ON r.user_id = u.user_id
WHERE u.role_name = 'student' AND r.rev_date IS NULL ;

CREATE VIEW reservation_queue AS
SELECT lu.user_id, lu.user_firstname, lu.user_lastname, b.book_id, b.book_name, bs.request_date
FROM lib_user lu
JOIN book_status bs ON lu.user_id = bs.user_id
JOIN book b ON bs.book_id = b.book_id
WHERE bs.number_of_available_books = 0 AND bs.
ORDER BY b.book_id, bs.request_date; */

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --> WORKING SO FAR
/* ---All the books with image, title, name, review
CREATE VIEW all_books_with_info AS
SELECT b.book_image, b.title, CONCAT(u.user_firstname, ' ', u.user_lastname) AS name, r.review_text AS review
FROM book b
INNER JOIN lib_user u ON b.user_id = u.user_id
LEFT JOIN review r ON b.book_id = r.book_id;

---List of user applications
CREATE VIEW new_user_application AS
SELECT *
FROM lib_user
WHERE user_pending_flag = 'waiting';


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
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can be only one superadmin in the lib_user table'
        END IF
    END IF
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
END;

---When a reserved book becomes available
CREATE TRIGGER update_book_status AFTER UPDATE ON book_status
FOR EACH ROW
BEGIN
    IF NEW.number_of_available_books = 1 AND OLD.number_of_available_books = 0 THEN
        -- Delete row from reservation_queue
        DELETE FROM reservation_queue
        WHERE user_id = OLD.user_id
        AND book_id = OLD.book_id
        AND request_date = OLD.request_date;

        -- Insert new row into book_status with status set to reserved
        INSERT INTO book_status (user_id, book_id, request_date, status)
        VALUES (OLD.user_id, OLD.book_id, OLD.request_date, 'reserved');
    END IF;
END;

---Delete from book_status=> Delete from reservation_queue
CREATE TRIGGER trg_delete_reservation_queue
AFTER DELETE ON book_status
FOR EACH ROW
BEGIN
    DELETE FROM reservation_queue
    WHERE user_id = OLD.user_id
    AND book_id = OLD.book_id
    AND request_date = OLD.request_date;
END;
*/

---
---Indexes
---
/*
CREATE INDEX idx_book_status_status ON book_status (status);
CREATE INDEX idx_book_theme_theme ON book_theme (theme);
CREATE INDEX idx_book_author_author ON book_author (author);
CREATE INDEX idx_book_status_user_id ON book_status (user_id);
CREATE INDEX idx_book_status_approval_date ON book_status (approval_date);
CREATE INDEX idx_lib_user_name ON lib_user (user_firstname, user_lastname);
CREATE INDEX idx_book_title ON book (title);
*/

---
--- Functions
---
DELIMITER //

CREATE PROCEDURE decrease_available_books(IN _book_id INT)
BEGIN
    UPDATE book
    SET number_of_available_books = number_of_available_books - 1
    WHERE book_id = book_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE increase_available_books(IN _book_id INT)
BEGIN
    UPDATE book
    SET number_of_available_books = number_of_available_books + 1
    WHERE book_id = book_id;
END //

DELIMITER ;