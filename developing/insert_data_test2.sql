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

--- books for school 1 -> 20 so far
INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Pride and Prejudice','Stellar Books', 400, 1234567890, 'A classic romance novel exploring themes of societal norms, love, and prejudice in 19th-century England.', 4, 4, 'https://covers.openlibrary.org/b/id/12645114-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Catcher in the Rye', 'BlueSky Publications', 320, 2345678901, 'A coming-of-age novel narrated by an angsty teenager who questions societal conventions and struggles with his own identity.', 3, 3, 'https://covers.openlibrary.org/b/id/6297651-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Hobbit', 'Golden Quill Press', 350, 3456789012, 'An epic fantasy adventure following a hobbit''s journey to reclaim a stolen treasure, encountering magical creatures and dangers along the way.', 5, 5, 'https://covers.openlibrary.org/b/id/12003329-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('1984', 'Crimson Ink Publishing', 250, 9876543210, 'A dystopian novel depicting a totalitarian society where individualism is suppressed and critical thought is controlled.', 2, 2, 'https://covers.openlibrary.org/b/id/12054527-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Alchemist', 'HarperOne', 208, 9780062315007, 'A philosophical novel about a young Andalusian shepherd who embarks on a journey to find his personal legend.', 1, 1, 'https://covers.openlibrary.org/b/id/8314135-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Great Expectations', 'Penguin Classics', 544, 9780141439563, 'A coming-of-age novel following the life of Pip, an orphan, as he navigates his way through the social classes of Victorian England.', 1, 1, 'https://covers.openlibrary.org/b/id/13029793-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('To the Lighthouse', 'Harvest Books', 209, 9780156907392, 'A modernist novel that explores the lives and relationships of the Ramsay family and their guests on a trip to the Isle of Skye.', 1, 1, 'https://covers.openlibrary.org/b/id/8291454-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Moby-Dick', 'Harper Perennial', 896, 9780062085661, 'An epic tale of Captain Ahab''s obsessive quest for revenge against the great white whale.', 1, 1, 'https://covers.openlibrary.org/b/id/110556-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Picture of Dorian Gray', 'Penguin Classics', 254, 9780141439570, 'A Gothic novel about a young man named Dorian Gray, who remains eternally youthful while a portrait of him ages and bears the scars of his immoral actions.', 1, 1, 'https://covers.openlibrary.org/b/id/14314591-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Frankenstein', 'Penguin Classics', 352, 9780141439471, 'A science fiction novel exploring the ethical implications of creating artificial life, as Victor Frankenstein brings a creature to life with disastrous consequences.', 1, 1, 'https://covers.openlibrary.org/b/id/109033-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('A Game of Thrones', 'Bantam Books', 694, 9780553593716, 'The first book in the epic fantasy series ''A Song of Ice and Fire'' that follows the power struggles among noble families in the Seven Kingdoms.', 1, 1, 'https://covers.openlibrary.org/b/id/9269942-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Fault in Our Stars', 'Dutton Books', 313, 9780525478812, 'A young adult novel about two teenagers, Hazel and Gus, who meet and fall in love while dealing with the challenges of living with cancer.', 1, 1, 'https://covers.openlibrary.org/b/id/7890579-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Gone Girl', 'Crown Publishing Group', 432, 9780307588364, 'A psychological thriller about a husband, Nick, and his wife, Amy, whose marriage takes a dark turn when Amy goes missing under suspicious circumstances.', 1, 1, 'https://covers.openlibrary.org/b/id/11568078-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Chronicles of Narnia', 'HarperCollins', 767, 9780066238500, 'A series of fantasy novels that transport readers to the magical world of Narnia, where animals talk, mythical creatures abound, and battles between good and evil unfold.', 1, 1, 'https://covers.openlibrary.org/b/id/13236788-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Da Vinci Code', 'Doubleday', 454, 9780385504201, 'A thriller that follows symbologist Robert Langdon as he unravels a complex mystery involving secret societies, hidden messages, and the search for the Holy Grail.', 1, 1, 'https://covers.openlibrary.org/b/id/10520498-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Kite Runner', 'Riverhead Books', 371, 9781573222457, 'A novel about the friendship between Amir, a privileged boy, and Hassan, the son of his father''s servant, set against the backdrop of Afghanistan''s tumultuous history.', 1, 1, 'https://covers.openlibrary.org/b/id/12728870-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Book Thief', 'Knopf', 550, 9780375831003, 'Set during World War II, the story follows Liesel Meminger, a young girl who finds solace in books and develops a secret habit of stealing them.', 1, 1, 'https://covers.openlibrary.org/b/id/11478077-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Secret Life of Bees', 'Penguin Books', 336, 9780142001745, 'A coming-of-age novel that explores race, female empowerment, and the power of love as a young girl named Lily Owens finds refuge with a group of beekeeping sisters.', 1, 1, 'https://covers.openlibrary.org/b/id/8066208-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Road', 'Vintage Books', 287, 9780307387899, 'A post-apocalyptic novel that follows a father and his young son as they journey through a desolate landscape, facing danger and despair in search of a better life.', 1, 1, 'https://covers.openlibrary.org/b/id/9557220-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Bell Jar', 'Harper & Row', 288, 9780060174903, 'A semi-autobiographical novel about Esther Greenwood, a talented young woman who struggles with mental health issues and societal expectations in 1950s America.', 1, 1, 'https://covers.openlibrary.org/b/id/13282079-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Help', 'Amy Einhorn Books', 451, 9780399155345, 'Set in the 1960s, the novel explores the complex relationships between African American maids and their white employers in Jackson, Mississippi.', 1, 1, 'https://covers.openlibrary.org/b/id/8589568-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Hunger Games', 'Scholastic Press', 374, 9780439023481, 'The first book in a dystopian trilogy where teenagers from different districts are forced to participate in a televised fight to the death as a form of government control.', 1, 1, 'https://covers.openlibrary.org/b/id/10322358-M.jpg', 'English', 1);
---
---
---
---
---
---
---- books for school 2
INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Da Vinci Code', 'Sapphire Books', 450, 1234567890, 'A thrilling mystery novel that combines art, history, and religion, following a symbologist in his quest to uncover a hidden secret.', 3, 3, 'https://covers.openlibrary.org/b/id/10520498-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Kite Runner', 'Amber Publishing', 400, 9876543210, 'A powerful story of friendship, betrayal, and redemption set against the backdrop of Afghanistan''s turbulent history.', 5, 5, 'https://covers.openlibrary.org/b/id/12728870-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Book Thief', 'Moonstone Press', 350, 2345678901, 'Narrated by Death, this extraordinary novel tells the story of a young girl living in Nazi Germany who finds solace in books and words.', 2, 2, 'https://covers.openlibrary.org/b/id/11478077-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Secret Life of Bees', 'Lavender Publishing', 320, 3456789012, 'Set in 1960s South Carolina, this poignant novel explores themes of family, race, and female empowerment as a young girl seeks answers about her mother.', 4, 4, 'https://covers.openlibrary.org/b/id/8066208-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Road', 'Harbor Books', 300, 4567890123, 'A post-apocalyptic tale of a father and son''s journey through a desolate landscape, exploring themes of survival, love, and hope.', 3, 3, 'https://covers.openlibrary.org/b/id/9557220-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Bell Jar', 'Willow Publishing', 380, 5678901234, 'Semi-autobiographical, this novel follows a young woman''s descent into mental illness and her struggle for identity in a society that places expectations and limitations on women.', 5, 5, 'https://covers.openlibrary.org/b/id/13282079-M.jpg', 'English', 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Help', 'Quillfire Books', 420, 6789012345, 'Set in 1960s Mississippi, this novel portrays the lives of American maids and their relationships with white families, challenging racial boundaries and societal norms.', 2, 2, 'https://covers.openlibrary.org/b/id/10544717-M.jpg', 'English', 2);
--- from chat
INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Alice's Adventures in Wonderland", "Macmillan Publishers", 192, 9781509861621, "A whimsical tale of a young girl named Alice who falls down a rabbit hole and encounters strange and fantastical creatures in a topsy-turvy world.", 3, 3, 'https://covers.openlibrary.org/b/OLID/OL31754751M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Frankenstein; or, The Modern Prometheus", "Lackington, Hughes, Harding, Mavor & Jones", 280, 9780199537150, "A classic Gothic novel that explores the themes of creation, identity, and the consequences of playing god through the story of Victor Frankenstein and his creature.", 2, 2, 'https://covers.openlibrary.org/b/OLID/OL7092075M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Wonderful Wizard of Oz", "George M. Hill Company", 154, 9781442495926, "A beloved children's fantasy novel that follows Dorothy, a young girl from Kansas, as she journeys through the magical Land of Oz with her friends: the Scarecrow, the Tin Woodman, and the Cowardly Lion.", 4, 4, 'https://covers.openlibrary.org/b/OLID/OL7170815M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Lost World", "Hodder & Stoughton", 320, 9780192828585, "A thrilling adventure novel that follows an expedition to a remote South American plateau where prehistoric creatures still roam.", 3, 3, 'https://covers.openlibrary.org/b/OLID/OL22885694M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Dracula", "Archibald Constable and Company", 418, 9780192833862, "A Gothic horror novel that introduces the iconic vampire Count Dracula and explores themes of blood, desire, and the battle between good and evil.", 4, 4, 'https://covers.openlibrary.org/b/OLID/OL7075358M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Brave New World", "Chatto & Windus", 311, 9780099518471, "A dystopian novel set in a futuristic society that explores themes of technology, social control, and the cost of happiness.", 1, 1, 'https://covers.openlibrary.org/b/OLID/OL6504102M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Nineteen Eighty-Four", "Secker & Warburg", 328, 9780141036144, "A dystopian novel set in a totalitarian society where individualism is suppressed and government surveillance is pervasive.", 2, 2, 'https://covers.openlibrary.org/b/OLID/OL21733390M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The War of the Worlds", "Heinemann", 288, 9780141441030, "A science fiction novel that depicts a Martian invasion of Earth and explores themes of imperialism, evolution, and humanity's resilience.", 3, 3, 'https://covers.openlibrary.org/b/OLID/OL9236546M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Time Machine", "William Heinemann", 118, 9781509827702, "A science fiction novella that follows the Time Traveller as he journeys to the future and encounters the descendants of humanity.", 4, 4, 'https://covers.openlibrary.org/b/OLID/OL8000344M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Poison Belt", "Hodder & Stoughton", 200, 9781434446936, "A science fiction novel that continues the story of Professor Challenger and his companions as they face a new global disaster.", 1, 1, 'https://covers.openlibrary.org/b/OLID/OL14034942M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Invisible Man", "C. Arthur Pearson", 146, 9780141441023, "A science fiction novel that tells the story of a scientist who discovers the secret of invisibility and the consequences that follow.", 2, 2, 'https://covers.openlibrary.org/b/OLID/OL24269941M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Vingt mille lieues sous les mers", "Pierre-Jules Hetzel", 528, 9782011556878, "A classic science fiction novel by Jules Verne that follows the adventures of Captain Nemo and his submarine, the Nautilus.", 3, 3, 'https://covers.openlibrary.org/b/OLID/OL24245739M-M.jpg', "French", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("Flatland", "Seeley & Co.", 100, 9780140435317, "A satirical novella that takes place in a two-dimensional world and explores the concept of dimensions and societal hierarchy.", 4, 4, 'https://covers.openlibrary.org/b/OLID/OL23189553M-M.jpg', "English", 2);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ("The Secret Agent", "Methuen & Co.", 272, 9780141441580, "A novel that delves into the world of espionage and terrorism in late 19th-century London.", 3, 3, 'https://covers.openlibrary.org/b/OLID/OL2640257M-M.jpg', "English", 2);

