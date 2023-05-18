--- schools
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Lincoln Elementary', 'Chicago', 'W Madison St', 60601, 'lincoln@cps.edu', 'Gomez', 'Maria', 'Lee', 'David');
INSERT INTO school (school_id, school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname)
VALUES (2, 'Maplewood Elementary School', 'Springfield', 'Oak Avenue', 12345, 'maplewood@example.com', 'Johnson', 'Emily', 'Smith', 'Jennifer');
--- users
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname)
VALUES (1234, 'george123', 1, 'student', 'george@example.com', 'George', 'Smith');
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname)
VALUES (9876, 'emma456', 1, 'teacher', 'emma@example.com', 'Emma', 'Johnson');
--books
INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, user_id, school_id)
VALUES
  ('Book 1', 'Publisher 1', 200, 123456789, 'Summary 1', 5, 5, 'https://covers.openlibrary.org/b/id/10740111-L.jpg', 'English', 1, 1),
  ('Book 2', 'Publisher 2', 150, 987654321, 'Summary 2', 3, 3, 'https://covers.openlibrary.org/b/id/10740111-L.jpg', 'English', 1, 1),
  ('Book 3', 'Publisher 3', 180, 246813579, 'Summary 3', 2, 2, 'https://covers.openlibrary.org/b/id/10740111-L.jpg', 'English', 1, 1),
  ('Book 4', 'Publisher 4', 220, 135792468, 'Summary 4', 7, 7, 'https://covers.openlibrary.org/b/id/10740111-L.jpg', 'English', 1, 1),
  ('Book 5', 'Publisher 5', 300, 987123456, 'Summary 5', 4, 4, 'https://covers.openlibrary.org/b/id/10740111-L.jpg', 'English', 1, 1);

--reviews

