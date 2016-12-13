SET @vertical = 200;
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
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio, 'Seguridad Ciudadana', @vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+0, 'Seguridad Ciudadana', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+1, 'Seguridad Municipio', @servicio);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+0,  @especializado, 'Alertas y Alarmas Electrónicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+1,  @especializado, 'Apoyo electrónico Comisarias');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+2,  @especializado, 'Organización de Juntas Vecinales');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+3,  @especializado, 'Soporte al Observatorio de Contravenciones');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+4,  @especializado, 'Soporte al Red de Vigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+5,  @especializado, 'Seguimiento vehicular (AVL)');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+6,  @especializado, 'Centro Atención Inmediata Móvil (CAI)');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+7,  @especializado, 'Gestión de Hospitales Girardota');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+8,  @especializado, 'Administración Colegio y Asistencia Escolar');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+9,  @especializado, 'Código de Policía');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+10, @especializado, 'Control Motocicletas y Accidentalidad víal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+11, @especializado, 'Emisión Foto-comparendos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+12, @especializado, 'Gestión casos de micro-extorsión');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+13, @especializado, 'Control inventario porte de armas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+14, @especializado, 'Obstrucción de comunicaciones (jammer) para Cárcel');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+15, @especializado, 'Telemetría Medioambiente');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------

