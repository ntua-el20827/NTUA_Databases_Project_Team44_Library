---3.1 Superadmin Queries
---3.1.1 List of the total number of borrowings per school  //Κριτήρια Αναζήτησης
SELECT 
  school.school_name,
  COUNT(*) AS borrow_count
FROM 
  book_status
  INNER JOIN book ON book_status.book_id = book.book_id
  INNER JOIN school ON book.school_id = school.school_id
WHERE 
  book_status.status = 'borrowed' AND
  YEAR(book_status.approval_date) = <year> AND
  MONTH(book_status.approval_date) = <month>
GROUP BY 
  school.school_name
ORDER BY 
  borrow_count DESC;

---3.1.2(a) Authors who belong to a given book theme
SELECT DISTINCT book_author.author
FROM book_theme
INNER JOIN book_author ON book_theme.book_id = book_author.book_id
WHERE book_theme.theme = <your_book_theme>;
---3.1.2(b) Teachers who have borrowed books of a given book theme in the last year
SELECT DISTINCT lib_user.user_name
FROM book_theme
INNER JOIN book ON book_theme.book_id = book.book_id
INNER JOIN book_status ON book.book_id = book_status.book_id
INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
WHERE book_theme.theme = <your_book_theme>
  AND book_status.status = 'borrowed'
  AND book_status.approval_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
  AND lib_user.role_name = 'teacher';

---3.1.3 Find the teachers who are younger than 40 years old and have borrowed the most books as well as the number of the books.
SELECT lib_user.user_name, COUNT(*) AS num_borrowings
FROM book_status
INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
WHERE lib_user.role_name = 'teacher'
  AND lib_user.user_date_of_birth > UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 40 YEAR))
  AND book_status.status = 'borrowed'
GROUP BY lib_user.user_id
ORDER BY num_borrowings DESC
LIMIT 1;

---3.1.4 List of book authors whose books have not been borrowed
SELECT DISTINCT book_author.author
FROM book_author
LEFT JOIN book_status ON book_author.book_id = book_status.book_id
WHERE book_status.book_id IS NULL;

---3.1.5 Which administrators have registered the same number of more than 20 borrowings within a year
SELECT lib_user.user_name
FROM book_status
INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
WHERE lib_user.role_name = 'admin'
  AND book_status.approval_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
GROUP BY lib_user.user_id
HAVING COUNT(*) >= 20;

---3.1.6 top 3 book theme pairs that appear in borrowings
SELECT 
  CONCAT(bt1.theme,',',bt2.theme) AS theme_pair, 
  COUNT(*) AS borrow_count
FROM 
  book_theme bt1
  INNER JOIN book_theme bt2 ON bt1.book_id = bt2.book_id AND bt1.theme < bt2.theme
  INNER JOIN book_status ON bt2.book_id = book_status.book_id
WHERE 
  book_status.status = 'borrowed'
GROUP BY 
  theme_pair
ORDER BY 
  borrow_count DESC
LIMIT 3;

---3.1.7 Authors who have written at least 5 books less than the author who has written the most books
SELECT book_author.author, (max_books.num_books - COUNT(*)) AS book_diff
FROM book_author
INNER JOIN (
  SELECT book_author.book_id, COUNT(*) AS num_books
  FROM book_author
  GROUP BY book_author.book_id
  ORDER BY num_books DESC
  LIMIT 1
) AS max_books ON book_author.book_id = max_books.book_id
GROUP BY book_author.author
HAVING book_diff >= 5;

---3.2 Αdmin Queries
---3.2.1 Present all books by title, author (search criteria: book title/book theme/book author/number of books)
SELECT b.title, GROUP_CONCAT(ba.author) AS authors
FROM book AS b
JOIN book_author AS ba ON b.book_id = ba.book_id
WHERE b.school_id = <school_id>
GROUP BY b.book_id;
/*Example for search by title
SELECT b.title, GROUP_CONCAT(ba.author) AS authors
FROM book AS b
JOIN book_author AS ba ON b.book_id = ba.book_id
WHERE b.school_id = <school_id> AND b.title = <book_title>
GROUP BY b.book_id
*/

---3.2.2 Find all borrowers who have at their pocession at least one book and they have delayed the return
SELECT u.user_id, u.user_firstname, u.user_lastname,DATEDIFF(NOW(), bs.approval_date)
FROM lib_user u
JOIN book_status bs ON u.user_id = bs.user_id
WHERE bs.status = 'borrowed' AND bs.return_date IS NULL AND u.school_id = <school_id> AND (DATEDIFF(NOW(), bs.approval_date) > 7)
/*Example for search by first_name
SELECT u.user_id, u.user_firstname, u.user_lastname,DATEDIFF(NOW(), bs.approval_date)
FROM lib_user u
JOIN book_status bs ON u.user_id = bs.user_id
WHERE bs.status = 'borrowed' AND bs.return_date IS NULL AND u.school_id = <school_id> AND (DATEDIFF(NOW(), bs.approval_date) > 7) AND u.user_firstname LIKE <user_firstname>
*/

---3.2.3 Average of reviews by borrower and book theme(search criteria: user/book theme)
SELECT CONCAT(u.user_firstname, ' ', u.user_lastname) AS borrower_name, bt.theme, AVG(r.rating) AS avg_rating
FROM lib_user u
INNER JOIN review r ON u.user_id = r.user_id
INNER JOIN book b ON r.book_id = b.book_id
INNER JOIN book_theme bt ON b.book_id = bt.book_id
WHERE u.school_id = <school_id>
GROUP BY u.user_id, bt.theme;


---3.3 User Queries
---3.3.1 All registered books(search criteria: title/book theme/author)
SELECT 
  book.book_id,
  book.title,
  book.publisher,
  book.pages,
  book.ISBN,
  book.summary,
  book.number_of_books,
  book.number_of_available_books,
  book.book_image,
  book.book_language,
  GROUP_CONCAT(DISTINCT book_theme.theme SEPARATOR ', ') AS themes,
  GROUP_CONCAT(DISTINCT book_author.author SEPARATOR ', ') AS authors
FROM 
  book
  INNER JOIN book_theme ON book.book_id = book_theme.book_id
  INNER JOIN book_author ON book.book_id = book_author.book_id
WHERE 
  book.title LIKE '%Title_search%' -- specify the book title
  OR book_theme.theme = 'Theme_search' -- specify the book theme
  OR book_author.author LIKE '%Jane Austen%' -- specify the book author
GROUP BY 
  book.book_id;

---3.3.2 List of books that each user has borrowed (we have put user_id,user full name,book_id,book_title)
SELECT 
  lib_user.user_id,
  CONCAT(lib_user.user_firstname, ' ', lib_user.user_lastname) AS user_full_name,
  book.book_id,
  book.title AS book_title
FROM 
  book_status
  INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
  INNER JOIN book ON book_status.book_id = book.book_id
WHERE 
  book_status.status = 'borrowed'
ORDER BY 
  lib_user.user_id;