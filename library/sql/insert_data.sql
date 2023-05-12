--INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname)
--VALUES ('Example School 1', 'Example City 1', 'Example Street 1231', 12345, 'example@email.com', 'Smith', 'John', 'Doe', 'Jane');
--INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname)
--VALUES ('Example School 2', 'Example City 2', 'Example Street 1232', 11236, 'example2@email.com', 'Geo', 'George', 'Neof', 'Manos');

-- school
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Lincoln Elementary', 'Chicago', 'W Madison St', 60601, 'lincoln@cps.edu', 'Gomez', 'Maria', 'Lee', 'David');
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Washington High', 'New York', '5th Ave', 10001, 'washington@nycdoe.net', 'Smith', 'John', 'Nguyen', 'Jennifer');
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Jefferson Middle', 'Los Angeles', 'Wilshire Blvd', 90001, 'jefferson@lausd.net', 'Chen', 'Linda', 'Rodriguez', 'Jose');
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Madison Elementary', 'Houston', 'W Gray St', 77001, 'madison@houstonisd.org', 'Jackson', 'Stephanie', 'Gonzalez', 'Juan');
INSERT INTO school (school_name, city, street, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname) VALUES ('Franklin High', 'San Francisco', 'Geary Blvd', 94016, 'franklin@sfusd.edu', 'Martinez', 'Anthony', 'Turner', 'Amanda');

-- school phone
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2108924307, 5, '2019-07-13 23:57:58');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2110454100, 3, '1985-02-19 03:59:16');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2112010556, 4, '2016-03-13 01:06:57');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2115491237, 1, '1988-03-28 16:30:01');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2120278453, 1, '1990-08-17 19:57:18');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2120927795, 1, '2018-05-08 13:22:47');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2126897385, 4, '2000-10-30 13:16:17');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2130287780, 3, '1985-05-06 01:31:36');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2130471484, 2, '2012-05-30 06:42:49');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2131225554, 5, '1984-07-25 03:08:00');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2137023998, 3, '2004-08-19 22:10:39');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2141147350, 2, '2015-12-20 10:28:40');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2144808598, 4, '1975-01-19 15:41:01');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2147483647, 1, '2004-02-28 08:14:11');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2147483647, 2, '2013-01-27 03:01:41');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2147483647, 3, '2003-07-10 20:25:36');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2147483647, 4, '2010-11-30 19:06:03');
INSERT INTO `school_phone` (`phone`, `school_id`, `last_update`) VALUES (2147483647, 5, '1981-02-10 03:40:53');


-- lib user
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (1, 7686, 'victoria.kling', 1, '1983-07-15 05:26:30');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (2, 1660, 'qzieme', 2, '2010-12-31 18:53:45');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (3, 4498, 'guiseppe72', 3, '2011-05-12 07:56:49');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (4, 9716, 'nienow.josianne', 4, '1989-03-12 11:05:27');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (5, 7911, 'reinger.vallie', 5, '1994-10-02 09:45:00');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (6, 9703, 'ignacio18', 1, '2017-08-22 12:49:43');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (7, 1329, 'hanna48', 2, '1998-01-01 10:16:00');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (8, 4169, 'beahan.dorris', 3, '1989-10-25 18:40:23');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (9, 5466, 'svolkman', 4, '1975-09-02 07:21:19');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (10, 8820, 'wwitting', 5, '1978-12-07 16:44:39');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (11, 5649, 'baltenwerth', 1, '2012-11-21 14:10:43');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (12, 9269, 'lisette.baumbach', 2, '2005-06-01 21:48:34');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (13, 3486, 'francesca48', 3, '1977-06-19 01:48:43');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (14, 5028, 'gstark', 4, '1997-08-01 09:20:26');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (15, 8197, 'christiana.cruickshank', 5, '2011-02-18 02:31:51');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (16, 3236, 'ida.hyatt', 1, '1978-03-05 06:04:35');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (17, 2349, 'tvonrueden', 2, '2020-05-12 15:46:22');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (18, 6807, 'wcrist', 3, '2002-12-14 07:02:11');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (19, 1012, 'ethyl.kuvalis', 4, '1989-10-09 12:51:20');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (20, 5415, 'dschaefer', 5, '1987-01-04 02:42:14');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (21, 4281, 'nhansen', 1, '2014-05-16 22:05:55');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (22, 5789, 'mandy.howell', 2, '1979-11-06 08:16:30');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (23, 1178, 'jokuneva', 3, '1974-12-10 18:21:31');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (24, 9553, 'jaunita.weissnat', 4, '2007-02-25 10:58:26');
INSERT INTO `lib_user` (`user_id`, `user_pwd`, `user_name`, `school_id`, `last_update`) VALUES (25, 4837, 'casper.rusty', 5, '1972-12-03 10:40:59');