---
---
---
---
--- themes for books of school 1 and 2
INSERT INTO book_theme (theme, book_id)
VALUES
    ('Fiction', 1),
    ('Drama', 1),
    ('Romance', 1),
    ('Coming of Age', 2),
    ('Fiction', 2),
    ('Adventure', 2),
    ('Adventure', 3),
    ('Fantasy', 3),
    ('Science Fiction', 3),
    ('Mystery', 4),
    ('Thriller', 4),
    ('Horror', 4),
    ('Adventure', 5),
    ('Fiction', 5),
    ('Classic', 5),
    ('Classic', 6),
    ('Drama', 6),
    ('Romance', 6),
    ('Mystery', 7),
    ('Thriller', 7),
    ('Horror', 7),
    ('Adventure', 8),
    ('Classic', 8),
    ('Biography', 8),
    ('Biography', 9),
    ('Fiction', 9),
    ('History', 9),
    ('Science Fiction', 10),
    ('Thriller', 10),
    ('Fantasy', 10),
    ('Fantasy', 11),
    ('Adventure', 11),
    ('Coming of Age', 11),
    ('Coming of Age', 12),
    ('Romance', 12),
    ('Mystery', 12),
    ('Mystery', 13),
    ('Thriller', 13),
    ('Horror', 13);
