-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestorordenesypagos
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `ciudad_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ciudad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `segundoNombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `numeroTelefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `nombreEmpresa` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  `contraseña` char(30) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,'Mario Hernandez','1234');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `orden_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(30) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL,
  `fechaPickUp` date DEFAULT NULL,
  `fechaDelivery` date DEFAULT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `direccionPickUP` varchar(200) DEFAULT NULL,
  `direccionDelivery` varchar(200) DEFAULT NULL,
  `totalTarifa` decimal(10,2) DEFAULT NULL,
  `totalPagoDriver` decimal(10,2) DEFAULT NULL,
  `totalBrokerFee` decimal(10,2) DEFAULT NULL,
  `millas` int DEFAULT NULL,
  `pagadoEn` varchar(60) DEFAULT NULL,
  `vehiculo_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `ciudades_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`orden_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `ciudades_id` (`ciudades_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`),
  CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `ordenes_ibfk_3` FOREIGN KEY (`ciudades_id`) REFERENCES `ciudades` (`ciudad_id`),
  CONSTRAINT `ordenes_ibfk_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_ciudades`
--

DROP TABLE IF EXISTS `ordenes_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_ciudades` (
  `ordenes_ciudades_id` int NOT NULL,
  `ciudades_ciudad_id` int NOT NULL,
  PRIMARY KEY (`ordenes_ciudades_id`,`ciudades_ciudad_id`),
  KEY `ciudades_ciudad_id` (`ciudades_ciudad_id`),
  CONSTRAINT `ordenes_ciudades_ibfk_1` FOREIGN KEY (`ordenes_ciudades_id`) REFERENCES `ordenes` (`orden_id`),
  CONSTRAINT `ordenes_ciudades_ibfk_2` FOREIGN KEY (`ciudades_ciudad_id`) REFERENCES `ciudades` (`ciudad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_ciudades`
--

LOCK TABLES `ordenes_ciudades` WRITE;
/*!40000 ALTER TABLE `ordenes_ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes_ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_vehiculos`
--

DROP TABLE IF EXISTS `ordenes_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_vehiculos` (
  `ordenes_vehiculo_id` int NOT NULL,
  `vehiculos_vehiculo_id` int NOT NULL,
  PRIMARY KEY (`ordenes_vehiculo_id`,`vehiculos_vehiculo_id`),
  KEY `vehiculos_vehiculo_id` (`vehiculos_vehiculo_id`),
  CONSTRAINT `ordenes_vehiculos_ibfk_1` FOREIGN KEY (`ordenes_vehiculo_id`) REFERENCES `ordenes` (`orden_id`),
  CONSTRAINT `ordenes_vehiculos_ibfk_2` FOREIGN KEY (`vehiculos_vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_vehiculos`
--

LOCK TABLES `ordenes_vehiculos` WRITE;
/*!40000 ALTER TABLE `ordenes_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registropago`
--

DROP TABLE IF EXISTS `registropago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registropago` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `fechaDeRecibido` date DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `metodoPago` varchar(25) DEFAULT NULL,
  `orden_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `orden_id` (`orden_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `registropago_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`orden_id`),
  CONSTRAINT `registropago_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `registropago_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registropago`
--

LOCK TABLES `registropago` WRITE;
/*!40000 ALTER TABLE `registropago` DISABLE KEYS */;
/*!40000 ALTER TABLE `registropago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodetransporte`
--

DROP TABLE IF EXISTS `tipodetransporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodetransporte` (
  `tipoDeTransporte_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tipoDeTransporte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodetransporte`
--

LOCK TABLES `tipodetransporte` WRITE;
/*!40000 ALTER TABLE `tipodetransporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodetransporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `contraseña` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'Mario Hernandez','$2b$10$pJodY1SuLAqfMwWxW7KzQ.r8lEzg2HsEhQUsK/6D7cYpQM6weo60.'),(4,'Victorino Godoy','$2b$10$tiZbfw1MP9CKBnLfCWpo/ODZI9x5KR5ukEdUugV3f8CqODt4cZ7Oy');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `vehiculo_id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(60) DEFAULT NULL,
  `modelo` varchar(60) DEFAULT NULL,
  `año` int DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `esOperable` varchar(3) DEFAULT NULL,
  `nota` varchar(300) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `ancho` double DEFAULT NULL,
  `alto` double DEFAULT NULL,
  `idTiposDeTransporte` int DEFAULT NULL,
  PRIMARY KEY (`vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-10 23:49:46
