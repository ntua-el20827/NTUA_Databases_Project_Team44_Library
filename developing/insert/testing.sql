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