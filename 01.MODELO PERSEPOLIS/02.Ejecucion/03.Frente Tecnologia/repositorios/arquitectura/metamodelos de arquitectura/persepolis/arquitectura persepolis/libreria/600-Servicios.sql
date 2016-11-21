SET @vertical = 600;
SET @servicio = @vertical;
SET @especializado = @vertical;
SET @funcionalidad = @vertical;
SET @solucion = @vertical;
SET @caracteristica = @vertical;
SET @implementacion = @vertical;



-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.solucion
	where idsolucion in (
	select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
	where funcionalidad_idfuncionalidad in (
		select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
		where s_especializado_ids_especializado in (
			select ids_especializado from `persepolis.servicio.vertical`.s_especializado
			where servicio_idservicio in (
				select idservicio from `persepolis.servicio.vertical`.servicio
				where vertical_idvertical = @vertical
			)
		)
	)
)
and idsolucion > 0;

COMMIT;


START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = @vertical;

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (@vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio, 'Gestión', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+1, 'Agua', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+2, 'Alcantarillado', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+3, 'Energía Eléctrica', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+4, 'Gas', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+5, 'Servicios Funerarios', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+7, 'Servicios Públicos por Demanda', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+8, 'Aseo', @vertical);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado, 'Gestión de usuarios servicios públicos', @servicio);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad, @especializado, 'Catastro de usuarios servicios públicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+1, @especializado, 'Georeferencia de redes de servicios');


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion, 'SOLX19 SCUU', 'Sistema de catastro único de usuarios de servicios públicos') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+1, 'SOLX20 SIGRS', 'Sistema de información georeferencial de redes de servicios') on duplicate key update solucion = rtrim(solucion);


COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad, @solucion);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+1, @solucion+1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from `persepolis.proyecto.solucion`.implementacion_has_proveedor
where implementacion_idimplementacion in (
	select idimplementacion from `persepolis.proyecto.solucion`.implementacion
	where idimplementacion in (
		select implementacion_idimplementacion from `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion
		where requerimiento_caracteristica_idrequerimiento_caracteristica in (
			select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
			where solucion_idsolucion in (
				select idsolucion from `persepolis.servicio.vertical`.solucion
				where idsolucion in (
                	select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
					where funcionalidad_idfuncionalidad in (
						select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
						where s_especializado_ids_especializado in (
							select ids_especializado from `persepolis.servicio.vertical`.s_especializado
							where servicio_idservicio in (
								select idservicio from `persepolis.servicio.vertical`.servicio
								where vertical_idvertical = @vertical 
							)
						)
					)
				)
			)
		)
	)
)
and implementacion_idimplementacion > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.proyecto.solucion`;

delete from `persepolis.proyecto.solucion`.implementacion_has_componente
where implementacion_idimplementacion in (
	select idimplementacion from `persepolis.proyecto.solucion`.implementacion
	where idimplementacion in (
		select implementacion_idimplementacion from `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion
		where requerimiento_caracteristica_idrequerimiento_caracteristica in (
			select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
			where solucion_idsolucion in (
				select idsolucion from `persepolis.servicio.vertical`.solucion
				where idsolucion in (
				select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
				where funcionalidad_idfuncionalidad in (
					select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
					where s_especializado_ids_especializado in (
						select ids_especializado from `persepolis.servicio.vertical`.s_especializado
						where servicio_idservicio in (
							select idservicio from `persepolis.servicio.vertical`.servicio
							where vertical_idvertical = @vertical 
							)
						)
					)
				)
			)
		)
	)
)
and implementacion_idimplementacion > 0;

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
			where idsolucion in (
            select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
            where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = @vertical 
						)
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
			where idsolucion in (
            select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
            where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = @vertical 
				)
			)
		)
	)
)
and idrequerimiento_caracteristica > 0;

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica, @solucion, 'Funcionalidad', 'SOL19 SCUU');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+1, @solucion+1, 'Proceso', 'Proceso de levantamiento de redes de servicios');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+2, @solucion+1, 'Actividad', 'Aplicación de captura de localidades de redes de servicios');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion, 'Public Census', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+1, 'Bonita BPMS', null);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+2, 'Geo SPUB', null);

COMMIT;

-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica, @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+1, @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+2, @implementacion+2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+1, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (1, @implementacion, 1, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (2, @implementacion, 2, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (3, @implementacion, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (4, @implementacion, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, @implementacion, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (6, @implementacion, 6, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (7, @implementacion, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (8, @implementacion, 7, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (9, @implementacion, 9, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (10, @implementacion, 10, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (11, @implementacion, 11, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (12, @implementacion, 12, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (13, @implementacion, 12, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (14, @implementacion, 12, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (15, @implementacion, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (16, @implementacion, 13, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (17, @implementacion, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (18, @implementacion, 18, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (19, @implementacion, 19, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (20, @implementacion, 33, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (21, @implementacion, 20, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (22, @implementacion, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (23, @implementacion, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (24, @implementacion, 22, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (25, @implementacion, 23, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (26, @implementacion, 24, 1);

INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (30, @implementacion+1, 2, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (31, @implementacion+1, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (32, @implementacion+1, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (33, @implementacion+1, 7, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (34, @implementacion+1, 9, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (35, @implementacion+1, 10, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (36, @implementacion+1, 11, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (37, @implementacion+1, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (38, @implementacion+1, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (40, @implementacion+1, 12, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (41, @implementacion+1, 13, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (42, @implementacion+1, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (44, @implementacion+1, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (45, @implementacion+1, 18, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (46, @implementacion+1, 19, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (47, @implementacion+1, 33, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (48, @implementacion+1, 20, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (49, @implementacion+1, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (50, @implementacion+1, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (51, @implementacion+1, 22, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (52, @implementacion+1, 23, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (53, @implementacion+1, 24, 1);


INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (30, @implementacion+2, 2, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (31, @implementacion+2, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (32, @implementacion+2, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (33, @implementacion+2, 7, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (34, @implementacion+2, 9, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (35, @implementacion+2, 10, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (36, @implementacion+2, 11, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (37, @implementacion+2, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (38, @implementacion+2, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (40, @implementacion+2, 12, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (41, @implementacion+2, 13, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (42, @implementacion+2, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (44, @implementacion+2, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (45, @implementacion+2, 18, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (46, @implementacion+2, 19, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (47, @implementacion+2, 33, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (48, @implementacion+2, 20, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (49, @implementacion+2, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (50, @implementacion+2, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (51, @implementacion+2, 22, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (52, @implementacion+2, 23, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (53, @implementacion+2, 24, 1);

COMMIT;

