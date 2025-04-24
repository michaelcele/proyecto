-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `descripcion` text,
  `reserva` tinyint(1) DEFAULT NULL,
  `prestamo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'Cien años de soledad','Gabriel García Márquez ','978-0307474727','Historia multigeneracional de la familia Buendía en Macondo.',1,1),(2,'1984','George Orwell','978-0451524935','Distopía sobre un régimen totalitario y la vigilancia masiva.',1,0),(3,'Orgullo y prejuicio','Jane Austen','978-0141439518','Romance y crítica social en la Inglaterra del siglo XIX.',0,1),(4,'El Gran Gatsby','F. Scott Fitzgerald','978-0743273565','Tragedia sobre el sueño americano y la decadencia moral.',0,1),(5,'Don Quijote de la Mancha','Miguel de Cervantes','978-8424917834','Aventuras de un hidalgo que se cree caballero andante.',1,1),(6,'Harry Potter y la piedra filosofal','J.K. Rowling','978-0590353403','Inicio de la saga del joven mago Harry Potter.',1,0),(7,'Los juegos del hambre','Suzanne Collins','978-0439023481','Distopía juvenil con una lucha por la supervivencia televisada.',1,1),(8,'Matar a un ruiseñor','Harper Lee','978-0446310789','Drama sobre la injusticia racial en el sur de Estados Unidos.',0,1),(9,'El Señor de los Anillos: La Comunidad del Anillo','J.R.R. Tolkien','978-0618260274','Inicio de la épica aventura para destruir el Anillo Único.',1,1),(10,'Crónica de una muerte anunciada','Gabriel García Márquez','978-0307389717','Relato sobre un asesinato preanunciado en un pueblo caribeño.',1,1),(11,'Revista National Geographic - Abril 2025','Varios Autores','ISSN 0027-9358','Artículo principal sobre la exploración de cuevas submarinas.',1,1),(12,'Time Magazine - Semana del 20 de Abril de 2025','Varios Autores','ISSN 0040-781X','Análisis de las tensiones geopolíticas actuales.',0,1),(13,'Nature - Volumen 630, Número 8018','Varios Autores','ISSN 0028-0836','Investigación sobre nuevos avances en inteligencia artificial.',0,1),(14,'The Economist - 19-25 de Abril de 2025','Varios Autores','ISSN 0013-0613','Debate sobre el futuro de la energía renovable.',0,1),(15,'Science - Volumen 388, Número 6747','Varios Autores','ISSN 0036-8075','Descubrimientos recientes en la física de partículas.',1,0),(16,'El código Da Vinci','Dan Brown','978-0307474277','Thriller de misterio con simbología religiosa.',1,1),(17,'La sombra del viento','Carlos Ruiz Zafón','978-8408060302','Misterio literario ambientado en la Barcelona de posguerra.',1,1),(18,'Cazadores de sombras: Ciudad de hueso','Cassandra Clare','978-8408086999','Inicio de una saga de fantasía urbana con ángeles y demonios.',1,1),(19,'Dune','Frank Herbert','978-0441013593','Epopeya de ciencia ficción sobre un planeta desértico y su especia melange.',1,1),(20,'Fundación','Isaac Asimov','978-0553803712','Inicio de una saga de ciencia ficción sobre el colapso de un imperio galáctico.',1,0),(21,'Sapiens: De animales a dioses','Yuval Noah Harari','978-0062316097','Historia de la humanidad desde una perspectiva evolutiva.',1,0),(22,'Homo Deus: Breve historia del mañana','Yuval Noah Harari','978-0062464316','Reflexiones sobre el futuro de la humanidad y la inteligencia artificial.',1,1),(23,'Breves respuestas a las grandes preguntas','Stephen Hawking','978-1984853582','Reflexiones póstumas sobre el universo y la existencia.',1,1),(24,'Cosmos','Carl Sagan','978-0345539434','Divulgación científica sobre el universo y nuestro lugar en él.',1,0),(25,'El alquimista','Paulo Coelho','978-0061122415','Fábula sobre la búsqueda del destino personal.',1,1),(26,'Veronika decide morir','Paulo Coelho','978-0061122422','Novela sobre una joven que redescubre el valor de la vida.',1,1),(27,'El retrato de Dorian Gray','Oscar Wilde','978-0141439570','Novela sobre la belleza, la moralidad y la corrupción.',1,1),(28,'Frankenstein','Mary Shelley','978-0141439471','Clásico de terror gótico sobre la creación de vida.',1,1),(29,'Drácula','Bram Stoker','978-0486414396','Novela epistolar sobre el famoso vampiro.',1,1),(30,'Sherlock Holmes: Estudio en escarlata','Arthur Conan Doyle','978-0141439617','Primera aparición del famoso detective Sherlock Holmes.',1,1),(31,'Revista Muy Interesante - Mayo 2025','Varios Autores','ISSN 1132-0678','Artículo sobre los últimos descubrimientos arqueológicos.',0,1),(32,'Quo - Junio 2025','Varios Autores','ISSN 1130-1710','Reportaje sobre los avances en la medicina regenerativa.',1,0),(33,'National Geographic Traveler - Verano 2025','Varios Autores','ISSN 1551-3228','Guía de destinos turísticos sostenibles.',1,1),(34,'Condé Nast Traveler - Mayo 2025','Varios Autores','ISSN 0890-9611','Artículos sobre hoteles de lujo y experiencias de viaje únicas.',1,1),(35,'The New Yorker - 28 de Abril de 2025','Varios Autores','ISSN 0028-792X','Análisis político y cultural de actualidad.',0,1),(36,'Harper\'s Magazine - Mayo 2025','Varios Autores','ISSN 0017-789X','Ensayos y artículos sobre literatura, política y sociedad.',1,1),(37,'The Atlantic - Mayo 2025','Varios Autores','ISSN 1072-7825','Artículos de fondo sobre temas de actualidad y cultura.',1,1),(38,'Esquire - Junio 2025','Varios Autores','ISSN 0194-9535','Artículos sobre estilo de vida, cultura y entretenimiento masculino.',1,1),(39,'Vogue - Mayo 2025','Varios Autores','ISSN 0042-8000','Tendencias de moda y estilo.',1,1),(40,'Elle - Junio 2025','Varios Autores','ISSN 0013-6398','Artículos sobre moda, belleza y estilo de vida femenino.',1,1);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglas`
--

DROP TABLE IF EXISTS `reglas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglas` (
  `id_regla` int NOT NULL AUTO_INCREMENT,
  `dias` int NOT NULL,
  `multa` double NOT NULL,
  PRIMARY KEY (`id_regla`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas`
--

LOCK TABLES `reglas` WRITE;
/*!40000 ALTER TABLE `reglas` DISABLE KEYS */;
INSERT INTO `reglas` VALUES (1,4,5000);
/*!40000 ALTER TABLE `reglas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','contrasena1234','administrador'),(2,'juan.perez','secreto456','usuario'),(3,'maria.gomez','clave789','usuario'),(4,'editor1','mypassword','editor'),(5,'ana.lopez','otraclave','usuario'),(6,'invitado01','segura123','invitado');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 21:37:41