INSERT INTO book_theme (theme, book_id)
VALUES
    ('Fantasy', 14),
    ('Adventure', 14),
    ('Classic', 14),
    ('Mystery', 15),
    ('Adventure', 15),
    ('Fantasy', 15),
    ('Adventure', 16),
    ('Drama', 16),
    ('Coming of Age', 16),
    ('Mystery', 17),
    ('Drama', 17),
    ('Thriller', 17),
    ('Adventure', 18),
    ('Romance', 18),
    ('Drama', 18),
    ('Adventure', 19),
    ('Science Fiction', 19),
    ('Dystopia', 19),
    ('Classic', 20),
    ('Drama', 20),
    ('Coming of Age', 20),
    ('Drama', 21),
    ('Classic', 21),
    ('Dystopia', 22),
    ('Science Fiction', 22),
    ('Adventure', 22),
    ('Mystery', 23),
    ('Drama', 23),
    ('Thriller', 23),
    ('Adventure', 24),
    ('Drama', 24),
    ('Coming of Age', 24),
    ('Mystery', 25),
    ('Drama', 25),
    ('Thriller', 25),
    ('Adventure', 26),
    ('Romance', 26),
    ('Drama', 26),
    ('Adventure', 27),
    ('Science Fiction', 27),
    ('Dystopia', 27),
    ('Classic', 28),
    ('Drama', 28),
    ('Coming of Age', 28),
    ('Fantasy', 29),
    ('Adventure', 29),
    ('Classic', 29),
    ('Adventure', 30),
    ('Fantasy', 30),
    ('Children', 30),
    ('Classic', 31),
    ('Science Fiction', 31),
    ('Gothic', 31),
    ('Adventure', 32),
    ('Fantasy', 32),
    ('Children', 32),
    ('Adventure', 33),
    ('Science Fiction', 33),
    ('Gothic', 34),
    ('Horror', 34),
    ('Classic', 34),
    ('Dystopia', 35),
    ('Science Fiction', 35),
    ('Dystopia', 36),
    ('Science Fiction', 36),
    ('Science Fiction', 37),
    ('Science Fiction', 38),
    ('Adventure', 38),
    ('Science Fiction', 39),
    ('Adventure', 39),
    ('Science Fiction', 40),
    ('Science', 40),
    ('Adventure', 41),
    ('Science Fiction', 41),
    ('Classic', 41),
    ('Science Fiction', 42),
    ('Fantasy', 42),
    ('Science', 42),
    ('Thriller', 43),
    ('Classic', 43),
    ('Fantasy', 44),
    ('Adventure', 44),
    ('Children', 44);
