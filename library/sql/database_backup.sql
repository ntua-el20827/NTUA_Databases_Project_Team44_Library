-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `all_schools`
--

DROP TABLE IF EXISTS `all_schools`;
/*!50001 DROP VIEW IF EXISTS `all_schools`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_schools` AS SELECT 
 1 AS `school_id`,
 1 AS `school_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `pages` int(10) unsigned NOT NULL,
  `ISBN` bigint(20) unsigned NOT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `number_of_books` int(10) unsigned NOT NULL,
  `number_of_available_books` int(10) unsigned NOT NULL,
  `book_image` varchar(256) NOT NULL,
  `book_language` varchar(45) DEFAULT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`book_id`),
  KEY `fk_book_school_id` (`school_id`),
  KEY `idx_book_title` (`title`),
  CONSTRAINT `fk_book_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Pride and Prejudice','Stellar Books',400,1234567890,'A classic romance novel exploring themes of societal norms, love, and prejudice in 19th-century England.',1,1,'https://covers.openlibrary.org/b/id/12645114-M.jpg','English',1,'2023-06-08 10:39:53'),(2,'The Catcher in the Rye','BlueSky Publications',320,2345678901,'A coming-of-age novel narrated by an angsty teenager who questions societal conventions and struggles with his own identity.',3,2,'https://covers.openlibrary.org/b/id/6297651-M.jpg','English',1,'2023-06-08 10:39:53'),(3,'The Hobbit','Golden Quill Press',350,3456789012,'An epic fantasy adventure following a hobbit\'s journey to reclaim a stolen treasure, encountering magical creatures and dangers along the way.',5,5,'https://covers.openlibrary.org/b/id/12003329-M.jpg','English',1,'2023-06-08 10:39:53'),(4,'1984','Crimson Ink Publishing',250,9876543210,'A dystopian novel depicting a totalitarian society where individualism is suppressed and critical thought is controlled.',2,1,'https://covers.openlibrary.org/b/id/12054527-M.jpg','English',1,'2023-06-08 10:39:53'),(5,'The Alchemist','HarperOne',208,9780062315007,'A philosophical novel about a young Andalusian shepherd who embarks on a journey to find his personal legend.',1,0,'https://covers.openlibrary.org/b/id/8314135-M.jpg','English',1,'2023-06-08 10:39:53'),(6,'The Great Expectations','Penguin Classics',544,9780141439563,'A coming-of-age novel following the life of Pip, an orphan, as he navigates his way through the social classes of Victorian England.',1,0,'https://covers.openlibrary.org/b/id/13029793-M.jpg','English',1,'2023-06-08 10:39:53'),(7,'To the Lighthouse','Harvest Books',209,9780156907392,'A modernist novel that explores the lives and relationships of the Ramsay family and their guests on a trip to the Isle of Skye.',1,0,'https://covers.openlibrary.org/b/id/8291454-M.jpg','English',1,'2023-06-08 10:39:53'),(8,'Moby-Dick','Harper Perennial',896,9780062085661,'An epic tale of Captain Ahab\'s obsessive quest for revenge against the great white whale.',1,0,'https://covers.openlibrary.org/b/id/110556-M.jpg','English',1,'2023-06-08 10:39:53'),(9,'The Picture of Dorian Gray','Penguin Classics',254,9780141439570,'A Gothic novel about a young man named Dorian Gray, who remains eternally youthful while a portrait of him ages and bears the scars of his immoral actions.',1,0,'https://covers.openlibrary.org/b/id/14314591-M.jpg','English',1,'2023-06-08 10:39:53'),(10,'Frankenstein','Penguin Classics',352,9780141439471,'A science fiction novel exploring the ethical implications of creating artificial life, as Victor Frankenstein brings a creature to life with disastrous consequences.',1,0,'https://covers.openlibrary.org/b/id/109033-M.jpg','English',1,'2023-06-08 10:39:53'),(11,'A Game of Thrones','Bantam Books',694,9780553593716,'The first book in the epic fantasy series \'A Song of Ice and Fire\' that follows the power struggles among noble families in the Seven Kingdoms.',1,0,'https://covers.openlibrary.org/b/id/9269942-M.jpg','English',1,'2023-06-08 10:39:53'),(12,'The Fault in Our Stars','Dutton Books',313,9780525478812,'A young adult novel about two teenagers, Hazel and Gus, who meet and fall in love while dealing with the challenges of living with cancer.',1,0,'https://covers.openlibrary.org/b/id/7890579-M.jpg','English',1,'2023-06-08 10:39:53'),(13,'Gone Girl','Crown Publishing Group',432,9780307588364,'A psychological thriller about a husband, Nick, and his wife, Amy, whose marriage takes a dark turn when Amy goes missing under suspicious circumstances.',1,0,'https://covers.openlibrary.org/b/id/11568078-M.jpg','English',1,'2023-06-08 10:39:53'),(14,'The Chronicles of Narnia','HarperCollins',767,9780066238500,'A series of fantasy novels that transport readers to the magical world of Narnia, where animals talk, mythical creatures abound, and battles between good and evil unfold.',1,0,'https://covers.openlibrary.org/b/id/13236788-M.jpg','English',1,'2023-06-08 10:39:53'),(15,'The Da Vinci Code','Doubleday',454,9780385504201,'A thriller that follows symbologist Robert Langdon as he unravels a complex mystery involving secret societies, hidden messages, and the search for the Holy Grail.',1,0,'https://covers.openlibrary.org/b/id/10520498-M.jpg','English',1,'2023-06-08 10:39:53'),(16,'The Kite Runner','Riverhead Books',371,9781573222457,'A novel about the friendship between Amir, a privileged boy, and Hassan, the son of his father\'s servant, set against the backdrop of Afghanistan\'s tumultuous history.',1,1,'https://covers.openlibrary.org/b/id/12728870-M.jpg','English',1,'2023-06-08 10:39:53'),(17,'The Book Thief','Knopf',550,9780375831003,'Set during World War II, the story follows Liesel Meminger, a young girl who finds solace in books and develops a secret habit of stealing them.',1,1,'https://covers.openlibrary.org/b/id/11478077-M.jpg','English',1,'2023-06-08 10:39:53'),(18,'The Secret Life of Bees','Penguin Books',336,9780142001745,'A coming-of-age novel that explores race, female empowerment, and the power of love as a young girl named Lily Owens finds refuge with a group of beekeeping sisters.',1,1,'https://covers.openlibrary.org/b/id/8066208-M.jpg','English',1,'2023-06-08 10:39:53'),(19,'The Road','Vintage Books',287,9780307387899,'A post-apocalyptic novel that follows a father and his young son as they journey through a desolate landscape, facing danger and despair in search of a better life.',1,0,'https://covers.openlibrary.org/b/id/9557220-M.jpg','English',1,'2023-06-08 10:39:53'),(20,'The Bell Jar','Harper & Row',288,9780060174903,'A semi-autobiographical novel about Esther Greenwood, a talented young woman who struggles with mental health issues and societal expectations in 1950s America.',1,1,'https://covers.openlibrary.org/b/id/13282079-M.jpg','English',1,'2023-06-08 10:39:53'),(21,'The Help','Amy Einhorn Books',451,9780399155345,'Set in the 1960s, the novel explores the complex relationships between African American maids and their white employers in Jackson, Mississippi.',1,1,'https://covers.openlibrary.org/b/id/8589568-M.jpg','English',1,'2023-06-08 10:39:53'),(22,'The Hunger Games','Scholastic Press',374,9780439023481,'The first book in a dystopian trilogy where teenagers from different districts are forced to participate in a televised fight to the death as a form of government control.',1,1,'https://covers.openlibrary.org/b/id/10322358-M.jpg','English',1,'2023-06-08 10:39:53'),(23,'The Da Vinci Code','Sapphire Books',450,1234567890,'A thrilling mystery novel that combines art, history, and religion, following a symbologist in his quest to uncover a hidden secret.',3,3,'https://covers.openlibrary.org/b/id/10520498-M.jpg','English',2,'2023-06-08 10:39:53'),(24,'The Kite Runner','Amber Publishing',400,9876543210,'A powerful story of friendship, betrayal, and redemption set against the backdrop of Afghanistan\'s turbulent history.',5,5,'https://covers.openlibrary.org/b/id/12728870-M.jpg','English',2,'2023-06-08 10:39:53'),(25,'The Book Thief','Moonstone Press',350,2345678901,'Narrated by Death, this extraordinary novel tells the story of a young girl living in Nazi Germany who finds solace in books and words.',2,2,'https://covers.openlibrary.org/b/id/11478077-M.jpg','English',2,'2023-06-08 10:39:53'),(26,'The Secret Life of Bees','Lavender Publishing',320,3456789012,'Set in 1960s South Carolina, this poignant novel explores themes of family, race, and female empowerment as a young girl seeks answers about her mother.',4,4,'https://covers.openlibrary.org/b/id/8066208-M.jpg','English',2,'2023-06-08 10:39:53'),(27,'The Road','Harbor Books',300,4567890123,'A post-apocalyptic tale of a father and son\'s journey through a desolate landscape, exploring themes of survival, love, and hope.',3,2,'https://covers.openlibrary.org/b/id/9557220-M.jpg','English',2,'2023-06-08 10:39:53'),(28,'The Bell Jar','Willow Publishing',380,5678901234,'Semi-autobiographical, this novel follows a young woman\'s descent into mental illness and her struggle for identity in a society that places expectations and limitations on women.',5,4,'https://covers.openlibrary.org/b/id/13282079-M.jpg','English',2,'2023-06-08 10:39:53'),(29,'The Help','Quillfire Books',420,6789012345,'Set in 1960s Mississippi, this novel portrays the lives of American maids and their relationships with white families, challenging racial boundaries and societal norms.',2,1,'https://covers.openlibrary.org/b/id/10544717-M.jpg','English',2,'2023-06-08 10:39:53'),(30,'Alice\'s Adventures in Wonderland','Macmillan Publishers',192,9781509861621,'A whimsical tale of a young girl named Alice who falls down a rabbit hole and encounters strange and fantastical creatures in a topsy-turvy world.',3,3,'https://covers.openlibrary.org/b/OLID/OL31754751M-M.jpg','English',2,'2023-06-08 10:39:53'),(31,'Frankenstein; or, The Modern Prometheus','Lackington, Hughes, Harding, Mavor & Jones',280,9780199537150,'A classic Gothic novel that explores the themes of creation, identity, and the consequences of playing god through the story of Victor Frankenstein and his creature.',2,2,'https://covers.openlibrary.org/b/OLID/OL7092075M-M.jpg','English',2,'2023-06-08 10:39:53'),(32,'The Wonderful Wizard of Oz','George M. Hill Company',154,9781442495926,'A beloved children\'s fantasy novel that follows Dorothy, a young girl from Kansas, as she journeys through the magical Land of Oz with her friends: the Scarecrow, the Tin Woodman, and the Cowardly Lion.',4,4,'https://covers.openlibrary.org/b/OLID/OL7170815M-M.jpg','English',2,'2023-06-08 10:39:53'),(33,'The Lost World','Hodder & Stoughton',320,9780192828585,'A thrilling adventure novel that follows an expedition to a remote South American plateau where prehistoric creatures still roam.',3,2,'https://covers.openlibrary.org/b/OLID/OL22885694M-M.jpg','English',2,'2023-06-08 10:39:53'),(34,'Dracula','Archibald Constable and Company',418,9780192833862,'A Gothic horror novel that introduces the iconic vampire Count Dracula and explores themes of blood, desire, and the battle between good and evil.',4,3,'https://covers.openlibrary.org/b/OLID/OL7075358M-M.jpg','English',2,'2023-06-08 10:39:53'),(35,'Brave New World','Chatto & Windus',311,9780099518471,'A dystopian novel set in a futuristic society that explores themes of technology, social control, and the cost of happiness.',1,0,'https://covers.openlibrary.org/b/OLID/OL6504102M-M.jpg','English',2,'2023-06-08 10:39:53'),(36,'Nineteen Eighty-Four','Secker & Warburg',328,9780141036144,'A dystopian novel set in a totalitarian society where individualism is suppressed and government surveillance is pervasive.',2,2,'https://covers.openlibrary.org/b/OLID/OL21733390M-M.jpg','English',2,'2023-06-08 10:39:53'),(37,'The War of the Worlds','Heinemann',288,9780141441030,'A science fiction novel that depicts a Martian invasion of Earth and explores themes of imperialism, evolution, and humanity\'s resilience.',3,3,'https://covers.openlibrary.org/b/OLID/OL9236546M-M.jpg','English',2,'2023-06-08 10:39:53'),(38,'The Time Machine','William Heinemann',118,9781509827702,'A science fiction novella that follows the Time Traveller as he journeys to the future and encounters the descendants of humanity.',4,4,'https://covers.openlibrary.org/b/OLID/OL8000344M-M.jpg','English',2,'2023-06-08 10:39:53'),(39,'The Poison Belt','Hodder & Stoughton',200,9781434446936,'A science fiction novel that continues the story of Professor Challenger and his companions as they face a new global disaster.',1,1,'https://covers.openlibrary.org/b/OLID/OL14034942M-M.jpg','English',2,'2023-06-08 10:39:53'),(40,'The Invisible Man','C. Arthur Pearson',146,9780141441023,'A science fiction novel that tells the story of a scientist who discovers the secret of invisibility and the consequences that follow.',2,2,'https://covers.openlibrary.org/b/OLID/OL24269941M-M.jpg','English',2,'2023-06-08 10:39:53'),(41,'Vingt mille lieues sous les mers','Pierre-Jules Hetzel',528,9782011556878,'A classic science fiction novel by Jules Verne that follows the adventures of Captain Nemo and his submarine, the Nautilus.',3,3,'https://covers.openlibrary.org/b/OLID/OL24245739M-M.jpg','French',2,'2023-06-08 10:39:53'),(42,'Flatland','Seeley & Co.',100,9780140435317,'A satirical novella that takes place in a two-dimensional world and explores the concept of dimensions and societal hierarchy.',4,4,'https://covers.openlibrary.org/b/OLID/OL23189553M-M.jpg','English',2,'2023-06-08 10:39:53'),(43,'The Secret Agent','Methuen & Co.',272,9780141441580,'A novel that delves into the world of espionage and terrorism in late 19th-century London.',3,3,'https://covers.openlibrary.org/b/OLID/OL2640257M-M.jpg','English',2,'2023-06-08 10:39:53'),(44,'Harry Potter and the Sorcerer\'s Stone','Whimsical Publishing',320,1234567890,'A captivating tale of a young boy who discovers he is a wizard and embarks on a magical journey at Hogwarts School of Witchcraft and Wizardry.',3,3,'https://covers.openlibrary.org/b/id/12903634-M.jpg','English',3,'2023-06-08 10:39:53'),(45,'The Hunger Games','Eagle Books',400,9876543210,'In a dystopian future, teenagers are forced to participate in a televised fight to the death, testing their survival skills and challenging the oppressive regime.',5,5,'https://covers.openlibrary.org/b/id/12646540-M.jpg','English',3,'2023-06-08 10:39:53'),(46,'The Girl with the Dragon Tattoo','Mysterious Press',480,2345678901,'A gripping crime novel that follows a journalist and a talented hacker as they investigate a decades-old disappearance and unravel a web of secrets and violence.',2,2,'https://covers.openlibrary.org/b/id/10655947-M.jpg','English',3,'2023-06-08 10:39:53'),(47,'The Chronicles of Narnia','Enchanted Books',600,6789012345,'A beloved fantasy series that transports readers into a magical world filled with talking animals, mythical creatures, and epic adventures.',2,1,'https://covers.openlibrary.org/b/id/13236788-M.jpg','English',3,'2023-06-08 10:39:53'),(48,'Pride and Prejudice','Enchanting Publications',400,1234567890,'A classic romance novel that explores the societal norms and expectations of 19th-century England, as Elizabeth Bennet navigates love, pride, and prejudice.',3,2,'https://covers.openlibrary.org/b/id/12645114-M.jpg','English',3,'2023-06-08 10:39:53'),(49,'The Catcher in the Rye','Rebel Books',224,9876543210,'A coming-of-age novel that follows the disillusioned teenager Holden Caulfield as he navigates the complexities of adulthood and society.',2,1,'https://covers.openlibrary.org/b/id/6297651-M.jpg','English',3,'2023-06-08 10:39:53'),(50,'The Hobbit','Mystical Press',320,2345678901,'An enchanting adventure that takes readers to the magical world of Middle-earth, following Bilbo Baggins as he embarks on a quest to reclaim a stolen treasure.',4,3,'https://covers.openlibrary.org/b/id/12003329-M.jpg','English',3,'2023-06-08 10:39:53'),(51,'Brave New World','Futuristic Publishing',352,3456789012,'A dystopian novel set in a future where society is engineered for stability and conformity, challenging the notions of individuality, freedom, and the pursuit of happiness.',3,2,'https://covers.openlibrary.org/b/id/12992919-M.jpg','English',3,'2023-06-08 10:39:53'),(52,'The Lord of the Rings','Mythical Books',1200,4567890123,'An epic fantasy trilogy that follows the journey of Frodo Baggins and the Fellowship of the Ring as they strive to destroy the One Ring and defeat the Dark Lord Sauron.',5,5,'https://covers.openlibrary.org/b/id/13911921-M.jpg','English',3,'2023-06-08 10:39:53'),(53,'The Odyssey','Adventurous Press',416,5678901234,'An ancient Greek epic poem that tells the story of Odysseus ten-year journey back home after the Trojan War, encountering mythical creatures and facing numerous challenges along the way.',2,2,'https://covers.openlibrary.org/b/id/13081298-M.jpg','English',3,'2023-06-08 10:39:53'),(54,'A Game of Thrones','Epic Books',800,9876543210,'The first book in the epic fantasy series \"A Song of Ice and Fire,\" where noble families and political intrigue clash in a battle for the Iron Throne.',5,5,'https://covers.openlibrary.org/b/id/9269942-M.jpg','English',3,'2023-06-08 10:39:53'),(55,'The Fault in Our Stars','Starlit Publications',320,2345678901,'A heart-wrenching love story between two teenagers with cancer who embark on a journey of love, friendship, and finding meaning in the face of mortality.',3,3,'https://covers.openlibrary.org/b/id/7890579-M.jpg','English',3,'2023-06-08 10:39:53'),(56,'Gone Girl','Mystery House',400,3456789012,'A psychological thriller that explores the disappearance of a wife and the dark secrets that emerge as her husband becomes the prime suspect.',5,5,'https://covers.openlibrary.org/b/id/11568078-M.jpg','English',3,'2023-06-08 10:39:53'),(57,'Emma','Stellar Books',350,762940815,'A novel by Jane Austen, portraying the life and matchmaking endeavors of Emma Woodhouse in a small English village.',4,4,'https://covers.openlibrary.org/b/OLID/OL13573615M-M.jpg','English',3,'2023-06-08 10:39:53'),(58,'Wuthering Heights','Stellar Books',320,238941657,'A Gothic novel by Emily Bronte, telling the passionate and tragic love story of Heathcliff and Catherine Earnshaw on the Yorkshire moors.',3,3,'https://covers.openlibrary.org/b/OLID/OL38586477M-M.jpg','English',3,'2023-06-08 10:39:53'),(59,'Sense and Sensibility','Stellar Books',380,846291735,'A novel by Jane Austen, following the Dashwood sisters as they navigate love, loss, and societal expectations in Regency-era England.',4,4,'https://covers.openlibrary.org/b/OLID/OL14041582M-M.jpg','English',3,'2023-06-08 10:39:53'),(60,'Northanger Abbey','Stellar Books',300,653128479,'A coming-of-age novel by Jane Austen, featuring Catherine Morland as she experiences love, friendship, and the mysteries of Northanger Abbey.',4,4,'https://covers.openlibrary.org/b/OLID/OL36684152M-M.jpg','English',3,'2023-06-08 10:39:53'),(61,'Ethan Frome','Stellar Books',200,129567834,'A novel by Edith Wharton, set in rural New England and exploring themes of love, duty, and the consequences of repressed emotions.',3,3,'https://covers.openlibrary.org/b/OLID/OL7215847M-M.jpg','English',3,'2023-06-08 10:39:53'),(62,'Uncle Toms Cabin','Stellar Books',450,459283716,'An anti-slavery novel by Harriet Beecher Stowe, portraying the harsh realities of slavery in the United States and its impact on individuals.',4,4,'https://covers.openlibrary.org/b/OLID/OL26244385M-M.jpg','English',3,'2023-06-08 10:39:53'),(63,'Women in Love','Stellar Books',400,935827416,'A novel by D.H. Lawrence, delving into the complex relationships and desires of the Brangwen sisters and their respective partners.',3,3,'https://covers.openlibrary.org/b/OLID/OL14048584M-M.jpg','English',3,'2023-06-08 10:39:53'),(64,'This Side of Paradise','Stellar Books',320,874529361,'A novel by F. Scott Fitzgerald, exploring the life and aspirations of Amory Blaine as he navigates love, success, and disillusionment in post-World War I America.',4,4,'https://covers.openlibrary.org/b/OLID/OL7230180M-M.jpg','English',3,'2023-06-08 10:39:53'),(65,'Heart of Darkness','Stellar Books',200,128465937,'A novella by Joseph Conrad, delving into the dark journey of Charles Marlow as he travels up the Congo River and confronts the heart of human darkness.',3,3,'https://covers.openlibrary.org/b/OLID/OL10277237M-M.jpg','English',3,'2023-06-08 10:39:53'),(66,'The Moonstone','Stellar Books',400,754612839,'A mystery novel by Wilkie Collins, revolving around the theft of a valuable diamond and the subsequent investigation to uncover the truth.',4,4,'https://covers.openlibrary.org/b/OLID/OL11424127M-M.jpg','English',3,'2023-06-08 10:39:53'),(67,'Bible','Stellar Books',1000,6931475208,'A sacred text containing religious scriptures and teachings in various traditions, including Judaism and Christianity.',5,5,'https://covers.openlibrary.org/b/OLID/OL39801870M-M.jpg','English',1,'2023-06-08 10:39:53'),(68,'Adventures of Huckleberry Finn','Stellar Books',350,5192437860,'A classic American novel by Mark Twain that follows the adventures of a young boy named Huckleberry Finn as he escapes from his abusive father and embarks on a journey down the Mississippi River.',2,2,'https://covers.openlibrary.org/b/OLID/OL7062714M-M.jpg','English',1,'2023-06-08 10:39:53'),(69,'Treasure Island','Stellar Books',200,2796450813,'An adventure novel by Robert Louis Stevenson, featuring the story of Jim Hawkins and his encounters with pirates, buried treasure, and swashbuckling adventures.',3,3,'https://covers.openlibrary.org/b/OLID/OL24195201M-M.jpg','English',1,'2023-06-08 10:39:53'),(70,'Sense and Sensibility','Stellar Books',320,4917820365,'A classic novel by Jane Austen, exploring the themes of love, marriage, and societal expectations through the lives of the Dashwood sisters.',4,4,'https://covers.openlibrary.org/b/OLID/OL14041582M-M.jpg','English',1,'2023-06-08 10:39:53'),(71,'A Tale of Two Cities','Stellar Books',450,8319726450,'A historical novel by Charles Dickens set in London and Paris before and during the French Revolution, depicting the struggles and contrasts between the two cities.',3,3,'https://covers.openlibrary.org/b/OLID/OL46835117M-M.jpg','English',1,'2023-06-08 10:39:53'),(72,'A Christmas Carol','Stellar Books',150,5871039426,'A beloved novella by Charles Dickens, telling the story of Ebenezer Scrooge and his transformation after being visited by the ghosts of Christmas past, present, and future.',5,5,'https://covers.openlibrary.org/b/OLID/OL47311368M-M.jpg','English',1,'2023-06-08 10:39:53'),(73,'Little Women','Stellar Books',400,9264350718,'A classic novel by Louisa May Alcott, following the lives of the four March sisters as they navigate love, loss, and the transition to adulthood during the Civil War era.',4,4,'https://covers.openlibrary.org/b/OLID/OL24620928M-M.jpg','English',1,'2023-06-08 10:39:53'),(74,'Oliver Twist','Stellar Books',280,7609231485,'A novel by Charles Dickens, depicting the hardships and adventures of an orphan named Oliver Twist as he navigates the grim streets of Victorian London.',3,3,'https://covers.openlibrary.org/b/OLID/OL47307472M-M.jpg','English',1,'2023-06-08 10:39:53'),(75,'Great Expectations','Stellar Books',380,3715928604,'A novel by Charles Dickens, tracing the life of Pip as he rises from poverty to wealth and navigates the complexities of love, class, and identity in 19th-century England.',4,4,'https://covers.openlibrary.org/b/OLID/OL45791004M-M.jpg','English',1,'2023-06-08 10:39:53'),(76,'El ingenioso hidalgo Don Quijote de la Mancha','Stellar Books',500,3679452180,'A renowned novel by Miguel de Cervantes, narrating the adventures of Don Quixote, a delusional knight-errant, and his loyal squire Sancho Panza.',3,3,'https://covers.openlibrary.org/b/OLID/OL6469521M-M.jpg','Spanish',1,'2023-06-08 10:39:53'),(77,'The Adventures of Sherlock Holmes ','Stellar Books',320,8162945730,'A collection of twelve detective stories featuring the famous detective Sherlock Holmes and his loyal friend Dr. John Watson, written by Sir Arthur Conan Doyle.',4,4,'https://covers.openlibrary.org/b/OLID/OL24349267M-M.jpg','English',1,'2023-06-08 10:39:53'),(78,'The Wonderful Wizard of Oz','Stellar Books',220,4257891630,'A beloved childrens novel by L. Frank Baum, following the adventures of Dorothy Gale and her friends as they journey through the magical Land of Oz.',3,3,'https://covers.openlibrary.org/b/OLID/OL7170815M-M.jpg','English',1,'2023-06-08 10:39:53'),(79,'Adventures of Huckleberry Finn','Stellar Books',350,892634017,'A classic American novel by Mark Twain that follows the adventures of a young boy named Huckleberry Finn as he escapes from his abusive father and embarks on a journey down the Mississippi River.',3,3,'https://covers.openlibrary.org/b/OLID/OL7062714M-M.jpg','English',2,'2023-06-08 10:39:53'),(80,'Treasure Island','Stellar Books',200,761234590,'An adventure novel by Robert Louis Stevenson, featuring the story of Jim Hawkins and his encounters with pirates, buried treasure, and swashbuckling adventures.',4,4,'https://covers.openlibrary.org/b/OLID/OL24195201M-M.jpg','English',2,'2023-06-08 10:39:53'),(81,'Moby Dick','Stellar Books',600,123459876,'A novel by Herman Melville, portraying the obsessive hunt for the great white whale, Moby Dick, and exploring themes of obsession, fate, and the nature of humanity.',2,2,'https://covers.openlibrary.org/b/OLID/OL6984724M-M.jpg','English',2,'2023-06-08 10:39:53'),(82,'Robinson Crusoe','Stellar Books',320,135792468,'A novel by Daniel Defoe, recounting the tale of Robinson Crusoe, a shipwreck survivor who spends years on a deserted island, facing challenges and reflecting on themes of survival, isolation, and faith.',3,3,'https://covers.openlibrary.org/b/OLID/OL24144374M-M.jpg','English',2,'2023-06-08 10:39:53'),(83,'The Call of the Wild','Stellar Books',240,987654321,'A novel by Jack London, telling the story of Buck, a domesticated dog who is thrust into the harsh world of the Yukon during the Klondike Gold Rush and discovers his primal instincts.',4,4,'https://covers.openlibrary.org/b/OLID/OL23283734M-M.jpg','English',2,'2023-06-08 10:39:53'),(84,'Harry Potter and the Philosophers Stone','Stellar Books',320,759318246,'The first book in the Harry Potter series by J.K. Rowling, following the magical journey of Harry Potter as he discovers his true identity and begins his education at Hogwarts School of Witchcraft and Wizardry.',5,5,'https://covers.openlibrary.org/b/OLID/OL22856696M-M.jpg','English',2,'2023-06-08 10:39:53'),(85,'Harry Potter and the Chamber of Secrets','Stellar Books',400,432157896,'The second book in the Harry Potter series by J.K. Rowling, featuring Harry Potters second year at Hogwarts and his encounter with the mysterious Chamber of Secrets.',3,3,'https://covers.openlibrary.org/b/OLID/OL26594474M-M.jpg','English',2,'2023-06-08 10:39:53'),(86,'Harry Potter and the Goblet of Fire','Stellar Books',600,567893214,'The fourth book in the Harry Potter series by J.K. Rowling, where Harry Potter competes in the Triwizard Tournament and faces the rise of Lord Voldemort.',4,4,'https://covers.openlibrary.org/b/OLID/OL25683482M-M.jpg','English',2,'2023-06-08 10:39:53'),(87,'The Lion, the Witch and the Wardrobe','Stellar Books',250,321459876,'The first book in The Chronicles of Narnia series by C.S. Lewis, taking readers to the magical land of Narnia where four siblings discover their destinies and help bring an end to the eternal winter enforced by the White Witch.',3,3,'https://covers.openlibrary.org/b/OLID/OL7265111M-M.jpg','English',2,'2023-06-08 10:39:53'),(88,'Northern Lights','Stellar Books',320,963258741,'The first book in the His Dark Materials trilogy by Philip Pullman, following the adventures of Lyra Belacqua in a parallel world where she uncovers dark secrets and battles against powerful forces.',3,3,'https://covers.openlibrary.org/b/OLID/OL9731031M-M.jpg','English',2,'2023-06-08 10:39:53'),(89,'Hamlet','Stellar Books',200,956241378,'A tragedy by William Shakespeare, depicting the internal struggle and revenge of Prince Hamlet after his fathers murder, exploring themes of mortality, madness, and moral ambiguity.',4,4,'https://covers.openlibrary.org/b/OLID/OL26587990M-M.jpg','English',3,'2023-06-08 10:39:53'),(90,'Great Expectations','Stellar Books',450,832159467,'A novel by Charles Dickens, following the life of Pip, an orphan who dreams of becoming a gentleman, and his encounters with a mysterious benefactor and the enigmatic Miss Havisham.',5,5,'https://covers.openlibrary.org/b/OLID/OL45791004M-M.jpg','English',3,'2023-06-08 10:39:53'),(91,'The Great Gatsby','Stellar Books',250,498276135,'A novel by F. Scott Fitzgerald, set in the Jazz Age of 1920s America, portraying the glittering yet empty lives of the wealthy and the ill-fated love story of Jay Gatsby and Daisy Buchanan.',4,4,'https://covers.openlibrary.org/b/OLID/OL22570129M-M.jpg','English',3,'2023-06-08 10:39:53'),(92,'Ὀδύσσεια (Odyssey)','Stellar Books',500,713824569,'An epic poem attributed to Homer, telling the story of Odysseus and his perilous journey home after the Trojan War, encountering mythical creatures, gods, and facing numerous challenges.',3,3,'https://covers.openlibrary.org/b/OLID/OL23305280M-M.jpg','English',3,'2023-06-08 10:39:53'),(93,'Romeo and Juliet','Stellar Books',150,479123856,'A tragedy by William Shakespeare, portraying the passionate love and tragic fate of Romeo and Juliet, two young star-crossed lovers from feuding families.',5,5,'https://covers.openlibrary.org/b/OLID/OL26501367M-M.jpg','English',3,'2023-06-08 10:39:53'),(94,'Macbeth','Stellar Books',180,614259837,'A tragedy by William Shakespeare, delving into the consequences of ambition and the corrupting nature of power, as Macbeth and Lady Macbeth plot and scheme to fulfill their desires.',4,4,'https://covers.openlibrary.org/b/OLID/OL25922468M-M.jpg','English',3,'2023-06-08 10:39:53'),(95,'The Last of the Mohicans','Stellar Books',320,935768412,'A historical novel by James Fenimore Cooper, set during the French and Indian War, following the adventures of Hawkeye and his encounters with Native American tribes.',3,3,'https://covers.openlibrary.org/b/OLID/OL7165874M-M.jpg','English',3,'2023-06-08 10:39:53'),(96,'Tempest','Stellar Books',200,826451937,'A play by William Shakespeare, centering around Prospero, the rightful Duke of Milan, who uses his magic to orchestrate a shipwreck and seek revenge on his enemies.',3,3,'https://covers.openlibrary.org/b/OLID/OL16982543M-M.jpg','English',3,'2023-06-08 10:39:53'),(97,'The Merchant of Venice','Stellar Books',220,572913846,'A play by William Shakespeare, exploring themes of justice, prejudice, and mercy, as the merchant Antonio borrows money from Shylock and faces a harrowing legal dispute.',4,4,'https://covers.openlibrary.org/b/OLID/OL25398118M-M.jpg','English',3,'2023-06-08 10:39:53'),(98,'Dracula','Stellar Books',400,375618429,'A gothic horror novel by Bram Stoker, introducing the iconic vampire Count Dracula and the battle between him and a group of individuals led by Professor Abraham Van Helsing.',5,5,'https://covers.openlibrary.org/b/OLID/OL7075358M-M.jpg','English',3,'2023-06-08 10:39:53'),(99,'The Princess and the Goblin','Stellar Books',240,528716934,'A childrens fantasy novel by George MacDonald, following the adventures of a young princess and a young miner as they confront goblins and overcome challenges.',3,3,'https://covers.openlibrary.org/b/OLID/OL7544575M-M.jpg','English',3,'2023-06-08 10:39:53'),(100,'Le avventure di Pinocchio','Stellar Books',200,912378645,'A classic Italian childrens novel by Carlo Collodi, narrating the adventures of Pinocchio, a wooden puppet who aspires to become a real boy.',4,4,'https://covers.openlibrary.org/b/OLID/OL27004449M-M.jpg','Italian',3,'2023-06-08 10:39:53'),(101,'The Story of the Amulet','Stellar Books',320,498253617,'A fantasy novel by E. Nesbit, featuring a group of children who go on magical adventures through time with the help of a mysterious amulet.',3,3,'https://covers.openlibrary.org/b/OLID/OL17139068M-M.jpg','English',3,'2023-06-08 10:39:53'),(102,'The Marvelous Land of Oz','Stellar Books',260,357962481,'A childrens novel by L. Frank Baum, continuing the adventures in the Land of Oz as a boy named Tip encounters new characters and faces unexpected challenges.',4,4,'https://covers.openlibrary.org/b/OLID/OL7244470M-M.jpg','English',3,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `author` varchar(50) NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`author`,`book_id`),
  KEY `fk_book_author_book_id` (`book_id`),
  KEY `idx_book_author_author` (`author`),
  CONSTRAINT `fk_book_author_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES ('Aldous Huxley',35,'2023-06-08 10:39:53'),('Aldous Huxley',51,'2023-06-08 10:39:53'),('Arthur Conan Doyle',33,'2023-06-08 10:39:53'),('Arthur Conan Doyle',39,'2023-06-08 10:39:53'),('Arthur Conan Doyle',77,'2023-06-08 10:39:53'),('Bram Stoker',34,'2023-06-08 10:39:53'),('Bram Stoker',98,'2023-06-08 10:39:53'),('C.S. Lewis',14,'2023-06-08 10:39:53'),('C.S. Lewis',47,'2023-06-08 10:39:53'),('C.S. Lewis',87,'2023-06-08 10:39:53'),('Carlo Collodi',100,'2023-06-08 10:39:53'),('Charles Dickens',6,'2023-06-08 10:39:53'),('Charles Dickens',39,'2023-06-08 10:39:53'),('Charles Dickens',71,'2023-06-08 10:39:53'),('Charles Dickens',72,'2023-06-08 10:39:53'),('Charles Dickens',74,'2023-06-08 10:39:53'),('Charles Dickens',75,'2023-06-08 10:39:53'),('Charles Dickens',90,'2023-06-08 10:39:53'),('Charlotte Bronte',58,'2023-06-08 10:39:53'),('Cormac McCarthy',19,'2023-06-08 10:39:53'),('Cormac McCarthy',27,'2023-06-08 10:39:53'),('D.H. Lawrence',42,'2023-06-08 10:39:53'),('D.H. Lawrence',63,'2023-06-08 10:39:53'),('Dan Brown',15,'2023-06-08 10:39:53'),('Dan Brown',23,'2023-06-08 10:39:53'),('Daniel Defoe',82,'2023-06-08 10:39:53'),('E. Nesbit',101,'2023-06-08 10:39:53'),('Edith Wharton',31,'2023-06-08 10:39:53'),('Edith Wharton',61,'2023-06-08 10:39:53'),('Edith Wharton',62,'2023-06-08 10:39:53'),('Edith Wharton',63,'2023-06-08 10:39:53'),('Edith Wharton',64,'2023-06-08 10:39:53'),('Edith Wharton',65,'2023-06-08 10:39:53'),('Edith Wharton',66,'2023-06-08 10:39:53'),('Edwin A. Abbott',42,'2023-06-08 10:39:53'),('Emily Bronte',58,'2023-06-08 10:39:53'),('F. Scott Fitzgerald',23,'2023-06-08 10:39:53'),('F. Scott Fitzgerald',64,'2023-06-08 10:39:53'),('F. Scott Fitzgerald',91,'2023-06-08 10:39:53'),('George MacDonald',99,'2023-06-08 10:39:53'),('George Orwell',4,'2023-06-08 10:39:53'),('George R.R. Martin',11,'2023-06-08 10:39:53'),('George R.R. Martin',54,'2023-06-08 10:39:53'),('Gillian Flynn',13,'2023-06-08 10:39:53'),('Gillian Flynn',56,'2023-06-08 10:39:53'),('H.G. Wells',36,'2023-06-08 10:39:53'),('H.G. Wells',37,'2023-06-08 10:39:53'),('H.G. Wells',38,'2023-06-08 10:39:53'),('H.G. Wells',40,'2023-06-08 10:39:53'),('Harriet Beecher Stowe',47,'2023-06-08 10:39:53'),('Harriet Beecher Stowe',62,'2023-06-08 10:39:53'),('Herman Melville',8,'2023-06-08 10:39:53'),('Herman Melville',81,'2023-06-08 10:39:53'),('Homer',53,'2023-06-08 10:39:53'),('Homer',92,'2023-06-08 10:39:53'),('J.D. Salinger',2,'2023-06-08 10:39:53'),('J.D. Salinger',49,'2023-06-08 10:39:53'),('J.K. Rowling',44,'2023-06-08 10:39:53'),('J.K. Rowling',84,'2023-06-08 10:39:53'),('J.K. Rowling',85,'2023-06-08 10:39:53'),('J.K. Rowling',86,'2023-06-08 10:39:53'),('J.R.R. Tolkien',3,'2023-06-08 10:39:53'),('J.R.R. Tolkien',50,'2023-06-08 10:39:53'),('J.R.R. Tolkien',52,'2023-06-08 10:39:53'),('Jack London',83,'2023-06-08 10:39:53'),('James Fenimore Cooper',95,'2023-06-08 10:39:53'),('Jane Austen',1,'2023-06-08 10:39:53'),('Jane Austen',33,'2023-06-08 10:39:53'),('Jane Austen',48,'2023-06-08 10:39:53'),('Jane Austen',57,'2023-06-08 10:39:53'),('Jane Austen',59,'2023-06-08 10:39:53'),('Jane Austen',60,'2023-06-08 10:39:53'),('Jane Austen',70,'2023-06-08 10:39:53'),('John Green',12,'2023-06-08 10:39:53'),('John Green',55,'2023-06-08 10:39:53'),('Joseph Conrad',28,'2023-06-08 10:39:53'),('Joseph Conrad',43,'2023-06-08 10:39:53'),('Joseph Conrad',65,'2023-06-08 10:39:53'),('Jules Verne',41,'2023-06-08 10:39:53'),('Kathryn Stockett',21,'2023-06-08 10:39:53'),('Kathryn Stockett',29,'2023-06-08 10:39:53'),('Khaled Hosseini',16,'2023-06-08 10:39:53'),('Khaled Hosseini',24,'2023-06-08 10:39:53'),('L. Frank Baum',32,'2023-06-08 10:39:53'),('L. Frank Baum',78,'2023-06-08 10:39:53'),('L. Frank Baum',102,'2023-06-08 10:39:53'),('Lewis Carroll',30,'2023-06-08 10:39:53'),('Louisa May Alcott',73,'2023-06-08 10:39:53'),('Mark Twain',49,'2023-06-08 10:39:53'),('Mark Twain',68,'2023-06-08 10:39:53'),('Mark Twain',79,'2023-06-08 10:39:53'),('Markus Zusak',17,'2023-06-08 10:39:53'),('Markus Zusak',25,'2023-06-08 10:39:53'),('Mary Shelley',10,'2023-06-08 10:39:53'),('Mary Shelley',31,'2023-06-08 10:39:53'),('Miguel de Cervantes',76,'2023-06-08 10:39:53'),('Multiple Authors',45,'2023-06-08 10:39:53'),('Multiple Authors',67,'2023-06-08 10:39:53'),('Oscar Wilde',9,'2023-06-08 10:39:53'),('Paulo Coelho',5,'2023-06-08 10:39:53'),('Philip Pullman',88,'2023-06-08 10:39:53'),('Robert Louis Stevenson',26,'2023-06-08 10:39:53'),('Robert Louis Stevenson',69,'2023-06-08 10:39:53'),('Robert Louis Stevenson',80,'2023-06-08 10:39:53'),('Stieg Larsson',46,'2023-06-08 10:39:53'),('Sue Monk Kidd',18,'2023-06-08 10:39:53'),('Sue Monk Kidd',26,'2023-06-08 10:39:53'),('Suzanne Collins',22,'2023-06-08 10:39:53'),('Suzanne Collins',45,'2023-06-08 10:39:53'),('Sylvia Plath',20,'2023-06-08 10:39:53'),('Sylvia Plath',28,'2023-06-08 10:39:53'),('Virginia Woolf',7,'2023-06-08 10:39:53'),('Wilkie Collins',37,'2023-06-08 10:39:53'),('Wilkie Collins',66,'2023-06-08 10:39:53'),('William Shakespeare',89,'2023-06-08 10:39:53'),('William Shakespeare',93,'2023-06-08 10:39:53'),('William Shakespeare',94,'2023-06-08 10:39:53'),('William Shakespeare',96,'2023-06-08 10:39:53'),('William Shakespeare',97,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_keywords`
--

DROP TABLE IF EXISTS `book_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_keywords` (
  `keywords` varchar(50) NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`keywords`,`book_id`),
  KEY `fk_book_keywords_book_id` (`book_id`),
  CONSTRAINT `fk_book_keywords_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_keywords`
--

LOCK TABLES `book_keywords` WRITE;
/*!40000 ALTER TABLE `book_keywords` DISABLE KEYS */;
INSERT INTO `book_keywords` VALUES ('19th century',1,'2023-06-08 10:39:53'),('abolitionism',62,'2023-06-08 10:39:53'),('adventure',3,'2023-06-08 10:39:53'),('adventure',14,'2023-06-08 10:39:53'),('adventure',32,'2023-06-08 10:39:53'),('adventure',33,'2023-06-08 10:39:53'),('adventure',41,'2023-06-08 10:39:53'),('adventure',44,'2023-06-08 10:39:53'),('adventure',47,'2023-06-08 10:39:53'),('adventure',50,'2023-06-08 10:39:53'),('adventure',52,'2023-06-08 10:39:53'),('adventure',53,'2023-06-08 10:39:53'),('adventure',68,'2023-06-08 10:39:53'),('adventure',69,'2023-06-08 10:39:53'),('adventure',76,'2023-06-08 10:39:53'),('adventure',78,'2023-06-08 10:39:53'),('adventure',79,'2023-06-08 10:39:53'),('adventure',80,'2023-06-08 10:39:53'),('adventure',83,'2023-06-08 10:39:53'),('adventure',87,'2023-06-08 10:39:53'),('adventure',92,'2023-06-08 10:39:53'),('adventure',99,'2023-06-08 10:39:53'),('adventure',100,'2023-06-08 10:39:53'),('adventure',102,'2023-06-08 10:39:53'),('aestheticism',9,'2023-06-08 10:39:53'),('Afghanistan',16,'2023-06-08 10:39:53'),('Afghanistan',24,'2023-06-08 10:39:53'),('alien invasion',37,'2023-06-08 10:39:53'),('alienation',2,'2023-06-08 10:39:53'),('alienation',49,'2023-06-08 10:39:53'),('allegory',5,'2023-06-08 10:39:53'),('ambition',6,'2023-06-08 10:39:53'),('ambition',31,'2023-06-08 10:39:53'),('ambition',75,'2023-06-08 10:39:53'),('ambition',90,'2023-06-08 10:39:53'),('ambition',94,'2023-06-08 10:39:53'),('American Dream',91,'2023-06-08 10:39:53'),('anarchism',43,'2023-06-08 10:39:53'),('apocalypse',39,'2023-06-08 10:39:53'),('art',15,'2023-06-08 10:39:53'),('art',23,'2023-06-08 10:39:53'),('autobiographical',20,'2023-06-08 10:39:53'),('autobiographical',28,'2023-06-08 10:39:53'),('beekeeping',18,'2023-06-08 10:39:53'),('beekeeping',26,'2023-06-08 10:39:53'),('bildungsroman',6,'2023-06-08 10:39:53'),('books',17,'2023-06-08 10:39:53'),('books',25,'2023-06-08 10:39:53'),('cancer',12,'2023-06-08 10:39:53'),('cancer',55,'2023-06-08 10:39:53'),('children',14,'2023-06-08 10:39:53'),('children',30,'2023-06-08 10:39:53'),('children',100,'2023-06-08 10:39:53'),('children',101,'2023-06-08 10:39:53'),('children',102,'2023-06-08 10:39:53'),('chivalry',76,'2023-06-08 10:39:53'),('Christmas',72,'2023-06-08 10:39:53'),('civil rights',21,'2023-06-08 10:39:53'),('civil rights',29,'2023-06-08 10:39:53'),('class',75,'2023-06-08 10:39:53'),('class',90,'2023-06-08 10:39:53'),('classics',48,'2023-06-08 10:39:53'),('colonialism',65,'2023-06-08 10:39:53'),('comedy',57,'2023-06-08 10:39:53'),('coming of age',2,'2023-06-08 10:39:53'),('coming of age',16,'2023-06-08 10:39:53'),('coming of age',20,'2023-06-08 10:39:53'),('coming of age',24,'2023-06-08 10:39:53'),('coming of age',28,'2023-06-08 10:39:53'),('coming of age',49,'2023-06-08 10:39:53'),('coming of age',64,'2023-06-08 10:39:53'),('coming of age',73,'2023-06-08 10:39:53'),('conspiracy',15,'2023-06-08 10:39:53'),('conspiracy',23,'2023-06-08 10:39:53'),('corruption',9,'2023-06-08 10:39:53'),('creation',10,'2023-06-08 10:39:53'),('creation',31,'2023-06-08 10:39:53'),('crime',46,'2023-06-08 10:39:53'),('crime',77,'2023-06-08 10:39:53'),('darkness',65,'2023-06-08 10:39:53'),('depression',20,'2023-06-08 10:39:53'),('depression',28,'2023-06-08 10:39:53'),('desolation',19,'2023-06-08 10:39:53'),('desolation',27,'2023-06-08 10:39:53'),('destiny',5,'2023-06-08 10:39:53'),('detective',66,'2023-06-08 10:39:53'),('detective',77,'2023-06-08 10:39:53'),('dimension',42,'2023-06-08 10:39:53'),('dinosaurs',33,'2023-06-08 10:39:53'),('disaster',39,'2023-06-08 10:39:53'),('dog',83,'2023-06-08 10:39:53'),('dragon',50,'2023-06-08 10:39:53'),('dragons',54,'2023-06-08 10:39:53'),('dust',88,'2023-06-08 10:39:53'),('dwarves',3,'2023-06-08 10:39:53'),('dystopian',4,'2023-06-08 10:39:53'),('dystopian',22,'2023-06-08 10:39:53'),('dystopian',35,'2023-06-08 10:39:53'),('dystopian',36,'2023-06-08 10:39:53'),('dystopian',45,'2023-06-08 10:39:53'),('dystopian',51,'2023-06-08 10:39:53'),('empowerment',21,'2023-06-08 10:39:53'),('empowerment',29,'2023-06-08 10:39:53'),('epic',11,'2023-06-08 10:39:53'),('epic',52,'2023-06-08 10:39:53'),('epic',53,'2023-06-08 10:39:53'),('epic',54,'2023-06-08 10:39:53'),('epic',92,'2023-06-08 10:39:53'),('espionage',43,'2023-06-08 10:39:53'),('eternal youth',9,'2023-06-08 10:39:53'),('evolution',38,'2023-06-08 10:39:53'),('exploration',33,'2023-06-08 10:39:53'),('exploration',41,'2023-06-08 10:39:53'),('fairy tale',99,'2023-06-08 10:39:53'),('faith',67,'2023-06-08 10:39:53'),('family',18,'2023-06-08 10:39:53'),('family',26,'2023-06-08 10:39:53'),('family',59,'2023-06-08 10:39:53'),('family',70,'2023-06-08 10:39:53'),('family',73,'2023-06-08 10:39:53'),('family dynamics',7,'2023-06-08 10:39:53'),('fantasy',3,'2023-06-08 10:39:53'),('fantasy',11,'2023-06-08 10:39:53'),('fantasy',14,'2023-06-08 10:39:53'),('fantasy',30,'2023-06-08 10:39:53'),('fantasy',32,'2023-06-08 10:39:53'),('fantasy',44,'2023-06-08 10:39:53'),('fantasy',47,'2023-06-08 10:39:53'),('fantasy',50,'2023-06-08 10:39:53'),('fantasy',52,'2023-06-08 10:39:53'),('fantasy',54,'2023-06-08 10:39:53'),('fantasy',78,'2023-06-08 10:39:53'),('fantasy',84,'2023-06-08 10:39:53'),('fantasy',85,'2023-06-08 10:39:53'),('fantasy',86,'2023-06-08 10:39:53'),('fantasy',87,'2023-06-08 10:39:53'),('fantasy',88,'2023-06-08 10:39:53'),('fantasy',99,'2023-06-08 10:39:53'),('fantasy',102,'2023-06-08 10:39:53'),('father and son',19,'2023-06-08 10:39:53'),('father and son',27,'2023-06-08 10:39:53'),('feud',93,'2023-06-08 10:39:53'),('fight to the death',45,'2023-06-08 10:39:53'),('French Revolution',71,'2023-06-08 10:39:53'),('friendship',12,'2023-06-08 10:39:53'),('friendship',16,'2023-06-08 10:39:53'),('friendship',24,'2023-06-08 10:39:53'),('friendship',55,'2023-06-08 10:39:53'),('friendship',68,'2023-06-08 10:39:53'),('friendship',79,'2023-06-08 10:39:53'),('frontier',95,'2023-06-08 10:39:53'),('future',38,'2023-06-08 10:39:53'),('ghosts',72,'2023-06-08 10:39:53'),('gothic',10,'2023-06-08 10:39:53'),('gothic',31,'2023-06-08 10:39:53'),('gothic',34,'2023-06-08 10:39:53'),('gothic',58,'2023-06-08 10:39:53'),('gothic',60,'2023-06-08 10:39:53'),('gothic',98,'2023-06-08 10:39:53'),('government control',22,'2023-06-08 10:39:53'),('Greek mythology',92,'2023-06-08 10:39:53'),('guilt',94,'2023-06-08 10:39:53'),('hacker',46,'2023-06-08 10:39:53'),('historical fiction',17,'2023-06-08 10:39:53'),('historical fiction',25,'2023-06-08 10:39:53'),('historical fiction',71,'2023-06-08 10:39:53'),('historical fiction',95,'2023-06-08 10:39:53'),('horror',34,'2023-06-08 10:39:53'),('horror',98,'2023-06-08 10:39:53'),('identity',10,'2023-06-08 10:39:53'),('identity',49,'2023-06-08 10:39:53'),('imagination',30,'2023-06-08 10:39:53'),('inheritance',75,'2023-06-08 10:39:53'),('inheritance',90,'2023-06-08 10:39:53'),('interplanetary',37,'2023-06-08 10:39:53'),('intrigue',11,'2023-06-08 10:39:53'),('invisibility',40,'2023-06-08 10:39:53'),('island',82,'2023-06-08 10:39:53'),('journey',32,'2023-06-08 10:39:53'),('journey',53,'2023-06-08 10:39:53'),('justice',97,'2023-06-08 10:39:53'),('London',74,'2023-06-08 10:39:53'),('lost generation',64,'2023-06-08 10:39:53'),('love',93,'2023-06-08 10:39:53'),('love triangle',61,'2023-06-08 10:39:53'),('mad scientist',40,'2023-06-08 10:39:53'),('madness',89,'2023-06-08 10:39:53'),('magic',14,'2023-06-08 10:39:53'),('magic',32,'2023-06-08 10:39:53'),('magic',44,'2023-06-08 10:39:53'),('magic',47,'2023-06-08 10:39:53'),('magic',78,'2023-06-08 10:39:53'),('magic',84,'2023-06-08 10:39:53'),('magic',85,'2023-06-08 10:39:53'),('magic',86,'2023-06-08 10:39:53'),('magic',87,'2023-06-08 10:39:53'),('magic',96,'2023-06-08 10:39:53'),('magic',101,'2023-06-08 10:39:53'),('man vs. nature',8,'2023-06-08 10:39:53'),('marriage',1,'2023-06-08 10:39:53'),('marriage',13,'2023-06-08 10:39:53'),('marriage',48,'2023-06-08 10:39:53'),('marriage',56,'2023-06-08 10:39:53'),('Martians',37,'2023-06-08 10:39:53'),('matchmaking',57,'2023-06-08 10:39:53'),('mathematical fiction',42,'2023-06-08 10:39:53'),('mental health',20,'2023-06-08 10:39:53'),('mental health',28,'2023-06-08 10:39:53'),('modernism',63,'2023-06-08 10:39:53'),('modernist',7,'2023-06-08 10:39:53'),('morality',9,'2023-06-08 10:39:53'),('morality',100,'2023-06-08 10:39:53'),('mystery',13,'2023-06-08 10:39:53'),('mystery',15,'2023-06-08 10:39:53'),('mystery',23,'2023-06-08 10:39:53'),('mystery',46,'2023-06-08 10:39:53'),('mystery',56,'2023-06-08 10:39:53'),('mystery',66,'2023-06-08 10:39:53'),('mystery',77,'2023-06-08 10:39:53'),('mythology',53,'2023-06-08 10:39:53'),('Native Americans',95,'2023-06-08 10:39:53'),('New England',61,'2023-06-08 10:39:53'),('nonsense',30,'2023-06-08 10:39:53'),('obsession',8,'2023-06-08 10:39:53'),('obsession',40,'2023-06-08 10:39:53'),('obsession',58,'2023-06-08 10:39:53'),('obsession',81,'2023-06-08 10:39:53'),('orphan',74,'2023-06-08 10:39:53'),('parallel universe',88,'2023-06-08 10:39:53'),('parody',60,'2023-06-08 10:39:53'),('personal legend',5,'2023-06-08 10:39:53'),('pirates',69,'2023-06-08 10:39:53'),('pirates',80,'2023-06-08 10:39:53'),('play',96,'2023-06-08 10:39:53'),('play',97,'2023-06-08 10:39:53'),('political intrigue',54,'2023-06-08 10:39:53'),('political thriller',43,'2023-06-08 10:39:53'),('politics',11,'2023-06-08 10:39:53'),('post-apocalyptic',19,'2023-06-08 10:39:53'),('post-apocalyptic',27,'2023-06-08 10:39:53'),('poverty',74,'2023-06-08 10:39:53'),('prehistoric',33,'2023-06-08 10:39:53'),('prejudice',97,'2023-06-08 10:39:53'),('psychological',56,'2023-06-08 10:39:53'),('psychological',65,'2023-06-08 10:39:53'),('quest',3,'2023-06-08 10:39:53'),('quest',50,'2023-06-08 10:39:53'),('quest',52,'2023-06-08 10:39:53'),('race',18,'2023-06-08 10:39:53'),('race',26,'2023-06-08 10:39:53'),('racial injustice',62,'2023-06-08 10:39:53'),('racial segregation',21,'2023-06-08 10:39:53'),('racial segregation',29,'2023-06-08 10:39:53'),('racism',68,'2023-06-08 10:39:53'),('racism',79,'2023-06-08 10:39:53'),('rebellion',2,'2023-06-08 10:39:53'),('rebellion',22,'2023-06-08 10:39:53'),('rebellion',45,'2023-06-08 10:39:53'),('redemption',16,'2023-06-08 10:39:53'),('redemption',24,'2023-06-08 10:39:53'),('redemption',72,'2023-06-08 10:39:53'),('regency',59,'2023-06-08 10:39:53'),('relationships',63,'2023-06-08 10:39:53'),('religion',15,'2023-06-08 10:39:53'),('religion',23,'2023-06-08 10:39:53'),('religion',67,'2023-06-08 10:39:53'),('revenge',8,'2023-06-08 10:39:53'),('revenge',58,'2023-06-08 10:39:53'),('revenge',81,'2023-06-08 10:39:53'),('revenge',89,'2023-06-08 10:39:53'),('revolution',71,'2023-06-08 10:39:53'),('romance',1,'2023-06-08 10:39:53'),('romance',12,'2023-06-08 10:39:53'),('romance',48,'2023-06-08 10:39:53'),('romance',55,'2023-06-08 10:39:53'),('romance',57,'2023-06-08 10:39:53'),('romance',58,'2023-06-08 10:39:53'),('romance',59,'2023-06-08 10:39:53'),('romance',60,'2023-06-08 10:39:53'),('romance',70,'2023-06-08 10:39:53'),('romance',91,'2023-06-08 10:39:53'),('satire',42,'2023-06-08 10:39:53'),('satire',60,'2023-06-08 10:39:53'),('satire',76,'2023-06-08 10:39:53'),('science fiction',10,'2023-06-08 10:39:53'),('science fiction',31,'2023-06-08 10:39:53'),('science fiction',37,'2023-06-08 10:39:53'),('science fiction',38,'2023-06-08 10:39:53'),('science fiction',39,'2023-06-08 10:39:53'),('science fiction',40,'2023-06-08 10:39:53'),('self-discovery',5,'2023-06-08 10:39:53'),('sexuality',63,'2023-06-08 10:39:53'),('shipwreck',96,'2023-06-08 10:39:53'),('sisters',59,'2023-06-08 10:39:53'),('sisters',70,'2023-06-08 10:39:53'),('sisters',73,'2023-06-08 10:39:53'),('slavery',62,'2023-06-08 10:39:53'),('social class',1,'2023-06-08 10:39:53'),('social commentary',42,'2023-06-08 10:39:53'),('social commentary',48,'2023-06-08 10:39:53'),('social engineering',35,'2023-06-08 10:39:53'),('social engineering',51,'2023-06-08 10:39:53'),('social status',6,'2023-06-08 10:39:53'),('society',57,'2023-06-08 10:39:53'),('solitude',82,'2023-06-08 10:39:53'),('South Carolina',18,'2023-06-08 10:39:53'),('South Carolina',26,'2023-06-08 10:39:53'),('Southern United States',21,'2023-06-08 10:39:53'),('Southern United States',29,'2023-06-08 10:39:53'),('spirituality',67,'2023-06-08 10:39:53'),('stolen diamond',66,'2023-06-08 10:39:53'),('stream of consciousness',7,'2023-06-08 10:39:53'),('submarine',41,'2023-06-08 10:39:53'),('supernatural',34,'2023-06-08 10:39:53'),('surveillance',4,'2023-06-08 10:39:53'),('surveillance',36,'2023-06-08 10:39:53'),('survival',19,'2023-06-08 10:39:53'),('survival',22,'2023-06-08 10:39:53'),('survival',27,'2023-06-08 10:39:53'),('survival',39,'2023-06-08 10:39:53'),('survival',45,'2023-06-08 10:39:53'),('survival',82,'2023-06-08 10:39:53'),('suspense',13,'2023-06-08 10:39:53'),('symbolism',7,'2023-06-08 10:39:53'),('talking animals',47,'2023-06-08 10:39:53'),('technological control',35,'2023-06-08 10:39:53'),('technological control',51,'2023-06-08 10:39:53'),('teenage angst',2,'2023-06-08 10:39:53'),('terrorism',43,'2023-06-08 10:39:53'),('theft',17,'2023-06-08 10:39:53'),('theft',25,'2023-06-08 10:39:53'),('thought control',4,'2023-06-08 10:39:53'),('thought control',36,'2023-06-08 10:39:53'),('thriller',13,'2023-06-08 10:39:53'),('thriller',46,'2023-06-08 10:39:53'),('thriller',56,'2023-06-08 10:39:53'),('time travel',38,'2023-06-08 10:39:53'),('time travel',101,'2023-06-08 10:39:53'),('totalitarianism',4,'2023-06-08 10:39:53'),('totalitarianism',36,'2023-06-08 10:39:53'),('tragedy',61,'2023-06-08 10:39:53'),('tragedy',89,'2023-06-08 10:39:53'),('tragedy',93,'2023-06-08 10:39:53'),('tragedy',94,'2023-06-08 10:39:53'),('treasure hunt',69,'2023-06-08 10:39:53'),('treasure hunt',80,'2023-06-08 10:39:53'),('underwater',41,'2023-06-08 10:39:53'),('unrequited love',6,'2023-06-08 10:39:53'),('utopia',35,'2023-06-08 10:39:53'),('utopia',51,'2023-06-08 10:39:53'),('vampires',34,'2023-06-08 10:39:53'),('vampires',98,'2023-06-08 10:39:53'),('wealth',91,'2023-06-08 10:39:53'),('whaling',8,'2023-06-08 10:39:53'),('whaling',81,'2023-06-08 10:39:53'),('wilderness',83,'2023-06-08 10:39:53'),('wizardry',44,'2023-06-08 10:39:53'),('wizardry',84,'2023-06-08 10:39:53'),('wizardry',85,'2023-06-08 10:39:53'),('wizardry',86,'2023-06-08 10:39:53'),('World War II',17,'2023-06-08 10:39:53'),('World War II',25,'2023-06-08 10:39:53'),('young adult',12,'2023-06-08 10:39:53'),('young adult',55,'2023-06-08 10:39:53'),('youth',49,'2023-06-08 10:39:53'),('youth',64,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `book_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_status`
--

DROP TABLE IF EXISTS `book_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_status` (
  `book_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('borrowed','reserved','queue') NOT NULL,
  `request_date` date DEFAULT NULL,
  `approval_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`book_status_id`),
  KEY `fk_book_status_book_id` (`book_id`),
  KEY `fk_book_status_user_id` (`user_id`),
  KEY `idx_book_status_status` (`status`),
  KEY `idx_book_status_user_id` (`user_id`),
  KEY `idx_book_status_approval_date` (`approval_date`),
  CONSTRAINT `fk_book_status_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_book_status_user_id` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_status`
--

LOCK TABLES `book_status` WRITE;
/*!40000 ALTER TABLE `book_status` DISABLE KEYS */;
INSERT INTO `book_status` VALUES (1,44,4,'borrowed','2023-05-12','2023-05-15','2023-05-17'),(2,45,11,'borrowed','2023-05-13','2023-05-16','2023-05-18'),(3,46,12,'borrowed','2023-05-14','2023-05-17','2023-05-19'),(4,47,13,'borrowed','2023-05-15','2023-05-18','2023-05-20'),(5,48,25,'borrowed','2023-05-16','2023-05-19','2023-05-21'),(6,49,26,'borrowed','2023-05-17','2023-05-20','2023-05-22'),(7,50,27,'borrowed','2023-05-18','2023-05-21','2023-05-23'),(8,51,28,'borrowed','2023-05-19','2023-05-22','2023-05-24'),(9,52,29,'borrowed','2023-05-20','2023-05-23','2023-05-25'),(10,53,39,'borrowed','2023-05-21','2023-05-24','2023-05-26'),(11,23,3,'borrowed','2023-05-12','2023-05-15','2023-05-17'),(12,24,8,'borrowed','2023-05-13','2023-05-16','2023-05-18'),(13,25,9,'borrowed','2023-05-14','2023-05-17','2023-05-19'),(14,26,10,'borrowed','2023-05-15','2023-05-18','2023-05-20'),(15,27,20,'borrowed','2023-05-16','2023-05-19','2023-05-21'),(16,28,21,'borrowed','2023-05-17','2023-05-20','2023-05-22'),(17,29,22,'borrowed','2023-05-18','2023-05-21','2023-05-23'),(18,30,23,'borrowed','2023-05-19','2023-05-22','2023-05-24'),(19,31,24,'borrowed','2023-05-20','2023-05-23','2023-05-25'),(20,32,34,'borrowed','2023-05-21','2023-05-24','2023-05-26'),(21,33,35,'borrowed','2023-05-22','2023-05-25','2023-05-27'),(22,34,36,'borrowed','2023-05-23','2023-05-26','2023-05-28'),(23,35,37,'borrowed','2023-05-24','2023-05-27','2023-05-29'),(24,36,38,'borrowed','2023-05-25','2023-05-28','2023-05-30'),(25,37,3,'borrowed','2023-05-26','2023-05-29','2023-05-31'),(26,38,8,'borrowed','2023-05-27','2023-05-30','2023-06-01'),(27,39,9,'borrowed','2023-05-28','2023-05-31','2023-06-02'),(28,40,10,'borrowed','2023-05-29','2023-06-01','2023-06-03'),(29,41,20,'borrowed','2023-05-30','2023-06-02','2023-06-04'),(30,42,21,'borrowed','2023-05-31','2023-06-03','2023-06-05'),(31,1,2,'borrowed','2023-05-01','2023-05-04','2023-05-06'),(32,1,15,'borrowed','2023-05-02','2023-05-05','2023-05-07'),(33,3,6,'borrowed','2023-05-03','2023-05-06','2023-05-08'),(34,4,7,'borrowed','2023-05-04','2023-05-07','2023-05-09'),(35,5,14,'borrowed','2023-05-05','2023-05-08','2023-05-10'),(36,7,16,'borrowed','2023-05-07','2023-05-10','2023-05-12'),(37,8,17,'borrowed','2023-05-08','2023-05-11','2023-05-13'),(38,9,18,'borrowed','2023-05-09','2023-05-12','2023-05-14'),(39,10,19,'borrowed','2023-05-10','2023-05-13','2023-05-15'),(40,11,30,'borrowed','2023-05-11','2023-05-14','2023-05-16'),(41,12,31,'borrowed','2023-05-12','2023-05-15','2023-05-17'),(42,13,32,'borrowed','2023-05-13','2023-05-16','2023-05-18'),(43,14,33,'borrowed','2023-05-14','2023-05-17','2023-05-19'),(44,2,2,'reserved','2023-06-05',NULL,NULL),(45,4,6,'reserved','2023-06-05',NULL,NULL),(46,5,7,'reserved','2023-06-05',NULL,NULL),(47,6,14,'reserved','2023-06-05',NULL,NULL),(48,7,15,'reserved','2023-06-05',NULL,NULL),(49,8,16,'reserved','2023-06-05',NULL,NULL),(50,9,15,'reserved','2023-06-05',NULL,NULL),(51,10,18,'reserved','2023-06-05',NULL,NULL),(52,11,19,'reserved','2023-06-05',NULL,NULL),(53,12,30,'reserved','2023-06-05',NULL,NULL),(54,13,31,'reserved','2023-06-05',NULL,NULL),(55,14,32,'reserved','2023-06-05',NULL,NULL),(56,15,33,'reserved','2023-06-05',NULL,NULL),(57,27,20,'reserved','2023-06-05',NULL,NULL),(58,28,21,'reserved','2023-06-05',NULL,NULL),(59,29,22,'reserved','2023-06-05',NULL,NULL),(60,33,35,'reserved','2023-06-05',NULL,NULL),(61,34,36,'reserved','2023-06-05',NULL,NULL),(62,35,37,'reserved','2023-06-05',NULL,NULL),(63,47,11,'reserved','2023-06-05',NULL,NULL),(64,48,25,'reserved','2023-06-05',NULL,NULL),(65,49,26,'reserved','2023-06-05',NULL,NULL),(66,50,27,'reserved','2023-06-05',NULL,NULL),(67,51,43,'reserved','2023-06-05',NULL,NULL),(68,16,19,'borrowed','2023-04-29','2023-04-30',NULL),(69,6,15,'queue','2023-05-29',NULL,NULL),(70,6,16,'queue','2023-05-30',NULL,NULL),(71,7,16,'queue','2023-05-30',NULL,NULL);
/*!40000 ALTER TABLE `book_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_borrow_limit
BEFORE INSERT ON book_status
FOR EACH ROW
BEGIN
    DECLARE borrow_count INT;
    DECLARE queue_count INT;
    DECLARE reserved_count INT;
    IF (NEW.status = 'reserved' OR NEW.status = 'borrowed') THEN
      IF NEW.user_id IN (SELECT user_id FROM lib_user WHERE role_name='student') THEN
          SET borrow_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('borrowed')
                AND approval_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );
          SET reserved_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('reserved')
                AND request_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );

          IF (borrow_count+reserved_count) >= 2 THEN
              SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You have exceeded the limit on the number of books you can borrow or reserve in the last seven days.';
          END IF;
      ELSEIF NEW.user_id IN (SELECT user_id FROM lib_user WHERE role_name='teacher' OR role_name='admin') THEN
          SET borrow_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('borrowed')
                AND approval_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );
          SET reserved_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('reserved')
                AND request_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );
          IF (borrow_count+reserved_count) >= 1 THEN
              SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You have exceeded the limit on the number of books you can borrow or reserve in the last seven days.';
          END IF;
      END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_queue_limit