START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+0,  'SOLX200 AAE', 'Alertas y Alarmas') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+1,  'SOLX201 COM', 'Comisarias') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+2,  'SOLX202 JVE', 'Juntas Vecinales') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+3,  'SOLX203 OBC', 'Observatorio de Contravenciones') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+4,  'SOLX204 RAP', 'Red de Apoyo a Vigilantes') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+5,  'SOLX205 CTE', 'Control Tenencia de Armas') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+6,  'SOLX206 VVI', 'Mejoramiento Red de Vigilancia') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+7,  'SOLX207 AVL', 'Seguimiento vehicular (AVL)') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+8,  'SOLX208 CAI', 'Centro Atención Inmediata Móvil (CAI)') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+9,  'SOLX209 HOS', 'Gestión de Hospitales Girardota') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+10, 'SOLX210 COL', 'Administración Colegio y Asistencia Escolar') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+11, 'SOLX211 CPO', 'Código de Policía') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+12, 'SOLX212 CMA', 'Control Motocicletas y Accidentalidad víal') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+13, 'SOLX213 EFC', 'Emisión Foto-comparendos') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+14, 'SOLX214 MIC', 'Gestión casos de micro-extorsión') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+15, 'SOLX216 OBS', 'Obstrucción de comunicaciones (jammer) para Cárcel') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+16, 'SOLX217 AMB', 'Telemetría Medioambiente') on duplicate key update solucion = rtrim(solucion);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+0,  @solucion+0);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+1,  @solucion+1);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+2,  @solucion+2);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+3,  @solucion+3);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+4,  @solucion+4);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+5,  @solucion+7);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+6,  @solucion+8);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+7,  @solucion+9);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+8,  @solucion+10);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+9,  @solucion+11);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+10, @solucion+12);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+11, @solucion+13);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+12, @solucion+14);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+13, @solucion+15);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+14, @solucion+16);

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
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+0,  @solucion+0,  'Caracteristica', 'Registro de alarma');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+1,  @solucion+0,  'Caracteristica', 'Seguimiento de alarmas');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+2,  @solucion+0,  'Caracteristica', 'Análisis de datos de Alarmas');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+3,  @solucion+1,  'Caracteristica', 'Registro y Asignación del Caso');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+4,  @solucion+1,  'Caracteristica', 'Actualización o Cierre del Caso');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+5,  @solucion+1,  'Caracteristica', 'Seguimiento del Caso');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+6,  @solucion+2,  'Caracteristica', 'Registro del Evento Vecinal');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+7,  @solucion+2,  'Caracteristica', 'Actualización del Evento de la Junta');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+8,  @solucion+2,  'Caracteristica', 'Consulta del Evento Vecinal');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+9,  @solucion+3,  'Caracteristica', 'Registro de Evento Observado');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+10, @solucion+3,  'Caracteristica', 'Complementa información del Evento');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+11, @solucion+3,  'Caracteristica', 'Persépolis correlaciona Eventos');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+12, @solucion+4,  'Caracteristica', 'Registro del Evento Vigilado');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+13, @solucion+4,  'Caracteristica', 'Actualización del Evento de Vigilancia');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+14, @solucion+4,  'Caracteristica', 'Consulta del Evento Vigilado');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+15, @solucion+7,  'Caracteristica', 'Seguimiento vehicular (AVL)');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+16, @solucion+8,  'Caracteristica', 'Centro Atención Inmediata Móvil (CAI)');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+17, @solucion+9,  'Caracteristica', 'Gestión de Hospitales Girardota');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+18, @solucion+10, 'Caracteristica', 'Administración Colegio y Asistencia Escolar');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+19, @solucion+11, 'Caracteristica', 'Código de Policía');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+20, @solucion+12, 'Caracteristica', 'Control Motocicletas y Accidentalidad víal');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+21, @solucion+13, 'Caracteristica', 'Emisión Foto-comparendos');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+22, @solucion+14, 'Caracteristica', 'Gestión casos de micro-extorsión');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+23, @solucion+15, 'Caracteristica', 'Obstrucción de comunicaciones (jammer) para Cárcel');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+24, @solucion+16, 'Caracteristica', 'Telemetría Medioambiente');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+0,  'PRY Alarma ciudadana', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+1,  'PRY Comisaria', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+2,  'PRY Juntas Vecinales', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+3,  'PRY Observatorio', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+4,  'PRY Vigilancia', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+5,  'PRY Seguimiento', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+6,  'PRY CAI Móvil', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+7,  'PRY Hospitales', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+8,  'PRY Colegios', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+9,  'PRY Policía', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+10, 'PRY Motocicletas', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+11, 'PRY Foto-comparendos', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+12, 'PRY Micro-extorsión', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+13, 'PRY Obstrucción', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+14, 'PRY Ambiente', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+0,  @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+1,  @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+2,  @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+3,  @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+4,  @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+5,  @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+6,  @implementacion+2);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+7,  @implementacion+2);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+8,  @implementacion+2);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+9,  @implementacion+3);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+10, @implementacion+3);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+11, @implementacion+3);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+12, @implementacion+4);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+13, @implementacion+4);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+14, @implementacion+4);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+15, @implementacion+5);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+16, @implementacion+6);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+17, @implementacion+7);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+18, @implementacion+8);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+19, @implementacion+9);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+20, @implementacion+10);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+21, @implementacion+11);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+22, @implementacion+12);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+23, @implementacion+13);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+24, @implementacion+14);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+0, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+1, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+2, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+3, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+4, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+5, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+6, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+7, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+8, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+9, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+10, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+11, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+12, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+13, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+14, 2);
COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (1,  @implementacion, 1, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (2,  @implementacion, 2, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (3,  @implementacion, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (4,  @implementacion, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5,  @implementacion, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (6,  @implementacion, 6, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (7,  @implementacion, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (8,  @implementacion, 7, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (9,  @implementacion, 9, 1);
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


INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (54, @implementacion+3, 2, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (55, @implementacion+3, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (56, @implementacion+3, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (57, @implementacion+3, 7, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (58, @implementacion+3, 9, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (59, @implementacion+3, 10, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (60, @implementacion+3, 11, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (61, @implementacion+3, 3, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (62, @implementacion+3, 4, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (63, @implementacion+3, 12, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (64, @implementacion+3, 13, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (65, @implementacion+3, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (66, @implementacion+3, 15, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (67, @implementacion+3, 18, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (68, @implementacion+3, 19, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (69, @implementacion+3, 33, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (70, @implementacion+3, 20, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (71, @implementacion+3, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (72, @implementacion+3, 21, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (73, @implementacion+3, 22, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (74, @implementacion+3, 23, 1);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (75, @implementacion+3, 24, 1);


/*INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 8);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 9);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 10);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 11);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 12);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 17);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 35);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 36);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 14);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 27);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 28);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 29);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 30);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 31);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+4, 32);
*/
COMMIT;