-- role
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (1, 1, 'super_admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (2, 2, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (3, 3, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (4, 4, 'student');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (5, 5, 'student');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (6, 6, 'super_admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (7, 7, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (8, 8, 'super_admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (9, 9, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (10, 10, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (11, 11, 'student');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (12, 12, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (13, 13, 'super_admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (14, 14, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (15, 15, 'student');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (16, 16, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (17, 17, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (18, 18, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (19, 19, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (20, 20, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (21, 21, 'admin');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (22, 22, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (23, 23, 'student');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (24, 24, 'teacher');
INSERT INTO `role` (`role_id`, `user_id`, `role_name`) VALUES (25, 25, 'student');

--books
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (1, 'Reiciendis vero consequuntur mollitia assumen', 'Schamberger LLC', 1223, 4294967295, 'Quos natus dolorem natus iste. Placeat necess', 78491, 'it', 1, 1, '2012-08-18 21:33:11');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (2, 'Est inventore sint reprehenderit sint velit q', 'Emmerich, Larkin and Gutmann', 1737, 4294967295, 'Excepturi aut vel quaerat ab voluptas delectu', 7090, 'ru', 2, 2, '2020-05-30 10:46:27');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (3, 'Assumenda molestiae esse nostrum ad.', 'Terry-Wisozk', 807, 4294967295, 'Consequatur nisi et voluptas autem vitae. Mol', 839358206, 'en', 3, 3, '1996-10-27 23:20:22');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (4, 'Illo ut temporibus quia enim ad illo praesent', 'Mueller Group', 869, 4294967295, 'Dolorem atque in corrupti voluptates nesciunt', 0, 'ru', 4, 4, '2017-07-03 07:41:26');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (5, 'Et aut labore consequatur quidem aut iste.', 'Gusikowski Group', 1130, 4294967295, 'Eum deleniti commodi sapiente fugit. Facilis ', 918636, 'es', 5, 5, '1983-04-28 07:37:03');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (6, 'Debitis aut sint qui debitis sunt expedita bl', 'Grady-Bailey', 586, 4294967295, 'Doloribus odit earum assumenda incidunt. Aper', 907669724, 'it', 6, 1, '1985-08-20 15:09:37');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (7, 'Velit cupiditate in ut.', 'Gerhold, Hegmann and Cummerata', 402, 4294967295, 'Quibusdam deserunt quia omnis. Consequuntur l', 2208, 'en', 7, 2, '2015-04-14 13:00:58');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (8, 'Sapiente quibusdam quibusdam sit amet est nih', 'Abshire LLC', 1809, 4294967295, 'Porro velit maiores harum et inventore nemo. ', 3, 'it', 8, 3, '2009-11-04 00:09:52');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (9, 'Odit cum dolores iure possimus dicta impedit.', 'O\'Keefe LLC', 681, 4294967295, 'Voluptas quasi repellat officia excepturi. Ve', 76078, 'pt', 9, 4, '2006-07-24 09:13:16');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (10, 'Magnam mollitia quia dolor et molestiae molli', 'Johns, Jaskolski and Mueller', 1809, 4294967295, 'Quae nesciunt molestiae distinctio dolore. No', 49, 'cn', 10, 5, '2002-02-01 03:10:46');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (11, 'Aut voluptatibus et veniam aspernatur nostrum', 'Corkery, Bergnaum and Ledner', 1128, 4294967295, 'Eum odit voluptate ut magni non esse dignissi', 772520, 'fr', 11, 1, '1999-11-19 07:06:56');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (12, 'Voluptatem rem unde iusto sed.', 'Kuvalis, Kuhn and Schamberger', 1316, 4294967295, 'Tempore corporis ut architecto quae rerum sed', 688585540, 'en', 12, 2, '2006-08-06 14:02:35');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (13, 'Sapiente cumque laborum voluptas quaerat.', 'Kessler PLC', 428, 4294967295, 'Inventore perspiciatis non ipsum unde. Fugit ', 15, 'ru', 13, 3, '1972-02-12 12:25:11');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (14, 'Esse porro reiciendis culpa nisi dignissimos ', 'Murazik-Rosenbaum', 885, 4294967295, 'Non laudantium nesciunt et minima in et et. C', 5, 'es', 14, 4, '2009-01-11 14:45:44');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (15, 'Asperiores error facilis consectetur deserunt', 'Walsh-Kirlin', 1560, 4294967295, 'Culpa velit dolore asperiores saepe in. Place', 4, 'de', 15, 5, '1980-09-21 13:06:36');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (16, 'Ut iure ipsum non vel aut.', 'Johnston PLC', 892, 4294967295, 'Voluptas asperiores amet sed soluta vitae. Is', 0, 'ru', 16, 1, '2005-12-17 00:19:37');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (17, 'Id vero voluptas velit iure corporis.', 'Prosacco, Baumbach and Schmidt', 260, 4294967295, 'Incidunt a ad error beatae provident. Cumque ', 328, 'it', 17, 2, '2008-10-02 00:08:05');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (18, 'Temporibus qui quae id quaerat et beatae.', 'Gerhold-Jakubowski', 1784, 4294967295, 'Perferendis doloremque quod cupiditate qui. Q', 12333935, 'it', 18, 3, '1987-01-21 17:07:00');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (19, 'Non et iure dolorum tenetur nihil.', 'Lueilwitz and Sons', 417, 4294967295, 'Sit enim nihil ullam et esse. Deserunt exerci', 5, 'pt', 19, 4, '2014-06-03 14:39:54');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (20, 'Commodi quasi tempora eum.', 'Littel Ltd', 284, 4294967295, 'Ea nisi minus tempora doloribus in. Consequun', 6, 'fr', 20, 5, '1988-12-04 06:45:36');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (21, 'Ipsum et pariatur rerum sit.', 'Pagac and Sons', 1261, 4294967295, 'Modi labore nihil qui nulla sapiente. Dolorib', 773, 'ru', 21, 1, '1979-02-19 20:37:18');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (22, 'Nihil amet iste consequatur.', 'Ankunding Group', 948, 4294967295, 'Omnis voluptas voluptatem laboriosam aperiam ', 0, 'pt', 22, 2, '1995-11-14 03:10:50');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (23, 'Est autem dolor ad quae.', 'Feest Group', 285, 4294967295, 'Tenetur sint omnis reiciendis est. Molestiae ', 87660, 'en', 23, 3, '2007-03-20 19:08:33');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (24, 'Magnam tempore dolores at placeat autem.', 'Stark Group', 595, 4294967295, 'Perferendis numquam voluptas vitae enim. Dese', 9940235, 'fr', 24, 4, '2000-03-16 21:10:27');
INSERT INTO `book` (`book_id`, `title`, `publisher`, `pages`, `ISBN`, `summary`, `number_of_books`, `book_language`, `user_id`, `school_id`, `last_update`) VALUES (25, 'Fugiat nisi eum cupiditate quae cumque asperi', 'Prohaska Inc', 1206, 4294967295, 'Vitae laudantium fugiat ipsum ut praesentium ', 8, 'fr', 25, 5, '1992-01-02 14:19:57');

--book author
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Althea Schoen', 18, '2002-09-27 11:05:23');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Alyson Kuhic', 9, '2014-12-20 06:05:14');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Dewayne VonRueden', 21, '2006-02-05 09:56:58');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Donnie Tillman', 12, '2004-01-24 16:18:51');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Dr. Kailyn Swaniawski', 22, '2005-11-01 00:14:47');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Dr. Myrna Zemlak', 25, '1975-07-04 09:29:00');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Dr. Retha Halvorson', 17, '2021-01-15 02:31:09');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Dr. Zachariah Towne V', 15, '2008-06-12 08:21:46');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Elaina Parker DVM', 11, '1993-01-22 16:02:18');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Elliott Stamm', 3, '1999-04-11 08:55:24');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Elna Collier', 23, '1989-04-15 23:33:42');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Haylie Corkery', 7, '1991-06-26 21:07:22');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Jodie Volkman PhD', 10, '1977-01-26 16:12:44');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Mauricio Zieme', 5, '1986-04-23 12:46:30');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Miss Allene Daugherty III', 13, '2002-08-24 16:31:59');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Miss Marilou Walker', 2, '1971-09-04 19:02:29');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Mr. Wilford Bergnaum', 1, '2015-03-21 13:15:55');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Ms. Kenna Hahn', 8, '2010-06-08 00:01:55');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Polly Mann', 19, '2011-12-30 06:43:40');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Prof. Curtis Schaefer', 14, '1994-11-03 09:17:20');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Prof. Emilie Skiles', 16, '2001-02-19 22:28:59');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Prof. Emmet Skiles III', 20, '1983-12-12 09:22:52');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Ruby Pfeffer', 6, '1986-12-31 20:36:33');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Terry Kozey DDS', 24, '2019-06-23 01:45:32');
INSERT INTO `book_author` (`author`, `book_id`, `last_update`) VALUES ('Therese Stokes', 4, '2001-07-06 16:05:55');