BEFORE INSERT ON book_status
FOR EACH ROW
BEGIN
    DECLARE borrow_count INT;
    DECLARE queue_count INT;
    DECLARE reserved_count INT;
    IF (NEW.status = 'queue') THEN
      IF NEW.user_id IN (SELECT user_id FROM lib_user WHERE role_name='student') THEN
          SET queue_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('queue')
                AND request_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );

          IF (queue_count) >= 2 THEN
              SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You have exceeded the limit on the number of books you can borrow or reserve in the last seven days.';
          END IF;
      ELSEIF NEW.user_id IN (SELECT user_id FROM lib_user WHERE role_name='teacher' OR role_name='admin') THEN
          SET queue_count = (
              SELECT COUNT(*) AS count
              FROM book_status
              WHERE user_id = NEW.user_id
                AND status IN ('queue')
                AND request_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
          );
          IF (queue_count) >= 1 THEN
              SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You have exceeded the limit on the number of books you can borrow or reserve in the last seven days.';
          END IF;
      END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `book_theme`
--

DROP TABLE IF EXISTS `book_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_theme` (
  `theme` enum('Fiction','Non-fiction','Dystopia','Gothic','Tragedy','Science Fiction','Science','Drama','Adventure','Mystery','Romance','War','Classic','Thriller','Horror','Fantasy','Biography','Autobiography','History','Poetry','Comics','Cookbooks','Travel','Religion','Self-help','Art','Music','Coming of Age','Sports','Humor','Children','Reference') NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`theme`,`book_id`),
  KEY `fk_book_theme_book_id` (`book_id`),
  KEY `idx_book_theme_theme` (`theme`),
  CONSTRAINT `fk_book_theme_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_theme`
