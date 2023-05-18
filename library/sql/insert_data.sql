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
-- +++++++++++++++ --> WORKING SO FAR
INSERT INTO book (book_id, title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES (1, 'Pride and Prejudice', 'Stellar Books', 400, '1234567890', 'A classic romance novel exploring themes of societal norms, love, and prejudice in 19th-century England.', 4, 4, 'https://covers.openlibrary.org/b/id/12645114-M.jpg', 'English', 1);

INSERT INTO book (book_id, title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES (2, 'The Catcher in the Rye', 'BlueSky Publications', 320, '2345678901', 'A coming-of-age novel narrated by an angsty teenager who questions societal conventions and struggles with his own identity.', 3, 3, 'https://covers.openlibrary.org/b/id/6297651-M.jpg', 'English', 1);

INSERT INTO book (book_id, title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES (3, 'The Hobbit', 'Golden Quill Press', 350, '3456789012', 'An epic fantasy adventure following a hobbit''s journey to reclaim a stolen treasure, encountering magical creatures and dangers along the way.', 5, 5, 'https://covers.openlibrary.org/b/id/12003329-M.jpg', 'English', 1);

INSERT INTO book (book_id, title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES (4,'1984', 'Crimson Ink Publishing', 250, 9876543210, 'A dystopian novel depicting a totalitarian society where individualism is suppressed and critical thought is controlled.', 2, 2, 'https://covers.openlibrary.org/b/id/12054527-M.jpg', 'English', 1);