---
---
---
---
---
--- authors for books of schools 1 and 2
INSERT INTO book_author (author, book_id)
VALUES
  ('Jane Austen', 1),
  ('J.D. Salinger', 2),
  ('J.R.R. Tolkien', 3),
  ('George Orwell', 4),
  ('Paulo Coelho', 5),
  ('Charles Dickens', 6),
  ('Virginia Woolf', 7),
  ('Herman Melville', 8),
  ('Oscar Wilde', 9),
  ('Mary Shelley', 10),
  ('George R.R. Martin', 11),
  ('John Green', 12),
  ('Gillian Flynn', 13),
  ('C.S. Lewis', 14),
  ('Dan Brown', 15),
  ('Khaled Hosseini', 16),
  ('Markus Zusak', 17),
  ('Sue Monk Kidd', 18),
  ('Cormac McCarthy', 19),
  ('Sylvia Plath', 20),
  ('Kathryn Stockett', 21),
  ('Suzanne Collins', 22),
  ('Dan Brown', 23),
  ('Khaled Hosseini', 24),
  ('Markus Zusak', 25),
  ('Sue Monk Kidd', 26),
  ('Cormac McCarthy', 27),
  ('Sylvia Plath', 28),
  ('Kathryn Stockett', 29),
  ('Lewis Carroll', 30),
  ('Mary Shelley', 31),
  ('L. Frank Baum', 32),
  ('Arthur Conan Doyle', 33),
  ('Bram Stoker', 34),
  ('Aldous Huxley', 35),
  ('H.G. Wells', 36),
  ('H.G. Wells', 37),
  ('H.G. Wells', 38),
  ('Arthur Conan Doyle', 39),
  ('Arthur Conan Doyle', 40),
  ('Jules Verne', 41),
  ('Edwin A. Abbott', 42),
  ('Joseph Conrad', 43),
  ('Lewis Carroll', 44);

