USE `persepolis.proyecto.solucion`;

-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

-- Aplicaciones
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (1, 'C0-01. Función o App Movil', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (2, 'C0-02. App Web Interacción Estándar', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 7800000, plazo_aproximado = 3;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (3, 'C0-03. Punto Recepción datos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (4, 'C0-04. Punto de Integración con <<SI Oficial>>', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (5, 'C0-05. Punto Recepción datos SI Externo', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (6, 'C0-06. Punto de Integración con PERSEPOLIS', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 6500000, plazo_aproximado = 2.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (7, 'C0-07. Punto Recepción datos PERSEPOLIS', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (9, 'C0-09. App. Web Informativa', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (10, 'C0-10. App. Web Informe de Eventos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (11, 'C0-11. App. Web Informe Operativo', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;

-- Infraestructura de Software (software base)
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (12, 'C0-12. <<Servidor de Applicaciones Linux>> Integración', 'Sofware Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (13, 'CO-13. <<Servidor de Applicaciones Linux>> Aplicación Web Estándar', 'Sofware Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (15, 'C0-15. <<Servidor de Base de Datos>> MSSQL', 'Software Base', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (18, 'C0-18. <<Servidor de Applicaciones RHES / Windows>> Tablero de Control', 'Sofware Base', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (19, 'CO-19. <<Servidor de Applicaciones Linux>> Aplicación Web Especializada', 'Sofware Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (33, 'C0-33. <<Servidor de Análisis de Datos>> MSAS', 'Software Base', 1000000, 1) on duplicate key update costo_aproximado = 400000, plazo_aproximado = 0;

-- Dispositivos
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (20, 'CO-20. <<Certificado>> SSL 256-bits', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 1800000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (21, 'CO-21. <<ADSL>> 20 Mbits', 'Comunicación', 1000000, 1) on duplicate key update costo_aproximado = 2200000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (22, 'CO-22. <<Switch>> Linksys', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 800000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (23, 'CO-23. <<Firewall>> Huawei C3', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 6000000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (24, 'CO-24. <<Servidor de Applicaciones Linux>> Balanceador', 'Dispositivo', 1000000, 1) on duplicate key update componente = 'CO-24. <<Dispositivo>> Balanceador - Servidor de Applicaciones Linux', costo_aproximado = 400000, plazo_aproximado = 0;

-- Otros CF (componentes fundamentales)
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (26, 'C0-26. ESB', 'Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (29, 'CO-29. Dispositivo móvil', 'Dispositivo', 1000000.34, 1) on duplicate key update costo_aproximado = 520000, plazo_aproximado = 0.2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (31, 'CO-31. Canal Internet', 'Comunicación', 1000000, 1) on duplicate key update costo_aproximado = 4000000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (34, 'C0-34. Analítica de datos y eventos relacionados', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (56, 'C0-56. Propagador de Mensaje', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (57, 'C0-57. UPS 5 KVA', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 2100000, plazo_aproximado = 0;

commit;



-- Nivel Medio: 32GB, 3T, 4 Cores
