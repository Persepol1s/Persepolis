-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = 600;

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (600);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (50, 'Gestión', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (51, 'Agua', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (52, 'Alcantarillado', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (53, 'Energía Eléctrica', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (54, 'Gas', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (55, 'Servicios Funerarios', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (56, 'Telefonía', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (57, 'Servicios Públicos por Demanda', 600);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (62, 'Aseo', 600);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (23, 'Gestión de usuarios servicios públicos', 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (296, 23, 'Catastro de usuarios servicios públicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (297, 23, 'Georeferencia de redes de servicios');



-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` (`idsolucion`, `funcionalidad_idfuncionalidad`, `solucion`, `descripcion`) 
VALUES (17, 296, 'SOLX19 SCUU', 'Sistema de catastro único de usuarios de servicios públicos');
INSERT INTO `persepolis.servicio.vertical`.`solucion` (`idsolucion`, `funcionalidad_idfuncionalidad`, `solucion`, `descripcion`) 
VALUES (18, 297, 'SOLX20 SIGRS', 'Sistema de información georeferencial de redes de servicios');


COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from componente 
where idcomponente in (
	select componente_idcomponente from implementacion_has_componente
	where implementacion_idimplementacion in (
		select idimplementacion from implementacion
		where idimplementacion in (
			select implementacion_idimplementacion from requerimiento_caracteristica_has_implementacion
			where requerimiento_caracteristica_idrequerimiento_caracteristica in (
				select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
				where solucion_idsolucion in (
					select idsolucion from `persepolis.servicio.vertical`.solucion
					where funcionalidad_idfuncionalidad in (
						select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
						where s_especializado_ids_especializado in (
							select ids_especializado from `persepolis.servicio.vertical`.s_especializado
							where servicio_idservicio in (
								select idservicio from `persepolis.servicio.vertical`.servicio
								where vertical_idvertical = 600
								)
						)
					)
				)
			)
		)
	)
)
and idcomponente > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from implementacion
where idimplementacion in (
	select implementacion_idimplementacion from requerimiento_caracteristica_has_implementacion
	where requerimiento_caracteristica_idrequerimiento_caracteristica in (
		select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
		where solucion_idsolucion in (
			select idsolucion from `persepolis.servicio.vertical`.solucion
			where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = 600
						)
				)
			)
		)
	)
)
and idimplementacion > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from requerimiento_caracteristica
where solucion_idsolucion in (
	select idsolucion from `persepolis.servicio.vertical`.solucion
	where funcionalidad_idfuncionalidad in (
		select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
		where s_especializado_ids_especializado in (
			select ids_especializado from `persepolis.servicio.vertical`.s_especializado
			where servicio_idservicio in (
				select idservicio from `persepolis.servicio.vertical`.servicio
				where vertical_idvertical = 600
				)
		)
	)
)
and idrequerimiento_caracteristica > 0;

delete from componente
where idcomponente > 0;

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (41, 17, 'Funcionalidad', 'SOL19 SCUU');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (42, 18, 'Proceso', 'Proceso de levantamiento de redes de servicios');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (43, 18, 'Actividad', 'Aplicación de captura de localidades de redes de servicios');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` 
VALUES (1, 'Public Census', null);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` 
VALUES (2, 'Bonita BPMS', null);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` 
VALUES (3, 'Geo SPUB', null);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (41, 1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (42, 2);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (43, 3);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) VALUES (1, 'NEC', 1, 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com');
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) VALUES (2, 'Bonita Soft', 2, 'Bogota DC', '65555555', 'John Appleseed', 'ja@bonita.com');
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) VALUES (3, 'Redapp Soft', 3, 'Bogota DC', '75555555', 'John Appleseed', 'ja@redapp.com');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (1, 'ESB', 'Integración', 450000000.34, 6);
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (3, 'Servidor Aplicaciones', 'Software Base', 150000000.34, 3);
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (4, 'RDBMS', 'Software Base', 170000000.34, 3);
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (5, 'Dispositivo móvil', 'Dispositivo', 10000000.34, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (6, 'Servidor de Aplicaciones', 'Software Base', 450000000.34, 5);
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) VALUES (7, 'Canal Internet', 'Comunicación', 450000000.34, 5);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (1, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (2, 3);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (2, 4);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (3, 3);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (3, 4);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (3, 5);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) VALUES (3, 7);

COMMIT;