---
---
---
---
---
-- keywords for all books of schools 1 and 2
-- Book 1: Pride and Prejudice
INSERT INTO book_keywords (keywords, book_id) VALUES ('romance', 1);
INSERT INTO book_keywords (keywords, book_id) VALUES ('social class', 1);
INSERT INTO book_keywords (keywords, book_id) VALUES ('marriage', 1);
INSERT INTO book_keywords (keywords, book_id) VALUES ('19th century', 1);

-- Book 2: The Catcher in the Rye
INSERT INTO book_keywords (keywords, book_id) VALUES ('coming of age', 2);
INSERT INTO book_keywords (keywords, book_id) VALUES ('teenage angst', 2);
INSERT INTO book_keywords (keywords, book_id) VALUES ('alienation', 2);
INSERT INTO book_keywords (keywords, book_id) VALUES ('rebellion', 2);

-- Book 3: The Hobbit
INSERT INTO book_keywords (keywords, book_id) VALUES ('fantasy', 3);
INSERT INTO book_keywords (keywords, book_id) VALUES ('adventure', 3);
INSERT INTO book_keywords (keywords, book_id) VALUES ('quest', 3);
INSERT INTO book_keywords (keywords, book_id) VALUES ('dwarves', 3);

-- Book 4: 1984
INSERT INTO book_keywords (keywords, book_id) VALUES ('dystopian', 4);
INSERT INTO book_keywords (keywords, book_id) VALUES ('totalitarianism', 4);
INSERT INTO book_keywords (keywords, book_id) VALUES ('surveillance', 4);
INSERT INTO book_keywords (keywords, book_id) VALUES ('thought control', 4);

-- Book 5: The Alchemist
INSERT INTO book_keywords (keywords, book_id) VALUES ('allegory', 5);
INSERT INTO book_keywords (keywords, book_id) VALUES ('destiny', 5);
INSERT INTO book_keywords (keywords, book_id) VALUES ('personal legend', 5);
INSERT INTO book_keywords (keywords, book_id) VALUES ('self-discovery', 5);

