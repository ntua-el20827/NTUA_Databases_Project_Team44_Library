--- shcools
INSERT INTO school (school_id, school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname)
VALUES
  (1, 'Maplewood Elementary School', 'Springfield', 'Oak Avenue', 12345, 'maplewood@gmail.com', 'Johnson', 'Emily', 'Smith', 'Jennifer'),
  (2, 'Willowbrook High School', 'Harrisonburg', 'Willow Street', 54321, 'willowbrook@gmail.com', 'Anderson', 'Michael', 'Brown', 'Jessica'),
  (3, 'Cedar Ridge Middle School', 'Wilmington', 'Cedar Lane', 67890, 'cedarridge@gmail.com', 'Davis', 'Sarah', 'Wilson', 'David'),
  (4, 'Hawthorne Academy', 'Birmingham', 'Maple Street', 98765, 'hawthorne@gmail.com', 'Thompson', 'Robert', 'Miller', 'Amy'),
  (5, 'Pinecrest Elementary School', 'Denver', 'Pine Avenue', 54321, 'pinecrest@gmail.com', 'Taylor', 'Jessica', 'Jackson', 'Matthew');

---- phones
INSERT INTO school_phone (phone, school_id) VALUES
  (3572212345, 1),
  (3572298765, 1);
INSERT INTO school_phone (phone, school_id) VALUES
  (3572245678, 2);
INSERT INTO school_phone (phone, school_id) VALUES
  (3572278912, 3),
  (3572232165, 3);
INSERT INTO school_phone (phone, school_id) VALUES
  (3572265498, 4);
INSERT INTO school_phone (phone, school_id) VALUES
  (3572298732, 5),
  (3572214725, 5);

--- superadmin
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES (1111, 'manosneo', 1, 'super_admin', 'manosaekara@gmail.com', 'manos', 'aek', '1924-01-01');

--- ΠΡΟΒΛΗΜΑ ΜΕ ΤΟΝ SUPERADMIN -> ΣΕ ΠΟΙΟ ΣΧΟΛΕΙΟ ΑΝΗΚΕΙ??? / ΑΝ ΔΙΑΓΡΑΦΕΙ ΤΟ ΣΧΟΛΕΊΟ ΤΙ ΓΙΝΕΤΑΙ?

--- admins for every shcool
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES (1234, 'george123', 1, 'admin', 'georgesmith@gmail.com', 'George', 'Smith', '1985-07-10'),
       (5678, 'emily456', 2, 'admin', 'emilyjones@gmail.com', 'Emily', 'Jones', '1982-11-18'),
       (9876, 'jason789', 3, 'admin', 'jasonbrown@gmail.com', 'Jason', 'Brown', '1988-03-25'),
       (5432, 'sarah321', 4, 'admin', 'sarahdavis@gmail.com', 'Sarah', 'Davis', '1979-09-05'),
       (7890, 'michael654', 5, 'admin', 'michaelwilson@gmail.com', 'Michael', 'Wilson', '1987-12-01');
--- teachers
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES
  (9876, 'emily456', 2, 'teacher', 'emilyjones@gmail.com', 'Emily', 'Jones', '1999-03-15'),
  (5432, 'john789', 3, 'teacher', 'johnmiller@gmail.com', 'John', 'Miller', '1978-12-05'),
  (7890, 'sarah101', 4, 'teacher', 'sarahbrown@gmail.com', 'Sarah', 'Brown', '2002-06-20'),
  (2109, 'alex222', 5, 'teacher', 'alexanderthomas@gmail.com', 'Alexander', 'Thomas', '2004-01-08'),
  (6543, 'linda333', 1, 'teacher', 'lindawilson@gmail.com', 'Linda', 'Wilson', '1990-09-25');
--students
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES
  (9876, 'emily456', 2, 'student', 'emilyjones@gmail.com', 'Emily', 'Jones', '2003-03-15'),
  (2345, 'john789', 2, 'student', 'johnsmith@gmail.com', 'John', 'Smith', '2003-09-12'),
  (5432, 'sarah101', 2, 'student', 'sarahbrown@gmail.com', 'Sarah', 'Brown', '2001-05-28'),
  (8765, 'michael222', 1, 'student', 'michaelthomas@gmail.com', 'Michael', 'Thomas', '2003-11-02'),
  (3456, 'linda333', 1, 'student', 'lindawilson@gmail.com', 'Linda', 'Wilson', '1993-07-20'),
  (6543, 'james101', 1, 'student', 'jamesmiller@gmail.com', 'James', 'Miller', '2004-02-14'),
  (4321, 'emma567', 3, 'student', 'emmalopez@gmail.com', 'Emma', 'Lopez', '2003-06-30'),
  (7890, 'oliver222', 3, 'student', 'oliverrobinson@gmail.com', 'Oliver', 'Robinson', '2000-09-10'),
  (2109, 'ava333', 3, 'student', 'avasmith@gmail.com', 'Ava', 'Smith', '2003-03-08'),
  (5678, 'william456', 4, 'student', 'williamjones@gmail.com', 'William', 'Jones', '2002-08-18'),
  (9012, 'mia101', 4, 'student', 'miamiller@gmail.com', 'Mia', 'Miller', '2002-12-25'),
  (3210, 'noah789', 4, 'student', 'noahbrown@gmail.com', 'Noah', 'Brown', '2005-04-05'),
  (7890, 'olivia567', 5, 'student', 'oliviarobinson@gmail.com', 'Olivia', 'Robinson', '2002-10-22'),
  (2109, 'jackson222', 5, 'student', 'jacksonwilson@gmail.com', 'Jackson', 'Wilson', '2002-11-16'),
  (6543, 'sophia333', 5, 'student', 'sophiajackson@gmail.com', 'Sophia', 'Jackson', '2004-07-09');

-- +++++++++++++++ --> WORKING SO FAR

