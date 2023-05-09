-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'To Kill a Mockingbird','Harper Lee',12.99,25,'HarperCollins','1960-07-11','9780446310789','Fiction',4.3,'This novel is a story of a young girl growing up in the South during the Depression, and the racial inequality she witnesses.'),(2,'1984','George Orwell',9.99,20,'Penguin','1949-06-08','9780451524935','Fiction',4.6,'A dystopian novel set in a world where government surveillance is constant and independent thought is a crime.'),(3,'Brave New World','Aldous Huxley',11.99,15,'HarperCollins','1932-10-27','9780060850524','Fiction',4.0,'A classic science fiction novel that depicts a future society where people are genetically engineered and conditioned to be content with their assigned social status.'),(4,'Sapiens: A Brief History of Humankind','Yuval Noah Harari',16.99,10,'Random House','2011-02-10','9780062316097','Non-Fiction',4.5,'This book provides an overview of the history of the human species, from the emergence of Homo sapiens in Africa to the present day.'),(5,'The Immortal Life of Henrietta Lacks','Rebecca Skloot',14.99,10,'Crown Publishing','2010-02-02','9781400052189','Non-Fiction',4.4,'This book tells the story of Henrietta Lacks, a woman whose cancer cells were used without her knowledge for scientific research and became one of the most important tools in medicine.'),(6,'The Power of Habit','Charles Duhigg',10.99,20,'Random House','2012-02-28','9780812981605','Non-Fiction',4.2,'This book examines the science behind habits and how they can be changed to improve personal and professional success.'),(7,'The Hunger Games','Suzanne Collins',8.99,30,'Scholastic','2008-09-14','9780439023481','Young Adult',4.8,'In a dystopian future, teenagers are selected from their districts to fight to the death in an annual televised event.'),(8,'The Fault in Our Stars','John Green',7.99,40,'Dutton Books','2012-01-10','9780525478812','Young Adult',4.5,'A heartbreaking novel about two teenagers with terminal cancer who fall in love and grapple with the meaning of life and death.'),(9,'Ender\'s Game','Orson Scott Card',10.99,25,'Tor Books','1985-01-15','9780812550702','Young Adult',4.3,'A science fiction novel about a young boy named Ender Wiggin who is trained to become a military commander in a future war against an alien race.'),(10,'The Alchemist','Paulo Coelho',12.99,15,'HarperCollins','1988-01-01','9780062315007','Fiction',4.7,'A philosophical novel about a shepherd named Santiago who goes on a journey to find his personal legend.'),(11,'The Catcher in the Rye','J.D. Salinger',9.99,20,'Little, Brown and Company','1951-07-16','9780316769174','Fiction',4.1,'A classic novel about a teenage boy named Holden Caulfield who is expelled from his prep school and goes on a journey of self-discovery.'),(12,'The Great Gatsby','F. Scott Fitzgerald',10.99,25,'Scribner','1925-04-10','9780743273565','Fiction',4.5,'A classic novel about the American Dream and the corrupting influence of wealth and privilege.'),(13,'Pride and Prejudice','Jane Austen',7.99,30,'Penguin','1813-01-28','9780141439518','Fiction',4.3,'A classic novel about the complex relationships between men and women in 19th-century England.'),(14,'The Picture of Dorian Gray','Oscar Wilde',8.99,35,'Penguin','1890-07-01','9780141439570','Fiction',4.4,'A novel about a young man named Dorian Gray who sells his soul for eternal youth and beauty, and the consequences of his actions.'),(15,'The Name of the Wind','Patrick Rothfuss',11.99,15,'DAW Books','2007-03-27','9780756404741','Fantasy',4.6,'A fantasy novel about a legendary wizard named Kvothe who recounts his life story to a scribe.'),(16,'The Fellowship of the Ring','J.R.R. Tolkien',14.99,10,'Houghton Mifflin','1954-07-29','9780618346257','Fantasy',4.7,'The first book in the Lord of the Rings trilogy, about the journey of Frodo Baggins and his companions to destroy the One Ring.'),(17,'The Hitchhiker\'s Guide to the Galaxy','Douglas Adams',9.99,20,'Pan Books','1979-10-12','9780330508117','Science Fiction',4.2,'A humorous science fiction novel about an unwitting human and his alien friend who travel through space and time.'),(18,'Dune','Frank Herbert',12.99,15,'Chilton Books','1965-08-01','9780441013593','Science Fiction',4.5,'A science fiction novel about a desert planet named Arrakis and the struggle for control of its valuable spice.'),(19,'Einstein: His Life and Universe','Walter Isaacson',16.99,10,'Simon & Schuster','2007-04-10','9780743264747','Biography',4.6,'A biography of the life and achievements of Albert Einstein, one of the most influential scientists of the 20th century.');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','member','owner') NOT NULL DEFAULT 'member',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','john.doe@example.com','password123','admin'),(2,'Jane Smith','jane.smith@example.com','password456','owner'),(3,'Bob Johnson','bob.johnson@example.com','password789','member'),(4,'Mary Brown','mary.brown@example.com','passwordabc','member'),(5,'David Lee','david.lee@example.com','passworddef','member');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 11:20:42