-- Book 6: The Great Expectations
INSERT INTO book_keywords (keywords, book_id) VALUES ('bildungsroman', 6);
INSERT INTO book_keywords (keywords, book_id) VALUES ('ambition', 6);
INSERT INTO book_keywords (keywords, book_id) VALUES ('unrequited love', 6);
INSERT INTO book_keywords (keywords, book_id) VALUES ('social status', 6);

-- Book 41: Vingt mille lieues sous les mers
INSERT INTO book_keywords (keywords, book_id) VALUES ('adventure', 41);
INSERT INTO book_keywords (keywords, book_id) VALUES ('underwater', 41);
INSERT INTO book_keywords (keywords, book_id) VALUES ('exploration', 41);
INSERT INTO book_keywords (keywords, book_id) VALUES ('submarine', 41);

-- Book 42: Flatland
INSERT INTO book_keywords (keywords, book_id) VALUES ('mathematical fiction', 42);
INSERT INTO book_keywords (keywords, book_id) VALUES ('satire', 42);
INSERT INTO book_keywords (keywords, book_id) VALUES ('dimension', 42);
INSERT INTO book_keywords (keywords, book_id) VALUES ('social commentary', 42);

-- Book 43: The Secret Agent
INSERT INTO book_keywords (keywords, book_id) VALUES ('espionage', 43);
INSERT INTO book_keywords (keywords, book_id) VALUES ('terrorism', 43);
INSERT INTO book_keywords (keywords, book_id) VALUES ('anarchism', 43);
INSERT INTO book_keywords (keywords, book_id) VALUES ('political thriller', 43);

-- Book 44: Alice's Adventures in Wonderland
INSERT INTO book_keywords (keywords, book_id) VALUES ('fantasy', 44);
INSERT INTO book_keywords (keywords, book_id) VALUES ('imagination', 44);
INSERT INTO book_keywords (keywords, book_id) VALUES ('nonsense', 44);
INSERT INTO book_keywords (keywords, book_id) VALUES ('children', 44);

---
---
---
---
---
---
--- superadmin
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES (1111, 'manosneo', 1, 'super_admin', 'manosaekara@gmail.com', 'manos', 'aek', '1924-01-01');
--- 1 admin for every shcool 
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES (1234, 'george123', 1, 'admin', 'georgesmith@gmail.com', 'George', 'Smith', '1985-07-10'),
       (5678, 'emily456', 2, 'admin', 'emilyjones@gmail.com', 'Emily', 'Jones', '1982-11-18'),
       (9876, 'jason789', 3, 'admin', 'jasonbrown@gmail.com', 'Jason', 'Brown', '1988-03-25'),
       (5432, 'sarah321', 4, 'admin', 'sarahdavis@gmail.com', 'Sarah', 'Davis', '1979-09-05'),
       (7890, 'michael654', 5, 'admin', 'michaelwilson@gmail.com', 'Michael', 'Wilson', '1987-12-01');
--- teachers - 2 for every school
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES
  (1234, 'johnsmith', 2, 'teacher', 'johnsmith@gmail.com', 'John', 'Smith', '1985-07-12'),
  (9876, 'jennifermiller', 3, 'teacher', 'jennifermiller@gmail.com', 'Jennifer', 'Miller', '1978-03-30'),
  (2468, 'mike1980', 4, 'teacher', 'mike1980@gmail.com', 'Michael', 'Johnson', '1980-11-05'),
  (1357, 'amandabrown', 5, 'teacher', 'amandabrown@gmail.com', 'Amanda', 'Brown', '1992-02-18'),
  (5678, 'davidthompson', 1, 'teacher', 'davidthompson@gmail.com', 'David', 'Thompson', '1972-09-10'),
  (7890, 'sarahjones', 2, 'teacher', 'sarahjones@gmail.com', 'Sarah', 'Jones', '1988-12-01'),
  (5432, 'robertgreen', 3, 'teacher', 'robertgreen@gmail.com', 'Robert', 'Green', '1983-06-22'),
  (2109, 'emilytaylor', 4, 'teacher', 'emilytaylor@gmail.com', 'Emily', 'Taylor', '1995-04-14'),
  (8765, 'chrisharris', 5, 'teacher', 'chrisharris@gmail.com', 'Chris', 'Harris', '1975-08-07'),
  (4321, 'jessicawright', 1, 'teacher', 'jessicawright@gmail.com', 'Jessica', 'Wright', '1987-01-23');

