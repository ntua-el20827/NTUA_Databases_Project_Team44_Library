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
  book_language VARCHAR(45),
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

-- Table 'reservation'
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
--- Ειναι σωστο το primary key?

-- Table 'role'
CREATE TABLE role (
  role_id INT NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  role_name ENUM('student', 'teacher', 'admin', 'super_admin') NOT NULL,
  PRIMARY KEY (role_id,user_id),
  KEY fk_role_user_id (user_id),
  CONSTRAINT fk_role_user_id FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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


---
--- Triggers
---