-- book keywords
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Aut excepturi repellat aut quia illo dolore dolores.', 25, '1973-07-23 21:23:53');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Consequatur commodi quasi porro consequatur animi.', 12, '1982-12-25 14:40:58');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Consequatur rerum ratione non amet numquam mollitia.', 4, '2014-11-04 19:46:34');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Dicta officia at dolorem sit recusandae veritatis.', 1, '1985-11-27 18:38:06');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Dolores adipisci ut eaque ab fuga.', 2, '2002-09-01 18:13:32');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Dolores modi officiis quos doloremque qui voluptas culpa.', 3, '1980-10-29 14:43:21');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Dolorum voluptatem vero facere quas eum inventore qui.', 18, '2019-01-17 05:33:49');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Ea quia aut consequatur molestiae aliquid eius sed quia.', 21, '1979-04-19 16:25:36');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Et temporibus et ab quo.', 13, '1999-08-20 11:40:43');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Ex et enim omnis quia.', 14, '1974-11-09 09:29:48');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Facere enim et consequatur porro eligendi impedit.', 19, '2020-05-04 20:23:19');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Facere modi deserunt autem quo dolor qui et.', 9, '2006-10-04 14:32:06');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Ipsam dolore iusto quia quidem mollitia qui voluptatem.', 8, '1977-08-16 19:26:55');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Iste fugit voluptas aut explicabo qui ipsum suscipit necessitatibus.', 15, '2007-06-18 13:20:05');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Magnam pariatur dolor dolorum repellat sed consequuntur.', 10, '2022-08-31 06:30:28');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Omnis suscipit magni ab eligendi sapiente.', 6, '2011-09-15 05:45:18');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Reiciendis ut fugit libero maiores.', 20, '1991-10-06 06:02:35');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Repellat corporis nulla incidunt aut itaque impedit.', 16, '1970-11-17 13:02:33');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Sit quia neque voluptas culpa nihil quae sed.', 24, '1992-02-15 12:08:09');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Sit rerum error temporibus est.', 22, '2009-10-23 17:06:12');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Sit similique consectetur saepe mollitia dolores.', 11, '2011-11-22 05:25:01');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Ullam non et ea omnis officiis.', 5, '1994-12-16 18:08:52');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Unde dolorum modi ut voluptatem.', 23, '1991-05-26 23:30:43');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Ut omnis quia aut tempore aut.', 17, '1989-12-15 00:37:54');
INSERT INTO `book_keywords` (`keywords`, `book_id`, `last_update`) VALUES ('Voluptas inventore sit ut praesentium qui.', 7, '2001-02-11 07:23:57');