--students - 5 for every school
INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email, user_firstname, user_lastname, user_date_of_birth)
VALUES
  (4321, 'ethan456', 1, 'student', 'ethanbrown@example.com', 'Ethan', 'Brown', '2003-06-10'),
  (5678, 'mia789', 1, 'student', 'miaharris@example.com', 'Mia', 'Harris', '2004-09-05'),
  (8765, 'jacob234', 1, 'student', 'jacobsmith@example.com', 'Jacob', 'Smith', '2003-03-17'),
  (7890, 'ava567', 1, 'student', 'avajones@example.com', 'Ava', 'Jones', '2002-12-08'),
  (9012, 'sophia890', 1, 'student', 'sophiawilson@example.com', 'Sophia', 'Wilson', '2004-11-25'),
  (3456, 'noah321', 2, 'student', 'noahdavis@example.com', 'Noah', 'Davis', '2005-07-02'),
  (2345, 'olivia654', 2, 'student', 'oliviamartin@example.com', 'Olivia', 'Martin', '2003-02-13'),
  (1234, 'liam987', 2, 'student', 'liamthompson@example.com', 'Liam', 'Thompson', '2004-04-30'),
  (4321, 'emma123', 2, 'student', 'emmalopez@example.com', 'Emma', 'Lopez', '2002-09-22'),
  (5678, 'william456', 2, 'student', 'williamjohnson@example.com', 'William', 'Johnson', '2003-12-14'),
  (8765, 'ava789', 3, 'student', 'avamartinez@example.com', 'Ava', 'Martinez', '2004-06-07'),
  (7890, 'mason234', 3, 'student', 'masonhall@example.com', 'Mason', 'Hall', '2002-11-19'),
  (9012, 'sophia567', 3, 'student', 'sophiamiller@example.com', 'Sophia', 'Miller', '2003-08-12'),
  (3456, 'james890', 3, 'student', 'jamesrivera@example.com', 'James', 'Rivera', '2004-02-27'),
  (2345, 'olivia123', 3, 'student', 'oliviacooper@example.com', 'Olivia', 'Cooper', '2002-10-15'),
  (1234, 'liam456', 4, 'student', 'liamroberts@example.com', 'Liam', 'Roberts', '2003-01-28'),
  (4321, 'ava729', 4, 'student', 'avahill@example.com', 'Ava', 'Hill', '2004-04-15'),
  (5678, 'michael234', 4, 'student', 'michaelwood@example.com', 'Michael', 'Wood', '2002-12-07'),
  (8765, 'sophia567', 4, 'student', 'sophialong@example.com', 'Sophia', 'Long', '2003-09-20'),
  (9012, 'oliver123', 5, 'student', 'oliverwright@example.com', 'Oliver', 'Wright', '2003-05-10'),
  (3456, 'charlotte456', 5, 'student', 'charlottelee@example.com', 'Charlotte', 'Lee', '2002-11-15'),
  (2345, 'lucas789', 5, 'student', 'lucasbaker@example.com', 'Lucas', 'Baker', '2004-02-22'),
  (1234, 'harper234', 5, 'student', 'harperjackson@example.com', 'Harper', 'Jackson', '2003-07-31'),
  (4321, 'amelia567', 5, 'student', 'ameliarobinson@example.com', 'Amelia', 'Robinson', '2002-12-18');
