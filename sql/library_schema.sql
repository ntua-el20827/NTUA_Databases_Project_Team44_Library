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
  PRIMARY KEY  (school_id),
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table 'school_phone'
CREATE TABLE school_phone(
  phone INT NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (phone,school_id)
  KEY idx_fk_school_id
  CONSTRAINT 'idx_fk_school_id' FOREIGN KEY(school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'lib_user'
CREATE TABLE lib_user(
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_pwd INT UNSIGNED NOT NULL,
    user_name VARCHAR(45) NOT NULL,
    school_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id),
    KEY idx_fk_school_id
    CONSTRAINT 'idx_fk_school_id' FOREIGN KEY(school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table 'book'
CREATE TABLE book (
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(45) NOT NULL,
  publisher VARCHAR(45) NOT NULL,
  pages INT UNSIGNED NOT NULL
  ISBN INT UNSIGNED NOT NULL,
  summary VARCHAR(1000),
  no_books INT UNSIGNED NOT NULL, 	
  image // ??
  language VARCHAR(45)
  user_id INT UNSIGNED NOT NULL (FK),
  school_id INT UNSIGNED NOT NULL (FK)
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id)
  KEY idx_fk_user_id
  CONTSTRAINT 'fk_user_id' FOREIGN KEY(user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
  KEY idx_fk_school_id
  CONTSTRAINT 'fk_school_id' FOREIGN KEY(school_id) REFERENCES school (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'reservation'
CREATE TABLE reservation (
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  res_date DATE NOT NULL,
  res_id INT NOT NULL,
  PRIMARY KEY (res_id),
  KEY idx_fk_user_id
  CONTSTRAINT 'fk_user_id' FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY idx_fk_school_id
  CONTSTRAINT 'fk_school_id' FOREIGN KEY(school_id) REFERENCES school (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table 'role'
CREATE TABLE role (
  user_id INT NOT NULL,
  role_id INT NOT NULL AUTO_INCREMENT,
  role_name ENUM('student', 'teacher', 'admin', 'super_admin') NOT NULL,
  PRIMARY KEY (role_id),
  KEY idx_fk_user_id
  CONTSTRAINT 'fk_user_id' FOREIGN KEY (user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table 'book_keyworrds'
CREATE TABLE book_keyworrds (
  keywords  VARCHAR(100) NOT NULL,
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (keywords)
  KEY idx_fk_book_id
  CONTSTRAINT 'fk_book_id' FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;	

-- Table 'book_theme'
CREATE TABLE book_theme (
  theme  VARCHAR(30) NOT NULL,
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (theme)
  KEY idx_fk_book_id
  CONTSTRAINT 'fk_book_id' FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table 'book_author'
CREATE TABLE book_author (
	author  VARCHAR(100) NOT NULL,
	book_id INT UNSIGNED NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (theme)
        KEY idx_fk_book_id
	CONTSTRAINT '' FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table 'review'
CREATE TABLE review(
    user_id INT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    rev_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    rev_date INT UNSIGNED NOT NULL,
    rating ENUM('1','2','3','4','5') NOT NULL, 
    PRIMARY KEY (user_id, book_id)
    KEY idx_fk_user_id
    CONSTRAINT 'idx_fk_user_id' FOREIGN KEY(user_id) REFERENCES lib_user (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
    KEY idx_fk_book_id
    CONSTRAINT 'idx_fk_book_id' FOREIGN KEY(book_id) REFERENCES book (book_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--- notes: Πως βιβλια με ιδιο όνομα αλλά διαφορετικό id θα έχουν ιδια αξιολόγηση?


---
--- VIEWS
---

---
--- TRIGEGRS
---

---
--- PROCUDERS
---




