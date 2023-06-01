--- testing the trigger about borrow
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (1, 15, 'borrowed', '2023-05-25', '2023-05-26', '2023-05-28');

INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (2, 15, 'reserved', '2023-05-30');

INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (3, 15, 'reserved', '2023-05-30');
-- the same about a teacher
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (5, 5, 'borrowed', '2023-05-26', '2023-05-27', '2023-05-29');

INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (6, 5, 'reserved', '2023-05-30');


--- queue
-- 1. 
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (8, 15, 'reserved', '2023-05-28');
CALL decrease_available_books(6);
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (6, 15, 'queue', '2023-05-29');
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (6, 16, 'queue', '2023-05-30');
CALL increase_available_books(6);

select * from book_status where user_id=16 OR user_id=15;
select * from book_status where user_id=15;

-- 2.
CALL decrease_available_books(6);
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (6, 6, 'queue', '2023-05-29');
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (6, 5, 'queue', '2023-05-30');
CALL increase_available_books(6);

select * from book_status where user_id=6 OR user_id=5;

---3
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (1, 15, 'reserved', '2023-05-29');
CALL decrease_available_books(1);
INSERT INTO book_status (book_id, user_id, status, request_date)
VALUES (1, 16, 'queue', '2023-05-30');
delete from book_status where book_id=1 AND status = 'reserved';

select number_of_available_books from book where book_id=1;
CALL increase_available_books(1);
Select check_book_update(1) as update_occured;


-- queries
INSERT INTO book_author (author, book_id)
VALUES
  ('Edith Wharton', 62),('Edith Wharton', 63),('Edith Wharton', 64),('Edith Wharton', 65),('Edith Wharton', 66);