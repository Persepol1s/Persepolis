SET @vertical = 100;
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
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio, 'Salud Pública', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+1, 'Servicios Asistenciales', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+2, 'Gestión del Módulo Salud', @vertical);
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio+3, 'Inspección, vigilancia y control', @vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;


INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+0, 'Programas sociales', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+1, 'Aseguramiento', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+2, 'Redes para la prestación de servicios de salud (1, 2y 3er nivel de atención)', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+3, 'Programas específicos', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+4, 'Sistema integrado de emergencias y seguridad a nivel territorial y nacional', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+5, 'Promoción y prevención', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+6, 'Enfermedades no transmisibles', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+7, 'Enfermedades transmisibles', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+8, 'Salud nutricional', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+9, 'Salud ambiental', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+10, 'Análisis, monitoreo y evaluación', @servicio+1);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+11, 'Inspección, vigilancia y control sanitario', @servicio+2);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+12, 'Laboratorios y Control de Calidad', @servicio+2);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+13, 'Sistema Obligatorio de Garantía de Calidad', @servicio+2);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+14, 'Supersalud', @servicio+2);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+15, 'Talento Humano', @servicio+2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+0, @especializado, 'Inscripción, actualización y consulta de información al SISBEN');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+1, @especializado+1, 'Afiliación única a la seguridad social');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+2, @especializado+2, 'Agendamiento elecctrónico de citas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+3, @especializado+2, 'Georeferenciación');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+4, @especializado+2, 'Autorizaciones de servicios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+5, @especializado+2, 'Historia Clínica Electrónica Unificada');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+6, @especializado+2, 'Autenticación electrónica');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+7, @especializado+2, 'Telesalud');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+8, @especializado+2, 'Registro Civil de Nacimiento');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+9, @especializado+2, 'Registro Civil de Defunción');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+10, @especializado+2, 'Suministro de medicamentos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+11, @especializado+2, 'Referencia y Contrareferencia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+12, @especializado+2, 'Demanda y oferta de servicios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+13, @especializado+3, 'Atención Intersectorial para la discapacidad');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+14, @especializado+3, 'Atención integral a la primera infancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+15, @especializado+3, 'Atención integral a la infancia y adolescencia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+16, @especializado+3, 'Familias en acción');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+17, @especializado+4, 'Gestión del riesgo');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+18, @especializado+4, 'Atención de urgencias');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+19, @especializado+5, 'Convivencia social y ciudadana');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+20, @especializado+5, 'Sexuallidad y derechos sexuales y reproductivos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+21, @especializado+5, 'Curso de vida');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+22, @especializado+6, 'Estilos, modos y condiciones de vida saludables');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+23, @especializado+6, 'Salud mental');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+24, @especializado+6, 'Condiciones crónicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+25, @especializado+7, 'Enfermedades emergentes, reemergentes y desatendidas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+26, @especializado+7, 'Enfermedades endemoepidémicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+27, @especializado+7, 'Enfermedades inmunoprevenibles');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+28, @especializado+8, 'Crecimiento y desarrollo');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+29, @especializado+9, 'Calidad del agua');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+30, @especializado+9, 'Calidad el aire');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+31, @especializado+10, 'Notificación obligatoria');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+32, @especializado+10, 'Indicadores');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+33, @especializado+10, 'Perfiles epidemiológicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+34, @especializado+11, 'Medicamentos y Productos Biológicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+35, @especializado+11, 'Alimentos y bebidas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+36, @especializado+11, 'Dispositivos médicos y otras tecnologías');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+37, @especializado+11, 'Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+38, @especializado+11, 'Farmacovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+39, @especializado+11, 'Tecnovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+40, @especializado+11, 'Reactivovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+41, @especializado+11, 'Residuos Hospitalarios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+42, @especializado+11, 'Buenas Prácticas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+43, @especializado+12, 'Red Nacional de Laboratorios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+44, @especializado+12, 'Bancos de Sangre');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+45, @especializado+13, 'Sistema Unico de Habilitación');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+46, @especializado+14, 'Indicadores de IPS');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+47, @especializado+14, 'Indicadores EAPB');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+48, @especializado+14, 'Entidades territoriales');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+49, @especializado+14, 'PQRs');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+50, @especializado+15, 'Salud Ocupacional');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+51, @especializado+15, 'Mantenimiento de equipos biomédicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+52, @especializado+15, 'Servicio Social Obligatorio');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+53, @especializado+15, 'Registro RH salud');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica, 'Funcionalidad', 'SOLX21 PRES');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad, @solucion);

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
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica, @solucion, 'Caracteristica', 'Caracteristica SOLX21 PRES');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion, 'NEC', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');

COMMIT;


/*
-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` (`requerimiento_caracteristica_idrequerimiento_caracteristica`, `implementacion_idimplementacion`) 
VALUES (44, 4);



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) 
VALUES (5, 'NEC', 4, 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) 
VALUES (4, 1);


COMMIT;
*/
