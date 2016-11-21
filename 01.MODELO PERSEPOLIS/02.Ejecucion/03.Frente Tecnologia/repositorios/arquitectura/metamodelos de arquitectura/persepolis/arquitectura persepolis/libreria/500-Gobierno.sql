SET @vertical = 500;
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
INSERT INTO `persepolis.servicio.vertical`.`vertical` VALUES (@vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio, 'Monitoreo Plan de Desarrollo Municipal', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+1, 'Gestión Financiera Municipal', @vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado, 'Cumplimiento de Metas del PDM', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+1, 'Rendición de Cuentas de la Gestión Municipal', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+2, 'PES del Presupuesto anual municipal', @servicio+1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+0, @especializado, 'Dar cuenta de los logros mensuales y anuales del PMD');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+1, @especializado, 'Generación de Información para la planificación y la toma de decisiones');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+2, @especializado, 'Medición en tiempo real del avance del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+3, @especializado, 'Medición y explicación de la capacidad de Administración Municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+4, @especializado, 'Focalización de recursos y acciones de asistencia técnica de la Administración municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+5, @especializado+1, 'Informar sobre el desarrollo de gestión a la ciudadanía');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+6, @especializado+1, 'Difundir el plan de desarrollo del municipio');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+7, @especializado+1, 'Facilita la participación de los ciudadanos en la elaboración y ejecución del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+8, @especializado+2, 'Apoyar y mejorar la Programación del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+9, @especializado+2, 'Apoyar y mejorar la Ejecución del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+10, @especializado+2, 'Apoyar y mejorar el Seguimiento del presupuesto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion, 'SOLX501 PRES', 'Presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+1, 'SOLX502 RCGM', 'Transparencia');

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
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica, @solucion, 'Funcionalidad', 'SOLX501 PRES');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+1, @solucion+1, 'Servicio Especial', 'SOLX502 RCGM');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion, 'Seguimiento al Día', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+1, 'Cuentas Claras Gestion Mcpal.', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica, @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+1, @implementacion+1);



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+1, 2);

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

COMMIT;

