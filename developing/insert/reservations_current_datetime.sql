-- School 1
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (1, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(1);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (2, 2, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(2);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (3, 5, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(3);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (4, 6, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(4);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (5, 7, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(5);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (6, 14, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(6);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (7, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(7);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (8, 16, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(8);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (9, 17, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(9);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (10, 18, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(10);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (11, 19, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(11);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (12, 30, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(12);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (13, 31, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(13);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (14, 32, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(14);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (15, 33, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(15);

-- School 2
/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (23, 3, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(23);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (24, 8, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(24);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (25, 9, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(25);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (26, 10, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(26); */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (27, 20, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(27);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (28, 21, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(28);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (29, 22, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(29);

/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (30, 23, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(30);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (31, 24, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(31);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (32, 34, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(32); */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (33, 35, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(33);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (34, 36, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(34);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (35, 37, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(35);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (36, 38, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(36);

/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (37, 39, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(37);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (38, 40, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(38);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (39, 41, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(39);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (40, 42, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(40); */

-- School 3
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (47, 11, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(47);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (48, 25, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(48);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (49, 26, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(49);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (50, 27, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(50);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (51, 43, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(51);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (52, 44, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(52);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (53, 45, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(53);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (54, 46, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(54);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (55, 47, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(55);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (56, 48, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(56);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (57, 49, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(57);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (58, 50, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(58);

---










INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (1, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (2, 2, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (3, 5, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (4, 6, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (5, 7, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (6, 14, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (7, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (8, 16, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (9, 17, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (10, 18, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (11, 19, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (12, 30, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (13, 31, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (14, 32, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (15, 33, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

--- School 2
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (23, 3, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (24, 8, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (25, 9, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (26, 10, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (27, 20, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (28, 21, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (29, 22, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (30, 23, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (31, 24, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (32, 34, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (33, 35, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (34, 36, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (35, 37, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (36, 38, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (37, 3, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

--- School 3
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (44, 4, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (45, 11, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (46, 12, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (47, 13, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (48, 25, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (49, 26, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (50, 27, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (51, 28, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (52, 29, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (53, 39, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);


-----------------
--- τελικο που δουλευει
--- Κρατήσεις

-- School 1
/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (1, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(1); */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (2, 2, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(2);

/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (3, 5, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(3);
 */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (4, 6, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(4);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (5, 7, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(5);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (6, 14, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(6);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (7, 15, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(7);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (8, 16, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(8);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (9, 17, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(9);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (10, 18, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(10);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (11, 19, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(11);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (12, 30, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(12);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (13, 31, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(13);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (14, 32, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(14);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (15, 33, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(15);

-- School 2
/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (23, 3, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(23);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (24, 8, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(24);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (25, 9, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(25);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (26, 10, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(26); */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (27, 20, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(27);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (28, 21, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(28);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (29, 22, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(29);

/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (30, 23, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(30);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (31, 24, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(31);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (32, 34, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(32); */

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (33, 35, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(33);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (34, 36, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(34);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (35, 37, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(35);

/* INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (36, 38, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(36);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (37, 39, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(37);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (38, 40, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(38);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (39, 41, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(39);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (40, 42, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(40); */

-- School 3
INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (47, 11, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(47);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (48, 25, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(48);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (49, 26, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(49);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (50, 27, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(50);

INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date)
VALUES (51, 43, 'reserved', DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, NULL);
CALL decrease_available_books(51);

