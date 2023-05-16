
--- schools
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Lincoln Elementary', 'Chicago', 'W Madison St', 60601, 'lincoln@cps.edu', 'Gomez', 'Maria', 'Lee', 'David');
INSERT INTO school (school_id, school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname)
VALUES (2, 'Maplewood Elementary School', 'Springfield', 'Oak Avenue', 12345, 'maplewood@example.com', 'Johnson', 'Emily', 'Smith', 'Jennifer');
--- users
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname)
VALUES (1234, 'george123', 1, 'student', 'george@example.com', 'George', 'Smith');
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname)
VALUES (9876, 'emma456', 1, 'teacher', 'emma@example.com', 'Emma', 'Johnson');
