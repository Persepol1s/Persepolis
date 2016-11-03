
-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` VALUES (1, 'NEC', 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com') on duplicate key update proveedor = rtrim (proveedor);
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` VALUES (2, 'OyG', 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com') on duplicate key update proveedor = rtrim (proveedor);

COMMIT;

