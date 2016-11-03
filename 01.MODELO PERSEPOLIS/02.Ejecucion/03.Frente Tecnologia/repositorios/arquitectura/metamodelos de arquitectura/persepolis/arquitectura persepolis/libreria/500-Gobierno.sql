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
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (33, 'Cumplimiento de Metas del PDM', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (34, 'Rendición de Cuentas de la Gestión Municipal', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (35, 'PES del Presupuesto anual municipal', @servicio+1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (231, 33, 'Dar cuenta de los logros mensuales y anuales del PMD');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (232, 33, 'Generación de Información para la planificación y la toma de decisiones');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (233, 33, 'Medición en tiempo real del avance del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (234, 33, 'Medición y explicación de la capacidad de Administración Municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (235, 33, 'Focalización de recursos y acciones de asistencia técnica de la Administración municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (236, 34, 'Informar sobre el desarrollo de gestión a la ciudadanía');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (237, 34, 'Difundir el plan de desarrollo del municipio');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (238, 34, 'Facilita la participación de los ciudadanos en la elaboración y ejecución del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (239, 35, 'Apoyar y mejorar la Programación del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (240, 35, 'Apoyar y mejorar la Ejecución del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (241, 35, 'Apoyar y mejorar el Seguimiento del presupuesto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (501, 'SOLX501 PRES', 'Presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (502, 'SOLX502 RCGM', 'Transparencia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (231, 501);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (236, 502);

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
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (501, 501, 'Funcionalidad', 'SOLX501 PRES');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (502, 502, 'Servicio Especial', 'SOLX502 RCGM');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (501, 'Seguimiento al Día', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (502, 'Cuentas Claras Gestion Mcpal.', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (501, 501);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (502, 502);



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (501, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (502, 2);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (501, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (502, 1);

COMMIT;