--

LOCK TABLES `book_theme` WRITE;
/*!40000 ALTER TABLE `book_theme` DISABLE KEYS */;
INSERT INTO `book_theme` VALUES ('Fiction',1,'2023-06-08 10:39:53'),('Fiction',2,'2023-06-08 10:39:53'),('Fiction',5,'2023-06-08 10:39:53'),('Fiction',9,'2023-06-08 10:39:53'),('Fiction',49,'2023-06-08 10:39:53'),('Dystopia',19,'2023-06-08 10:39:53'),('Dystopia',22,'2023-06-08 10:39:53'),('Dystopia',27,'2023-06-08 10:39:53'),('Dystopia',35,'2023-06-08 10:39:53'),('Dystopia',36,'2023-06-08 10:39:53'),('Dystopia',45,'2023-06-08 10:39:53'),('Dystopia',51,'2023-06-08 10:39:53'),('Gothic',31,'2023-06-08 10:39:53'),('Gothic',34,'2023-06-08 10:39:53'),('Gothic',58,'2023-06-08 10:39:53'),('Gothic',60,'2023-06-08 10:39:53'),('Gothic',65,'2023-06-08 10:39:53'),('Gothic',98,'2023-06-08 10:39:53'),('Tragedy',89,'2023-06-08 10:39:53'),('Tragedy',92,'2023-06-08 10:39:53'),('Tragedy',93,'2023-06-08 10:39:53'),('Tragedy',94,'2023-06-08 10:39:53'),('Science Fiction',3,'2023-06-08 10:39:53'),('Science Fiction',10,'2023-06-08 10:39:53'),('Science Fiction',19,'2023-06-08 10:39:53'),('Science Fiction',22,'2023-06-08 10:39:53'),('Science Fiction',27,'2023-06-08 10:39:53'),('Science Fiction',31,'2023-06-08 10:39:53'),('Science Fiction',33,'2023-06-08 10:39:53'),('Science Fiction',35,'2023-06-08 10:39:53'),('Science Fiction',36,'2023-06-08 10:39:53'),('Science Fiction',37,'2023-06-08 10:39:53'),('Science Fiction',38,'2023-06-08 10:39:53'),('Science Fiction',39,'2023-06-08 10:39:53'),('Science Fiction',40,'2023-06-08 10:39:53'),('Science Fiction',42,'2023-06-08 10:39:53'),('Science Fiction',51,'2023-06-08 10:39:53'),('Science',42,'2023-06-08 10:39:53'),('Drama',1,'2023-06-08 10:39:53'),('Drama',6,'2023-06-08 10:39:53'),('Drama',16,'2023-06-08 10:39:53'),('Drama',17,'2023-06-08 10:39:53'),('Drama',18,'2023-06-08 10:39:53'),('Drama',20,'2023-06-08 10:39:53'),('Drama',21,'2023-06-08 10:39:53'),('Drama',23,'2023-06-08 10:39:53'),('Drama',24,'2023-06-08 10:39:53'),('Drama',25,'2023-06-08 10:39:53'),('Drama',26,'2023-06-08 10:39:53'),('Drama',28,'2023-06-08 10:39:53'),('Drama',55,'2023-06-08 10:39:53'),('Drama',57,'2023-06-08 10:39:53'),('Drama',59,'2023-06-08 10:39:53'),('Drama',61,'2023-06-08 10:39:53'),('Drama',63,'2023-06-08 10:39:53'),('Drama',64,'2023-06-08 10:39:53'),('Drama',70,'2023-06-08 10:39:53'),('Drama',73,'2023-06-08 10:39:53'),('Drama',74,'2023-06-08 10:39:53'),('Drama',75,'2023-06-08 10:39:53'),('Drama',89,'2023-06-08 10:39:53'),('Drama',90,'2023-06-08 10:39:53'),('Drama',91,'2023-06-08 10:39:53'),('Drama',94,'2023-06-08 10:39:53'),('Drama',96,'2023-06-08 10:39:53'),('Drama',97,'2023-06-08 10:39:53'),('Adventure',2,'2023-06-08 10:39:53'),('Adventure',3,'2023-06-08 10:39:53'),('Adventure',5,'2023-06-08 10:39:53'),('Adventure',8,'2023-06-08 10:39:53'),('Adventure',11,'2023-06-08 10:39:53'),('Adventure',14,'2023-06-08 10:39:53'),('Adventure',15,'2023-06-08 10:39:53'),('Adventure',16,'2023-06-08 10:39:53'),('Adventure',18,'2023-06-08 10:39:53'),('Adventure',19,'2023-06-08 10:39:53'),('Adventure',22,'2023-06-08 10:39:53'),('Adventure',24,'2023-06-08 10:39:53'),('Adventure',26,'2023-06-08 10:39:53'),('Adventure',27,'2023-06-08 10:39:53'),('Adventure',29,'2023-06-08 10:39:53'),('Adventure',30,'2023-06-08 10:39:53'),('Adventure',32,'2023-06-08 10:39:53'),('Adventure',33,'2023-06-08 10:39:53'),('Adventure',38,'2023-06-08 10:39:53'),('Adventure',41,'2023-06-08 10:39:53'),('Adventure',43,'2023-06-08 10:39:53'),('Adventure',44,'2023-06-08 10:39:53'),('Adventure',45,'2023-06-08 10:39:53'),('Adventure',47,'2023-06-08 10:39:53'),('Adventure',49,'2023-06-08 10:39:53'),('Adventure',50,'2023-06-08 10:39:53'),('Adventure',52,'2023-06-08 10:39:53'),('Adventure',53,'2023-06-08 10:39:53'),('Adventure',54,'2023-06-08 10:39:53'),('Adventure',65,'2023-06-08 10:39:53'),('Adventure',66,'2023-06-08 10:39:53'),('Adventure',68,'2023-06-08 10:39:53'),('Adventure',69,'2023-06-08 10:39:53'),('Adventure',71,'2023-06-08 10:39:53'),('Adventure',72,'2023-06-08 10:39:53'),('Adventure',74,'2023-06-08 10:39:53'),('Adventure',76,'2023-06-08 10:39:53'),('Adventure',77,'2023-06-08 10:39:53'),('Adventure',78,'2023-06-08 10:39:53'),('Adventure',79,'2023-06-08 10:39:53'),('Adventure',80,'2023-06-08 10:39:53'),('Adventure',81,'2023-06-08 10:39:53'),('Adventure',82,'2023-06-08 10:39:53'),('Adventure',83,'2023-06-08 10:39:53'),('Adventure',84,'2023-06-08 10:39:53'),('Adventure',85,'2023-06-08 10:39:53'),('Adventure',86,'2023-06-08 10:39:53'),('Adventure',87,'2023-06-08 10:39:53'),('Adventure',88,'2023-06-08 10:39:53'),('Adventure',95,'2023-06-08 10:39:53'),('Adventure',99,'2023-06-08 10:39:53'),('Adventure',100,'2023-06-08 10:39:53'),('Adventure',101,'2023-06-08 10:39:53'),('Adventure',102,'2023-06-08 10:39:53'),('Mystery',4,'2023-06-08 10:39:53'),('Mystery',7,'2023-06-08 10:39:53'),('Mystery',12,'2023-06-08 10:39:53'),('Mystery',13,'2023-06-08 10:39:53'),('Mystery',15,'2023-06-08 10:39:53'),('Mystery',17,'2023-06-08 10:39:53'),('Mystery',23,'2023-06-08 10:39:53'),('Mystery',25,'2023-06-08 10:39:53'),('Mystery',39,'2023-06-08 10:39:53'),('Mystery',46,'2023-06-08 10:39:53'),('Mystery',56,'2023-06-08 10:39:53'),('Mystery',66,'2023-06-08 10:39:53'),('Mystery',77,'2023-06-08 10:39:53'),('Romance',1,'2023-06-08 10:39:53'),('Romance',6,'2023-06-08 10:39:53'),('Romance',12,'2023-06-08 10:39:53'),('Romance',18,'2023-06-08 10:39:53'),('Romance',26,'2023-06-08 10:39:53'),('Romance',48,'2023-06-08 10:39:53'),('Romance',55,'2023-06-08 10:39:53'),('Romance',57,'2023-06-08 10:39:53'),('Romance',58,'2023-06-08 10:39:53'),('Romance',59,'2023-06-08 10:39:53'),('Romance',60,'2023-06-08 10:39:53'),('Romance',61,'2023-06-08 10:39:53'),('Romance',63,'2023-06-08 10:39:53'),('Romance',64,'2023-06-08 10:39:53'),('Romance',70,'2023-06-08 10:39:53'),('Romance',92,'2023-06-08 10:39:53'),('Romance',93,'2023-06-08 10:39:53'),('Romance',96,'2023-06-08 10:39:53'),('Romance',97,'2023-06-08 10:39:53'),('Classic',5,'2023-06-08 10:39:53'),('Classic',6,'2023-06-08 10:39:53'),('Classic',8,'2023-06-08 10:39:53'),('Classic',14,'2023-06-08 10:39:53'),('Classic',20,'2023-06-08 10:39:53'),('Classic',21,'2023-06-08 10:39:53'),('Classic',28,'2023-06-08 10:39:53'),('Classic',29,'2023-06-08 10:39:53'),('Classic',31,'2023-06-08 10:39:53'),('Classic',34,'2023-06-08 10:39:53'),('Classic',40,'2023-06-08 10:39:53'),('Classic',41,'2023-06-08 10:39:53'),('Classic',43,'2023-06-08 10:39:53'),('Classic',48,'2023-06-08 10:39:53'),('Classic',49,'2023-06-08 10:39:53'),('Classic',53,'2023-06-08 10:39:53'),('Classic',57,'2023-06-08 10:39:53'),('Classic',58,'2023-06-08 10:39:53'),('Classic',59,'2023-06-08 10:39:53'),('Classic',60,'2023-06-08 10:39:53'),('Classic',61,'2023-06-08 10:39:53'),('Classic',62,'2023-06-08 10:39:53'),('Classic',63,'2023-06-08 10:39:53'),('Classic',64,'2023-06-08 10:39:53'),('Classic',65,'2023-06-08 10:39:53'),('Classic',66,'2023-06-08 10:39:53'),('Classic',67,'2023-06-08 10:39:53'),('Classic',68,'2023-06-08 10:39:53'),('Classic',69,'2023-06-08 10:39:53'),('Classic',70,'2023-06-08 10:39:53'),('Classic',71,'2023-06-08 10:39:53'),('Classic',72,'2023-06-08 10:39:53'),('Classic',73,'2023-06-08 10:39:53'),('Classic',74,'2023-06-08 10:39:53'),('Classic',75,'2023-06-08 10:39:53'),('Classic',76,'2023-06-08 10:39:53'),('Classic',77,'2023-06-08 10:39:53'),('Classic',79,'2023-06-08 10:39:53'),('Classic',80,'2023-06-08 10:39:53'),('Classic',81,'2023-06-08 10:39:53'),('Classic',82,'2023-06-08 10:39:53'),('Classic',83,'2023-06-08 10:39:53'),('Classic',89,'2023-06-08 10:39:53'),('Classic',90,'2023-06-08 10:39:53'),('Classic',91,'2023-06-08 10:39:53'),('Classic',92,'2023-06-08 10:39:53'),('Classic',93,'2023-06-08 10:39:53'),('Classic',94,'2023-06-08 10:39:53'),('Classic',95,'2023-06-08 10:39:53'),('Classic',96,'2023-06-08 10:39:53'),('Classic',97,'2023-06-08 10:39:53'),('Classic',98,'2023-06-08 10:39:53'),('Thriller',4,'2023-06-08 10:39:53'),('Thriller',7,'2023-06-08 10:39:53'),('Thriller',10,'2023-06-08 10:39:53'),('Thriller',13,'2023-06-08 10:39:53'),('Thriller',17,'2023-06-08 10:39:53'),('Thriller',23,'2023-06-08 10:39:53'),('Thriller',25,'2023-06-08 10:39:53'),('Thriller',46,'2023-06-08 10:39:53'),('Thriller',56,'2023-06-08 10:39:53'),('Horror',4,'2023-06-08 10:39:53'),('Horror',7,'2023-06-08 10:39:53'),('Horror',13,'2023-06-08 10:39:53'),('Horror',34,'2023-06-08 10:39:53'),('Horror',98,'2023-06-08 10:39:53'),('Fantasy',3,'2023-06-08 10:39:53'),('Fantasy',10,'2023-06-08 10:39:53'),('Fantasy',11,'2023-06-08 10:39:53'),('Fantasy',14,'2023-06-08 10:39:53'),('Fantasy',15,'2023-06-08 10:39:53'),('Fantasy',29,'2023-06-08 10:39:53'),('Fantasy',30,'2023-06-08 10:39:53'),('Fantasy',32,'2023-06-08 10:39:53'),('Fantasy',41,'2023-06-08 10:39:53'),('Fantasy',44,'2023-06-08 10:39:53'),('Fantasy',47,'2023-06-08 10:39:53'),('Fantasy',50,'2023-06-08 10:39:53'),('Fantasy',52,'2023-06-08 10:39:53'),('Fantasy',54,'2023-06-08 10:39:53'),('Fantasy',72,'2023-06-08 10:39:53'),('Fantasy',78,'2023-06-08 10:39:53'),('Fantasy',84,'2023-06-08 10:39:53'),('Fantasy',85,'2023-06-08 10:39:53'),('Fantasy',86,'2023-06-08 10:39:53'),('Fantasy',87,'2023-06-08 10:39:53'),('Fantasy',88,'2023-06-08 10:39:53'),('Fantasy',99,'2023-06-08 10:39:53'),('Fantasy',100,'2023-06-08 10:39:53'),('Fantasy',101,'2023-06-08 10:39:53'),('Fantasy',102,'2023-06-08 10:39:53'),('Biography',8,'2023-06-08 10:39:53'),('Biography',9,'2023-06-08 10:39:53'),('History',9,'2023-06-08 10:39:53'),('Religion',67,'2023-06-08 10:39:53'),('Coming of Age',2,'2023-06-08 10:39:53'),('Coming of Age',11,'2023-06-08 10:39:53'),('Coming of Age',12,'2023-06-08 10:39:53'),('Coming of Age',16,'2023-06-08 10:39:53'),('Coming of Age',20,'2023-06-08 10:39:53'),('Coming of Age',24,'2023-06-08 10:39:53'),('Coming of Age',28,'2023-06-08 10:39:53'),('Coming of Age',55,'2023-06-08 10:39:53'),('Coming of Age',68,'2023-06-08 10:39:53'),('Coming of Age',73,'2023-06-08 10:39:53'),('Coming of Age',75,'2023-06-08 10:39:53'),('Coming of Age',90,'2023-06-08 10:39:53'),('Children',30,'2023-06-08 10:39:53'),('Children',32,'2023-06-08 10:39:53'),('Children',44,'2023-06-08 10:39:53'),('Children',47,'2023-06-08 10:39:53'),('Children',50,'2023-06-08 10:39:53'),('Children',69,'2023-06-08 10:39:53'),('Children',78,'2023-06-08 10:39:53'),('Children',79,'2023-06-08 10:39:53'),('Children',84,'2023-06-08 10:39:53'),('Children',85,'2023-06-08 10:39:53'),('Children',86,'2023-06-08 10:39:53'),('Children',87,'2023-06-08 10:39:53'),('Children',88,'2023-06-08 10:39:53'),('Children',99,'2023-06-08 10:39:53'),('Children',100,'2023-06-08 10:39:53'),('Children',101,'2023-06-08 10:39:53'),('Children',102,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `book_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_user`
--

DROP TABLE IF EXISTS `lib_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lib_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_pwd` varchar(10) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `role_name` enum('student','teacher','admin','super_admin') NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_firstname` varchar(45) NOT NULL,
  `user_lastname` varchar(45) NOT NULL,
  `user_date_of_birth` date NOT NULL,
  `user_pending_flag` enum('waiting') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  KEY `fk_user_school_id` (`school_id`),
  KEY `idx_lib_user_name` (`user_firstname`,`user_lastname`),
  CONSTRAINT `fk_user_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_user`
--

LOCK TABLES `lib_user` WRITE;
/*!40000 ALTER TABLE `lib_user` DISABLE KEYS */;
INSERT INTO `lib_user` VALUES (1,'1111','manosneo',1,'super_admin','manosneof@gmail.com','manos','neof','1924-01-01',NULL,'2023-06-08 10:39:53'),(2,'1234','george123',1,'admin','georgesmith@gmail.com','George','Smith','1985-07-10',NULL,'2023-06-08 10:39:53'),(3,'5678','emily456',2,'admin','emilyjones@gmail.com','Emily','Jones','1982-11-18',NULL,'2023-06-08 10:39:53'),(4,'9876','jason789',3,'admin','jasonbrown@gmail.com','Jason','Brown','1988-03-25',NULL,'2023-06-08 10:39:53'),(5,'1234','johnsmith',1,'teacher','johnsmith@gmail.com','John','Smith','1985-07-12',NULL,'2023-06-08 10:39:53'),(6,'9876','jennifermiller',1,'teacher','jennifermiller@gmail.com','Jennifer','Miller','1978-03-30',NULL,'2023-06-08 10:39:53'),(7,'2468','mike1980',1,'teacher','mike1980@gmail.com','Michael','Johnson','1980-11-05',NULL,'2023-06-08 10:39:53'),(8,'1357','amandabrown',2,'teacher','amandabrown@gmail.com','Amanda','Brown','1992-02-18',NULL,'2023-06-08 10:39:53'),(9,'5678','davidthompson',2,'teacher','davidthompson@gmail.com','David','Thompson','1972-09-10',NULL,'2023-06-08 10:39:53'),(10,'7890','sarahjones',2,'teacher','sarahjones@gmail.com','Sarah','Jones','1988-12-01',NULL,'2023-06-08 10:39:53'),(11,'5432','robertgreen',3,'teacher','robertgreen@gmail.com','Robert','Green','1983-06-22',NULL,'2023-06-08 10:39:53'),(12,'2109','emilytaylor',3,'teacher','emilytaylor@gmail.com','Emily','Taylor','1995-04-14',NULL,'2023-06-08 10:39:53'),(13,'8765','chrisharris',3,'teacher','chrisharris@gmail.com','Chris','Harris','1975-08-07',NULL,'2023-06-08 10:39:53'),(14,'4321','jessicawright',1,'teacher','jessicawright@gmail.com','Jessica','Wright','1987-01-23',NULL,'2023-06-08 10:39:53'),(15,'4321','ethan456',1,'student','ethanbrown@example.com','Ethan','Brown','2003-06-10',NULL,'2023-06-08 10:39:53'),(16,'5678','mia789',1,'student','miaharris@example.com','Mia','Harris','2004-09-05',NULL,'2023-06-08 10:39:53'),(17,'8765','jacob234',1,'student','jacobsmith@example.com','Jacob','Smith','2003-03-17',NULL,'2023-06-08 10:39:53'),(18,'7890','ava567',1,'student','avajones@example.com','Ava','Jones','2002-12-08',NULL,'2023-06-08 10:39:53'),(19,'9012','sophia890',1,'student','sophiawilson@example.com','Sophia','Wilson','2004-11-25',NULL,'2023-06-08 10:39:53'),(20,'3456','noah321',2,'student','noahdavis@example.com','Noah','Davis','2005-07-02',NULL,'2023-06-08 10:39:53'),(21,'2345','olivia654',2,'student','oliviamartin@example.com','Olivia','Martin','2003-02-13',NULL,'2023-06-08 10:39:53'),(22,'1234','liam987',2,'student','liamthompson@example.com','Liam','Thompson','2004-04-30',NULL,'2023-06-08 10:39:53'),(23,'4321','emma123',2,'student','emmalopez@example.com','Emma','Lopez','2002-09-22',NULL,'2023-06-08 10:39:53'),(24,'5678','william456',2,'student','williamjohnson@example.com','William','Johnson','2003-12-14',NULL,'2023-06-08 10:39:53'),(25,'8765','ava789',3,'student','avamartinez@example.com','Ava','Martinez','2004-06-07',NULL,'2023-06-08 10:39:53'),(26,'7890','mason234',3,'student','masonhall@example.com','Mason','Hall','2002-11-19',NULL,'2023-06-08 10:39:53'),(27,'9012','sophia567',3,'student','sophiamiller@example.com','Sophia','Miller','2003-08-12',NULL,'2023-06-08 10:39:53'),(28,'3456','james890',3,'student','jamesrivera@example.com','James','Rivera','2004-02-27',NULL,'2023-06-08 10:39:53'),(29,'2345','olivia123',3,'student','oliviacooper@example.com','Olivia','Cooper','2002-10-15',NULL,'2023-06-08 10:39:53'),(30,'1234','liam456',1,'student','liamroberts@example.com','Liam','Roberts','2003-01-28',NULL,'2023-06-08 10:39:53'),(31,'4321','ava789',1,'student','avahill@example.com','Ava','Hill','2004-04-15',NULL,'2023-06-08 10:39:53'),(32,'5678','michael234',1,'student','michaelwood@example.com','Michael','Wood','2002-12-07',NULL,'2023-06-08 10:39:53'),(33,'8765','sophia567',1,'student','sophialong@example.com','Sophia','Long','2003-09-20',NULL,'2023-06-08 10:39:53'),(34,'9012','oliver123',2,'student','oliverwright@example.com','Oliver','Wright','2003-05-10',NULL,'2023-06-08 10:39:53'),(35,'3456','charlotte456',2,'student','charlottelee@example.com','Charlotte','Lee','2002-11-15',NULL,'2023-06-08 10:39:53'),(36,'2345','lucas789',2,'student','lucasbaker@example.com','Lucas','Baker','2004-02-22',NULL,'2023-06-08 10:39:53'),(37,'1234','harper234',2,'student','harperjackson@example.com','Harper','Jackson','2003-07-31',NULL,'2023-06-08 10:39:53'),(38,'4321','amelia567',2,'student','ameliarobinson@example.com','Amelia','Robinson','2002-12-18',NULL,'2023-06-08 10:39:53'),(39,'5678','oliver123',3,'student','oliverwright@example.com','Oliver','Wright','2003-05-10',NULL,'2023-06-08 10:39:53'),(40,'8765','charlotte456',3,'student','charlottelee@example.com','Charlotte','Lee','2002-11-15',NULL,'2023-06-08 10:39:53'),(41,'7890','lucas789',3,'student','lucasbaker@example.com','Lucas','Baker','2004-02-22',NULL,'2023-06-08 10:39:53'),(42,'9012','harper234',3,'student','harperjackson@example.com','Harper','Jackson','2003-07-31',NULL,'2023-06-08 10:39:53'),(43,'3456','amelia567',3,'student','ameliarobinson@example.com','Amelia','Robinson','2002-12-18',NULL,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `lib_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER user_pwd_format_trigger BEFORE INSERT ON lib_user
FOR EACH ROW
BEGIN
  IF CHAR_LENGTH(NEW.user_pwd) != 4 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number must be 10 digits.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_teacher_admin_age 
BEFORE INSERT ON lib_user 
FOR EACH ROW 
BEGIN
  IF (NEW.role_name = 'teacher' OR NEW.role_name = 'admin') AND 
     (TIMESTAMPDIFF(YEAR, NEW.user_date_of_birth, CURDATE()) < 23) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Teachers and admins must be at least 23 years old.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_student_age 
BEFORE INSERT ON lib_user 
FOR EACH ROW 
BEGIN
  IF (NEW.role_name = 'student') AND 
     (TIMESTAMPDIFF(YEAR, NEW.user_date_of_birth, CURDATE()) < 7) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Teachers and admins must be at least 7 years old.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_super_admin_check
BEFORE INSERT ON lib_user
FOR EACH ROW
BEGIN
  DECLARE super_admin_count INT;
  SET super_admin_count = (
    SELECT COUNT(*)
    FROM lib_user
    WHERE role_name = 'super_admin'
  );
  IF super_admin_count > 0 AND NEW.role_name = 'super_admin' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one super admin is allowed.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_school_admin_check
BEFORE INSERT ON lib_user
FOR EACH ROW
BEGIN
  DECLARE admin_count INT;
  SET admin_count = (
    SELECT COUNT(*)
    FROM lib_user
    WHERE school_id = NEW.school_id AND role_name = 'admin'
  );
  IF admin_count > 0 AND NEW.role_name = 'admin' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A school can have only one admin.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `new_user_application`
--

DROP TABLE IF EXISTS `new_user_application`;
/*!50001 DROP VIEW IF EXISTS `new_user_application`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_user_application` AS SELECT 
 1 AS `user_id`,
 1 AS `user_pwd`,
 1 AS `user_name`,
 1 AS `school_id`,
 1 AS `role_name`,
 1 AS `user_email`,
 1 AS `user_firstname`,
 1 AS `user_lastname`,
 1 AS `user_date_of_birth`,
 1 AS `user_pending_flag`,
 1 AS `last_update`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `user_id` int(10) unsigned NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `review_text` varchar(400) DEFAULT NULL,
  `rev_date` date DEFAULT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `review_pending_flag` enum('pending') DEFAULT NULL,
  PRIMARY KEY (`user_id`,`book_id`),
  KEY `fk_review_user_id` (`user_id`),
  KEY `fk_review_book_id` (`book_id`),
  CONSTRAINT `fk_review_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_user_id` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,1,'Pride and Prejudice is a timeless classic with memorable characters and a beautiful love story.','2023-01-10','5',NULL),(3,23,'The Da Vinci Code is a gripping and intricate thriller that keeps you hooked from start to finish.','2023-01-12','3',NULL),(3,37,'The War of the Worlds is a classic science fiction novel that explores themes of invasion and humanity.','2023-02-18','5',NULL),(4,44,'Harry Potter and the Sorcerer\'s Stone is a magical and enchanting start to the beloved Harry Potter series.','2023-03-18','5',NULL),(6,3,'The Hobbit is a charming adventure filled with magical creatures and a captivating quest.','2023-02-15','4',NULL),(7,4,'1984 is a dystopian masterpiece that offers a chilling portrayal of a totalitarian society.','2023-03-20','5',NULL),(8,24,'The Kite Runner is a deeply moving and poignant novel that explores themes of friendship, betrayal, and redemption.','2023-04-15','5',NULL),(8,38,'The Time Machine is a thought-provoking science fiction novella that delves into the concept of time travel.','2023-03-20','3',NULL),(9,25,'The Book Thief is a haunting and beautifully written story set during World War II.','2023-05-08','4',NULL),(9,39,'The Poison Belt is a thrilling science fiction novella that continues the adventures of Professor Challenger.','2023-02-27','5',NULL),(10,26,'The Secret Life of Bees is a heartwarming and powerful novel that explores themes of family, race, and forgiveness.','2023-03-10','4',NULL),(10,40,'The Invisible Man is a classic science fiction novel that examines the consequences of scientific experimentation.','2023-04-22','2',NULL),(11,45,'The Hunger Games is a gripping and thrilling dystopian novel that keeps you on the edge of your seat.','2023-02-10','2',NULL),(12,46,'The Girl with the Dragon Tattoo is a gripping and suspenseful crime thriller with complex and intriguing characters.','2023-01-25','5',NULL),(13,47,'The Chronicles of Narnia is a timeless and enchanting series that transports readers to a magical world.','2023-04-02','4',NULL),(14,5,'The Alchemist is a thought-provoking novel that inspires readers to follow their dreams.','2023-04-25','4',NULL),(15,1,'Pride and Prejudice is a beloved classic that showcases the complexities of love and societal expectations.','2022-12-05','5',NULL),(16,7,'To the Lighthouse is a beautifully written novel that explores themes of introspection and the passage of time.','2023-01-25','4',NULL),(17,8,'Moby-Dick is an epic tale of adventure and obsession set in the world of whaling.','2023-02-08','5',NULL),(18,9,'The Picture of Dorian Gray is a haunting novel that explores the corrupting nature of beauty and youth.','2023-03-15','4',NULL),(19,10,'Frankenstein is a Gothic masterpiece that raises questions about the boundaries of science and the nature of humanity.','2023-01-28','2',NULL),(19,16,'The Kite Runner is a powerful and emotional story of friendship, redemption, and the consequences of our choices.','2023-04-12','3',NULL),(20,27,'The Road is a post-apocalyptic novel that offers a bleak yet gripping depiction of survival and hope.','2023-01-28','4',NULL),(20,41,'Vingt mille lieues sous les mers (Twenty Thousand Leagues Under the Sea) is a classic adventure novel by Jules Verne.','2023-02-12','5',NULL),(21,28,'The Bell Jar is a poignant and semi-autobiographical novel that explores themes of mental health and identity.','2023-03-05','4',NULL),(21,42,'Flatland is a unique and thought-provoking novella that presents a mathematical world of dimensions.','2023-04-18','2',NULL),(22,29,'The Help is a compelling and emotionally charged novel that tackles issues of race and discrimination.','2023-05-02','4',NULL),(23,30,'Alice\'s Adventures in Wonderland is a whimsical and imaginative tale that takes readers on a surreal journey.','2023-01-15','5',NULL),(25,48,'Pride and Prejudice is a classic and beautifully written novel that explores themes of love, societal norms, and personal growth.','2023-03-15','5',NULL),(26,49,'The Catcher in the Rye is a coming-of-age novel that captures the disillusionment and alienation of the protagonist.','2023-04-28','4',NULL),(27,50,'The Hobbit is a delightful and adventurous tale set in the world of Middle-earth.','2023-02-22','2',NULL),(28,51,'Brave New World is a thought-provoking dystopian novel that explores themes of technology, society, and individuality.','2023-05-05','4',NULL),(29,52,'The Lord of the Rings is an epic fantasy trilogy that takes readers on a journey through a richly detailed and immersive world.','2023-01-08','5',NULL),(30,11,'A Game of Thrones is an immersive and epic fantasy series filled with complex characters and political intrigue.','2023-02-20','1',NULL),(31,12,'The Fault in Our Stars is a heart-wrenching and beautifully written novel about love, loss, and the power of human connection.','2023-03-18','4',NULL),(32,13,'Gone Girl is a gripping psychological thriller with twists and turns that keep you guessing until the very end.','2023-04-10','3',NULL),(33,14,'The Chronicles of Narnia is a beloved fantasy series that takes readers on a magical journey through a world of imagination.','2023-05-05','4',NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_name` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `street_number` int(10) unsigned NOT NULL,
  `postal_code` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `principal_lastname` varchar(45) NOT NULL,
  `principal_firstname` varchar(45) NOT NULL,
  `school_admin_lastname` varchar(45) NOT NULL,
  `school_admin_firstname` varchar(45) NOT NULL,
  `pending_flag` enum('pending') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`school_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`postal_code` > 9999 and `postal_code` < 100000)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Maplewood Elementary School','Springfield','Oak Avenue',12,12345,'maplewood@gmail.com','Johnson','Emily','Smith','Jennifer',NULL,'2023-06-08 10:39:53'),(2,'Willowbrook High School','Harrisonburg','Willow Street',30,54321,'willowbrook@gmail.com','Anderson','Michael','Brown','Jessica',NULL,'2023-06-08 10:39:53'),(3,'Cedar Ridge Middle School','Wilmington','Cedar Lane',50,67890,'cedarridge@gmail.com','Davis','Sarah','Wilson','David',NULL,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER unique_principal_trigger BEFORE INSERT ON school
FOR EACH ROW
BEGIN
  DECLARE principal_count INT;
  
  SET principal_count = (
    SELECT COUNT(*) FROM school
    WHERE principal_lastname = NEW.principal_lastname
    AND principal_firstname = NEW.principal_firstname
  );
  
  IF principal_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The same principal cannot be assigned to multiple schools.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `school_applications`
--

DROP TABLE IF EXISTS `school_applications`;
/*!50001 DROP VIEW IF EXISTS `school_applications`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `school_applications` AS SELECT 
 1 AS `school_id`,
 1 AS `school_name`,
 1 AS `city`,
 1 AS `street`,
 1 AS `postal_code`,
 1 AS `email`,
 1 AS `principal_lastname`,
 1 AS `principal_firstname`,
 1 AS `school_admin_lastname`,
 1 AS `school_admin_firstname`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `user_email`,
 1 AS `user_firstname`,
 1 AS `user_lastname`,
 1 AS `user_date_of_birth`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `school_phone`
--

DROP TABLE IF EXISTS `school_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_phone` (
  `phone` varchar(10) NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `phone_flag` enum('pending') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phone`,`school_id`),
  KEY `fk_school_id` (`school_id`),
  CONSTRAINT `fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_phone`
--

LOCK TABLES `school_phone` WRITE;
/*!40000 ALTER TABLE `school_phone` DISABLE KEYS */;
INSERT INTO `school_phone` VALUES ('3572212345',1,NULL,'2023-06-08 10:39:53'),('3572232165',3,NULL,'2023-06-08 10:39:53'),('3572245678',2,NULL,'2023-06-08 10:39:53'),('3572278912',3,NULL,'2023-06-08 10:39:53'),('3572298765',1,NULL,'2023-06-08 10:39:53');
/*!40000 ALTER TABLE `school_phone` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER phone_length_trigger BEFORE INSERT ON school_phone
FOR EACH ROW
BEGIN
  IF CHAR_LENGTH(NEW.phone) != 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number must be 10 digits.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `all_schools`
--

/*!50001 DROP VIEW IF EXISTS `all_schools`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_schools` AS select `school`.`school_id` AS `school_id`,`school`.`school_name` AS `school_name` from `school` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_user_application`
--

/*!50001 DROP VIEW IF EXISTS `new_user_application`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_user_application` AS select `lib_user`.`user_id` AS `user_id`,`lib_user`.`user_pwd` AS `user_pwd`,`lib_user`.`user_name` AS `user_name`,`lib_user`.`school_id` AS `school_id`,`lib_user`.`role_name` AS `role_name`,`lib_user`.`user_email` AS `user_email`,`lib_user`.`user_firstname` AS `user_firstname`,`lib_user`.`user_lastname` AS `user_lastname`,`lib_user`.`user_date_of_birth` AS `user_date_of_birth`,`lib_user`.`user_pending_flag` AS `user_pending_flag`,`lib_user`.`last_update` AS `last_update` from `lib_user` where `lib_user`.`user_pending_flag` = 'waiting' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `school_applications`
--

/*!50001 DROP VIEW IF EXISTS `school_applications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `school_applications` AS select `s`.`school_id` AS `school_id`,`s`.`school_name` AS `school_name`,`s`.`city` AS `city`,`s`.`street` AS `street`,`s`.`postal_code` AS `postal_code`,`s`.`email` AS `email`,`s`.`principal_lastname` AS `principal_lastname`,`s`.`principal_firstname` AS `principal_firstname`,`s`.`school_admin_lastname` AS `school_admin_lastname`,`s`.`school_admin_firstname` AS `school_admin_firstname`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_email` AS `user_email`,`u`.`user_firstname` AS `user_firstname`,`u`.`user_lastname` AS `user_lastname`,`u`.`user_date_of_birth` AS `user_date_of_birth` from (`school` `s` join `lib_user` `u` on(`s`.`school_id` = `u`.`school_id`)) where `s`.`pending_flag` = 'pending' and `u`.`user_pending_flag` = 'waiting' and `u`.`role_name` = 'admin' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 13:52:58