-- book theme
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('A saepe dignissimos magnam fac', 17, '2002-12-12 10:03:36');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Assumenda amet ratione omnis r', 15, '2020-09-24 14:49:44');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('At consequatur repudiandae ten', 8, '2021-08-30 22:58:44');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Aut harum ea nostrum qui digni', 12, '2019-07-12 15:02:01');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Aut nisi dolorum dolorum molli', 5, '2023-01-15 15:52:04');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Autem delectus ratione dolore ', 2, '1979-06-02 02:11:01');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Consequatur aut qui nostrum ve', 19, '2004-09-12 19:08:26');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Consequatur et ex et sint volu', 10, '2002-12-19 08:01:54');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Et at laboriosam maiores.', 22, '1984-11-25 11:31:03');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Et unde est distinctio volupta', 7, '2019-03-29 07:47:51');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Fuga placeat assumenda aperiam', 9, '2020-06-29 14:28:29');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Iure nemo dolore enim voluptas', 18, '2021-08-21 02:34:02');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Laudantium est quibusdam sed a', 3, '2010-10-29 00:44:40');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Molestiae ipsam non ullam.', 14, '2014-07-29 22:06:17');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Occaecati est assumenda cumque', 20, '2017-06-25 12:20:43');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Omnis sed veniam nisi enim.', 6, '1980-02-05 16:14:01');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Qui ipsa in consequatur hic as', 4, '1990-11-22 05:06:46');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Quia optio dolorum deserunt su', 11, '2011-05-19 18:12:35');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Quod rerum aut alias corporis ', 1, '1980-06-13 17:07:17');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Sed molestiae quibusdam quos e', 16, '1991-01-22 20:53:53');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Sint soluta qui aspernatur vol', 23, '1979-05-06 15:48:32');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Sit commodi voluptates nesciun', 21, '1974-11-14 14:20:36');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Vel reiciendis maxime qui volu', 24, '1992-03-30 09:45:30');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Vel veritatis et et sit.', 25, '2016-05-18 04:05:49');
INSERT INTO `book_theme` (`theme`, `book_id`, `last_update`) VALUES ('Vero ut ut quisquam nam dolore', 13, '2006-08-18 02:58:21');

