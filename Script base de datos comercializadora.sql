-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: scliz
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `pkIdCliente` int NOT NULL AUTO_INCREMENT,
  `correoElectronicoCliente` varchar(50) NOT NULL,
  `estadoCliente` varchar(10) NOT NULL,
  `fkIdEmpresa` int NOT NULL,
  PRIMARY KEY (`pkIdCliente`),
  UNIQUE KEY `correoElectronicoCliente` (`correoElectronicoCliente`),
  UNIQUE KEY `fkIdEmpresa` (`fkIdEmpresa`),
  CONSTRAINT `fkClienteEmpresa` FOREIGN KEY (`fkIdEmpresa`) REFERENCES `empresa` (`pkIdEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcionproducto`
--

DROP TABLE IF EXISTS `descripcionproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descripcionproducto` (
  `pkIdDescripcionProducto` int NOT NULL AUTO_INCREMENT,
  `nombreDescripcionProducto` varchar(20) NOT NULL,
  `estadoDescripcionProducto` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdDescripcionProducto`),
  UNIQUE KEY `nombreDescripcionProducto` (`nombreDescripcionProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcionproducto`
--

LOCK TABLES `descripcionproducto` WRITE;
/*!40000 ALTER TABLE `descripcionproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `descripcionproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefactura` (
  `pkIdDetalleFactura` int NOT NULL AUTO_INCREMENT,
  `cantidadProductoDetalleFactura` int NOT NULL,
  `valorTotalDetalleIVA` decimal(10,2) NOT NULL,
  `valorDetalleFacturaSinIVA` decimal(10,2) NOT NULL,
  `valorProductoDetalleFactura` decimal(10,2) NOT NULL,
  `estadoDetalleFactura` varchar(10) NOT NULL,
  `fkNumeroFactura` int NOT NULL,
  `fkIdProducto` int NOT NULL,
  PRIMARY KEY (`pkIdDetalleFactura`),
  KEY `fkFactura` (`fkNumeroFactura`),
  KEY `fkDetalleFacturaProducto` (`fkIdProducto`),
  CONSTRAINT `fkDetalleFacturaProducto` FOREIGN KEY (`fkIdProducto`) REFERENCES `producto` (`pkIdProducto`),
  CONSTRAINT `fkFactura` FOREIGN KEY (`fkNumeroFactura`) REFERENCES `factura` (`pkNumeroFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleinventario`
--

DROP TABLE IF EXISTS `detalleinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleinventario` (
  `pkIdDetalleInventario` int NOT NULL AUTO_INCREMENT,
  `cantidadProducto` int NOT NULL,
  `fechaMovimientoDetalleInventario` date NOT NULL,
  `valorDetalleInventario` decimal(10,2) NOT NULL,
  `valorUnitarioProductoDetalleInventario` decimal(10,2) NOT NULL,
  `estadoDetalleInventario` varchar(10) NOT NULL,
  `fkIdProducto` int NOT NULL,
  `fkNumeroInventario` int NOT NULL,
  `fkIdMovimientoInventario` int NOT NULL,
  PRIMARY KEY (`pkIdDetalleInventario`),
  KEY `fkDetalleInventarioProducto` (`fkIdProducto`),
  KEY `fkInventario` (`fkNumeroInventario`),
  KEY `fkMovimientoInventario` (`fkIdMovimientoInventario`),
  CONSTRAINT `fkDetalleInventarioProducto` FOREIGN KEY (`fkIdProducto`) REFERENCES `producto` (`pkIdProducto`),
  CONSTRAINT `fkInventario` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `inventario` (`pkNumeroInventario`),
  CONSTRAINT `fkMovimientoInventario` FOREIGN KEY (`fkIdMovimientoInventario`) REFERENCES `movimientoinventario` (`pkIdMovimientoInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleinventario`
--

LOCK TABLES `detalleinventario` WRITE;
/*!40000 ALTER TABLE `detalleinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedido` (
  `pkIdDetallePedido` int NOT NULL AUTO_INCREMENT,
  `cantidadProductoDetallePedido` int NOT NULL,
  `valorTotalDetallePedido` decimal(10,2) NOT NULL,
  `valorGananciaDetallePedido` decimal(10,2) NOT NULL,
  `valorProductoDetallePedido` decimal(10,2) NOT NULL,
  `valorGananciaProductoDetallePedido` decimal(10,2) NOT NULL,
  `valorProductoProveedor` decimal(10,2) NOT NULL,
  `estadoDetallePedido` varchar(10) NOT NULL,
  `fkNumeroPedido` int NOT NULL,
  `fkIdProducto` int NOT NULL,
  PRIMARY KEY (`pkIdDetallePedido`),
  KEY `fkDetallePedidoProducto` (`fkIdProducto`),
  KEY `fkDetallePedidoNumeroPedido` (`fkNumeroPedido`),
  CONSTRAINT `fkDetallePedidoNumeroPedido` FOREIGN KEY (`fkNumeroPedido`) REFERENCES `pedido` (`pkNumeroPedido`),
  CONSTRAINT `fkDetallePedidoProducto` FOREIGN KEY (`fkIdProducto`) REFERENCES `producto` (`pkIdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `pkIdEmpleado` int NOT NULL AUTO_INCREMENT,
  `numeroContactoEmpleado` varchar(10) NOT NULL,
  `estadoEmpleado` varchar(10) NOT NULL,
  `fkIdPersona` int NOT NULL,
  `fkIdUsuario` int DEFAULT NULL,
  `fkIdRol` int NOT NULL,
  PRIMARY KEY (`pkIdEmpleado`),
  UNIQUE KEY `numeroContactoEmpleado` (`numeroContactoEmpleado`),
  UNIQUE KEY `fkIdPersona` (`fkIdPersona`),
  UNIQUE KEY `fkIdUsuario` (`fkIdUsuario`),
  KEY `fkEmpleadoRol` (`fkIdRol`),
  CONSTRAINT `fkEmpleadoPersona` FOREIGN KEY (`fkIdPersona`) REFERENCES `persona` (`pkIdPersona`),
  CONSTRAINT `fkEmpleadoRol` FOREIGN KEY (`fkIdRol`) REFERENCES `rol` (`pkIdRol`),
  CONSTRAINT `fkEmpleadoUsuario` FOREIGN KEY (`fkIdUsuario`) REFERENCES `usuario` (`pkIdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `pkIdEmpresa` int NOT NULL AUTO_INCREMENT,
  `NITEmpresa` varchar(10) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL,
  `numeroContactoEmpresa` varchar(10) NOT NULL,
  `direccionEmpresa` varchar(50) NOT NULL,
  `estadoEmpresa` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdEmpresa`),
  UNIQUE KEY `NITEmpresa` (`NITEmpresa`),
  UNIQUE KEY `nombreEmpresa` (`nombreEmpresa`),
  UNIQUE KEY `numeroContactoEmpresa` (`numeroContactoEmpresa`),
  UNIQUE KEY `direccionEmpresa` (`direccionEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `pkNumeroFactura` int NOT NULL AUTO_INCREMENT,
  `fechaCreacionFactura` date NOT NULL,
  `horaCreacionFactura` time NOT NULL,
  `valorTotalFactura` decimal(10,2) NOT NULL,
  `estadoFactura` varchar(10) NOT NULL,
  `fkIdEmpleado` int NOT NULL,
  `fkIdMetodoPago` int NOT NULL,
  `fkIdCliente` int NOT NULL,
  PRIMARY KEY (`pkNumeroFactura`),
  KEY `fkFacturaEmpleado` (`fkIdEmpleado`),
  KEY `fkMetodoPago` (`fkIdMetodoPago`),
  KEY `fkFacturaCliente` (`fkIdCliente`),
  CONSTRAINT `fkFacturaCliente` FOREIGN KEY (`fkIdCliente`) REFERENCES `cliente` (`pkIdCliente`),
  CONSTRAINT `fkFacturaEmpleado` FOREIGN KEY (`fkIdEmpleado`) REFERENCES `empleado` (`pkIdEmpleado`),
  CONSTRAINT `fkMetodoPago` FOREIGN KEY (`fkIdMetodoPago`) REFERENCES `metodopago` (`pkIdMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `pkIdGerente` int NOT NULL AUTO_INCREMENT,
  `estadoGerente` varchar(10) NOT NULL,
  `fkIdPersona` int NOT NULL,
  `fkIdUsuario` int DEFAULT NULL,
  `fkIdRol` int NOT NULL,
  PRIMARY KEY (`pkIdGerente`),
  UNIQUE KEY `fkIdPersona` (`fkIdPersona`),
  UNIQUE KEY `fkIdUsuario` (`fkIdUsuario`),
  KEY `fkGerenteRol` (`fkIdRol`),
  CONSTRAINT `fkGerentePersona` FOREIGN KEY (`fkIdPersona`) REFERENCES `persona` (`pkIdPersona`),
  CONSTRAINT `fkGerenteRol` FOREIGN KEY (`fkIdRol`) REFERENCES `rol` (`pkIdRol`),
  CONSTRAINT `fkGerenteUsuario` FOREIGN KEY (`fkIdUsuario`) REFERENCES `usuario` (`pkIdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `pkNumeroInventario` int NOT NULL AUTO_INCREMENT,
  `fechaAbiertoInventario` date NOT NULL,
  `fechaCierreInventario` date NOT NULL,
  `valorTotalInventario` decimal(10,2) NOT NULL,
  `estadoInventario` varchar(10) NOT NULL,
  PRIMARY KEY (`pkNumeroInventario`),
  UNIQUE KEY `fechaAbiertoInventario` (`fechaAbiertoInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iva`
--

DROP TABLE IF EXISTS `iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iva` (
  `pkIdIVA` int NOT NULL AUTO_INCREMENT,
  `valorIVA` int NOT NULL,
  `estadoIVA` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdIVA`),
  UNIQUE KEY `valorIVA` (`valorIVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iva`
--

LOCK TABLES `iva` WRITE;
/*!40000 ALTER TABLE `iva` DISABLE KEYS */;
/*!40000 ALTER TABLE `iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcaproducto`
--

DROP TABLE IF EXISTS `marcaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcaproducto` (
  `pkIdMarcaProducto` int NOT NULL AUTO_INCREMENT,
  `nombreMarcaProducto` varchar(20) NOT NULL,
  `estadoMarcaProducto` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdMarcaProducto`),
  UNIQUE KEY `nombreMarcaProducto` (`nombreMarcaProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcaproducto`
--

LOCK TABLES `marcaproducto` WRITE;
/*!40000 ALTER TABLE `marcaproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopago` (
  `pkIdMetodoPago` int NOT NULL AUTO_INCREMENT,
  `nombreMetodoPago` varchar(20) NOT NULL,
  `estadoMetodoPago` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdMetodoPago`),
  UNIQUE KEY `nombreMetodoPago` (`nombreMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopago`
--

LOCK TABLES `metodopago` WRITE;
/*!40000 ALTER TABLE `metodopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoinventario`
--

DROP TABLE IF EXISTS `movimientoinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientoinventario` (
  `pkIdMovimientoInventario` int NOT NULL AUTO_INCREMENT,
  `nombreMovimientoInventario` varchar(10) NOT NULL,
  `estadoMovimientoInventario` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdMovimientoInventario`),
  UNIQUE KEY `nombreMovimientoInventario` (`nombreMovimientoInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoinventario`
--

LOCK TABLES `movimientoinventario` WRITE;
/*!40000 ALTER TABLE `movimientoinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nombreproducto`
--

DROP TABLE IF EXISTS `nombreproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nombreproducto` (
  `pkIdNombreProducto` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(20) NOT NULL,
  `estadoNombreProducto` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdNombreProducto`),
  UNIQUE KEY `nombreProducto` (`nombreProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombreproducto`
--

LOCK TABLES `nombreproducto` WRITE;
/*!40000 ALTER TABLE `nombreproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `nombreproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pkNumeroPedido` int NOT NULL AUTO_INCREMENT,
  `fechaRealizoPedido` date NOT NULL,
  `fechaLlegadaPedido` date DEFAULT NULL,
  `valorTotalPedido` decimal(10,2) DEFAULT NULL,
  `estadoPedido` varchar(10) NOT NULL,
  `fkIdGerente` int NOT NULL,
  `fkIdProveedor` int NOT NULL,
  PRIMARY KEY (`pkNumeroPedido`),
  KEY `fkPedidoGerente` (`fkIdGerente`),
  KEY `fkPedidoProveedor` (`fkIdProveedor`),
  CONSTRAINT `fkPedidoGerente` FOREIGN KEY (`fkIdGerente`) REFERENCES `gerente` (`pkIdGerente`),
  CONSTRAINT `fkPedidoProveedor` FOREIGN KEY (`fkIdProveedor`) REFERENCES `proveedor` (`pkIdProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `pkIdPermiso` int NOT NULL AUTO_INCREMENT,
  `codigoPermiso` varchar(100) NOT NULL,
  `nombrePermiso` varchar(100) NOT NULL,
  `estadoPermiso` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdPermiso`),
  UNIQUE KEY `codigoPermiso` (`codigoPermiso`),
  UNIQUE KEY `nombrePermiso` (`nombrePermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `pkIdPersona` int NOT NULL AUTO_INCREMENT,
  `primerNombrePersona` varchar(45) NOT NULL,
  `segundoNombrePersona` varchar(45) DEFAULT NULL,
  `primerApellidoPersona` varchar(45) NOT NULL,
  `segundoApellidoPersona` varchar(45) DEFAULT NULL,
  `numeroIdentificacionPersona` int NOT NULL,
  `estadoPersona` varchar(10) NOT NULL,
  `fkIdTipoIdentificacion` int NOT NULL,
  PRIMARY KEY (`pkIdPersona`),
  UNIQUE KEY `numeroIdentificacionPersona` (`numeroIdentificacionPersona`),
  KEY `fkTipoIdentificacion` (`fkIdTipoIdentificacion`),
  CONSTRAINT `fkTipoIdentificacion` FOREIGN KEY (`fkIdTipoIdentificacion`) REFERENCES `tipoidentificacion` (`pkIdTipoIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `pkIdProducto` int NOT NULL AUTO_INCREMENT,
  `cantidadStock` int NOT NULL,
  `precioUnitarioProductoSinIVA` decimal(10,2) NOT NULL,
  `precioUnitarioProductoConIVA` decimal(10,2) NOT NULL,
  `estadoProducto` varchar(10) NOT NULL,
  `fkIdIVA` int NOT NULL,
  `fkIdNombreProducto` int NOT NULL,
  `fkIdDescripcionProducto` int NOT NULL,
  `fkIdMarcaProducto` int NOT NULL,
  PRIMARY KEY (`pkIdProducto`),
  KEY `fkIVA` (`fkIdIVA`),
  KEY `fkNombreProducto` (`fkIdNombreProducto`),
  KEY `fkDescripcionProducto` (`fkIdDescripcionProducto`),
  KEY `fkMarcaProducto` (`fkIdMarcaProducto`),
  CONSTRAINT `fkDescripcionProducto` FOREIGN KEY (`fkIdDescripcionProducto`) REFERENCES `descripcionproducto` (`pkIdDescripcionProducto`),
  CONSTRAINT `fkIVA` FOREIGN KEY (`fkIdIVA`) REFERENCES `iva` (`pkIdIVA`),
  CONSTRAINT `fkMarcaProducto` FOREIGN KEY (`fkIdMarcaProducto`) REFERENCES `marcaproducto` (`pkIdMarcaProducto`),
  CONSTRAINT `fkNombreProducto` FOREIGN KEY (`fkIdNombreProducto`) REFERENCES `nombreproducto` (`pkIdNombreProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `pkIdProveedor` int NOT NULL AUTO_INCREMENT,
  `estadoProveedor` varchar(10) NOT NULL,
  `fkIdEmpresa` int NOT NULL,
  PRIMARY KEY (`pkIdProveedor`),
  UNIQUE KEY `fkIdEmpresa` (`fkIdEmpresa`),
  CONSTRAINT `fkProveedorEmpresa` FOREIGN KEY (`fkIdEmpresa`) REFERENCES `empresa` (`pkIdEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `pkIdRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(20) NOT NULL,
  `estadoRol` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdRol`),
  UNIQUE KEY `nombreRol` (`nombreRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolpermiso`
--

DROP TABLE IF EXISTS `rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolpermiso` (
  `pkIdRolPermiso` int NOT NULL AUTO_INCREMENT,
  `estadoRolPermiso` varchar(10) NOT NULL,
  `fkIdRol` int NOT NULL,
  `fkIdPermiso` int NOT NULL,
  PRIMARY KEY (`pkIdRolPermiso`),
  KEY `fkPermiso` (`fkIdPermiso`),
  KEY `fkRol` (`fkIdRol`),
  CONSTRAINT `fkPermiso` FOREIGN KEY (`fkIdPermiso`) REFERENCES `permiso` (`pkIdPermiso`),
  CONSTRAINT `fkRol` FOREIGN KEY (`fkIdRol`) REFERENCES `rol` (`pkIdRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolpermiso`
--

LOCK TABLES `rolpermiso` WRITE;
/*!40000 ALTER TABLE `rolpermiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoidentificacion`
--

DROP TABLE IF EXISTS `tipoidentificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoidentificacion` (
  `pkIdTipoIdentificacion` int NOT NULL AUTO_INCREMENT,
  `nombreTipoIdentificacion` varchar(20) NOT NULL,
  `estadoTipoIdentificacion` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdTipoIdentificacion`),
  UNIQUE KEY `nombreTipoIdentificacion` (`nombreTipoIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoidentificacion`
--

LOCK TABLES `tipoidentificacion` WRITE;
/*!40000 ALTER TABLE `tipoidentificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoidentificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `pkIdUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(20) NOT NULL,
  `contrasenaUsuario` varchar(10) NOT NULL,
  `estadoUsuario` varchar(10) NOT NULL,
  PRIMARY KEY (`pkIdUsuario`),
  UNIQUE KEY `nombreUsuario` (`nombreUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09  9:25:49