---
---
---
-- +++++++++++++++ --> WORKING SO FAR
---
---
--- EXTRA
--- SCHOOL 1
INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Bible', 'Stellar Books', 1000, 6931475208, 'A sacred text containing religious scriptures and teachings in various traditions, including Judaism and Christianity.', 5, 5, 'https://covers.openlibrary.org/b/OLID/OL39801870M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Adventures of Huckleberry Finn', 'Stellar Books', 350, 5192437860, 'A classic American novel by Mark Twain that follows the adventures of a young boy named Huckleberry Finn as he escapes from his abusive father and embarks on a journey down the Mississippi River.', 2, 2, 'https://covers.openlibrary.org/b/OLID/OL7062714M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Treasure Island', 'Stellar Books', 200, 2796450813, 'An adventure novel by Robert Louis Stevenson, featuring the story of Jim Hawkins and his encounters with pirates, buried treasure, and swashbuckling adventures.', 3, 3, 'https://covers.openlibrary.org/b/OLID/OL24195201M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Sense and Sensibility', 'Stellar Books', 320, 4917820365, 'A classic novel by Jane Austen, exploring the themes of love, marriage, and societal expectations through the lives of the Dashwood sisters.', 4, 4, 'https://covers.openlibrary.org/b/OLID/OL14041582M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('A Tale of Two Cities', 'Stellar Books', 450, 8319726450, 'A historical novel by Charles Dickens set in London and Paris before and during the French Revolution, depicting the struggles and contrasts between the two cities.', 3, 3, 'https://covers.openlibrary.org/b/OLID/OL46835117M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('A Christmas Carol', 'Stellar Books', 150, 5871039426, 'A beloved novella by Charles Dickens, telling the story of Ebenezer Scrooge and his transformation after being visited by the ghosts of Christmas past, present, and future.', 5, 5, 'https://covers.openlibrary.org/b/OLID/OL47311368M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Little Women', 'Stellar Books', 400, 9264350718, 'A classic novel by Louisa May Alcott, following the lives of the four March sisters as they navigate love, loss, and the transition to adulthood during the Civil War era.', 4, 4, 'https://covers.openlibrary.org/b/OLID/OL24620928M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Oliver Twist', 'Stellar Books', 280, 7609231485, 'A novel by Charles Dickens, depicting the hardships and adventures of an orphan named Oliver Twist as he navigates the grim streets of Victorian London.', 3, 3, 'https://covers.openlibrary.org/b/OLID/OL47307472M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('Great Expectations', 'Stellar Books', 380, 3715928604, 'A novel by Charles Dickens, tracing the life of Pip as he rises from poverty to wealth and navigates the complexities of love, class, and identity in 19th-century England.', 4, 4, 'https://covers.openlibrary.org/b/OLID/OL45791004M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('El ingenioso hidalgo Don Quijote de la Mancha', 'Stellar Books', 500, 3679452180, 'A renowned novel by Miguel de Cervantes, narrating the adventures of Don Quixote, a delusional knight-errant, and his loyal squire Sancho Panza.', 3, 3, 'https://covers.openlibrary.org/b/OLID/OL6469521M-M.jpg', 'Spanish', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Adventures of Sherlock Holmes', 'Stellar Books', 320, 8162945730, 'A collection of twelve detective stories featuring the famous detective Sherlock Holmes and his loyal friend Dr. John Watson', 4, 4, 'https://covers.openlibrary.org/b/OLID/OL24349267M-M.jpg', 'English', 1);

INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books, number_of_available_books, book_image, book_language, school_id)
VALUES ('The Wonderful Wizard of Oz', 'Stellar Books', 220, 4257891630, 'A beloved children\'s novel by L. Frank Baum, following the adventures of Dorothy Gale and her friends as they journey through the magical Land of Oz.', 3, 3, 'https://covers.openlibrary.org/b/OLID/OL7170815M-M.jpg', 'English', 1);


--- select AVG(rating) as average_rating from review;

---
---
---
---
---