--reservation
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (1, '2016-04-04', 1, 1, 1, '2016-04-23 12:17:46');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (2, '1979-05-31', 2, 2, 2, '1996-05-09 06:01:59');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (3, '2018-10-08', 3, 3, 3, '1984-01-29 00:32:02');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (4, '1995-11-27', 4, 4, 4, '2023-04-02 09:49:07');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (5, '2022-04-07', 5, 5, 5, '1994-05-06 07:29:00');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (6, '1984-07-26', 6, 6, 1, '2007-10-27 19:38:24');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (7, '2007-03-29', 7, 7, 2, '1979-07-14 04:33:01');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (8, '2002-06-02', 8, 8, 3, '1997-11-27 13:15:15');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (9, '1980-03-16', 9, 9, 4, '1972-08-26 02:42:02');
INSERT INTO `reservation` (`book_id`, `res_date`, `res_id`, `user_id`, `school_id`, `last_update`) VALUES (10, '2010-11-07', 10, 10, 5, '1981-10-01 19:24:32');


-- review
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (1, 1, 1, 2023, '2');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (2, 2, 2, 2023, '3');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (3, 3, 3, 2023, '5');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (4, 4, 4, 2023, '5');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (5, 5, 5, 2023, '3');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (6, 6, 6, 2023, '2');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (7, 7, 7, 2023, '1');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (8, 8, 8, 2023, '4');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (9, 9, 9, 2023, '2');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (10, 10, 10, 2023, '3');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (11, 11, 11, 2023, '2');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (12, 12, 12, 2023, '3');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (13, 13, 13, 2023, '5');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (14, 14, 14, 2023, '2');
INSERT INTO `review` (`rev_id`, `user_id`, `book_id`, `rev_date`, `rating`) VALUES (15, 15, 15, 2023, '3');



