
-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = 100;

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (100);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (30, 'Salud Pública', 100);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (40, 'Servicios Asistenciales', 100);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (60, 'Gestión del Módulo Salud', 100);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (61, 'Inspección, vigilancia y control', 100);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;


INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (21, 'Programas sociales', 40);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (22, 'Aseguramiento', 40);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (24, 'Redes para la prestación de servicios de salud (1, 2y 3er nivel de atención)', 40);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (36, 'Programas específicos', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (37, 'Sistema integrado de emergencias y seguridad a nivel territorial y nacional', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (38, 'Promoción y prevención', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (39, 'Enfermedades no transmisibles', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (40, 'Enfermedades transmisibles', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (41, 'Salud nutricional', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (42, 'Salud ambiental', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (43, 'Análisis, monitoreo y evaluación', 30);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (44, 'Inspección, vigilancia y control sanitario', 61);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (45, 'Laboratorios y Control de Calidad', 61);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (46, 'Sistema Obligatorio de Garantía de Calidad', 61);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (47, 'Supersalud', 61);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (48, 'Talento Humano', 61);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (242, 21, 'Inscripción, actualización y consulta de información al SISBEN');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (243, 22, 'Afiliación única a la seguridad social');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (244, 24, 'Agendamiento elecctrónico de citas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (245, 24, 'Georeferenciación');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (246, 24, 'Autorizaciones de servicios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (247, 24, 'Historia Clínica Electrónica Unificada');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (248, 24, 'Autenticación electrónica');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (249, 24, 'Telesalud');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (250, 24, 'Registro Civil de Nacimiento');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (251, 24, 'Registro Civil de Defunción');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (252, 24, 'Suministro de medicamentos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (253, 24, 'Referencia y Contrareferencia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (254, 24, 'Demanda y oferta de servicios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (255, 36, 'Atención Intersectorial para la discapacidad');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (256, 36, 'Atención integral a la primera infancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (257, 36, 'Atención integral a la infancia y adolescencia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (258, 36, 'Familias en acción');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (259, 37, 'Gestión del riesgo');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (260, 37, 'Atención de urgencias');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (261, 38, 'Convivencia social y ciudadana');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (262, 38, 'Sexuallidad y derechos sexuales y reproductivos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (263, 38, 'Curso de vida');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (264, 39, 'Estilos, modos y condiciones de vida saludables');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (265, 39, 'Salud mental');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (266, 39, 'Condiciones crónicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (267, 40, 'Enfermedades emergentes, reemergentes y desatendidas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (268, 40, 'Enfermedades endemoepidémicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (269, 40, 'Enfermedades inmunoprevenibles');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (270, 41, 'Crecimiento y desarrollo');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (271, 42, 'Calidad del agua');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (272, 42, 'Calidad el aire');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (273, 43, 'Notificación obligatoria');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (274, 43, 'Indicadores');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (275, 43, 'Perfiles epidemiológicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (276, 44, 'Medicamentos y Productos Biológicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (277, 44, 'Alimentos y bebidas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (278, 44, 'Dispositivos médicos y otras tecnologías');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (279, 44, 'Cosméticos, Aseo, Plaguicidas y Productos de Higiene Doméstica');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (280, 44, 'Farmacovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (281, 44, 'Tecnovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (282, 44, 'Reactivovigilancia');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (283, 44, 'Residuos Hospitalarios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (284, 44, 'Buenas Prácticas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (285, 45, 'Red Nacional de Laboratorios');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (286, 45, 'Bancos de Sangre');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (287, 46, 'Sistema Unico de Habilitación');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (288, 47, 'Indicadores de IPS');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (289, 47, 'Indicadores EAPB');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (290, 47, 'Entidades territoriales');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (291, 47, 'PQRs');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (292, 48, 'Salud Ocupacional');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (293, 48, 'Mantenimiento de equipos biomédicos');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (294, 48, 'Servicio Social Obligatorio');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (295, 48, 'Registro RH salud');

COMMIT;



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
								where vertical_idvertical = 100
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
						where vertical_idvertical = 100
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
				where vertical_idvertical = 100
				)
		)
	)
)
and idrequerimiento_caracteristica > 0;


COMMIT;


/*
-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (44, 19, 'Funcionalidad', 'SOLX21 PRES');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` 
VALUES (4, 'NEC', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');

COMMIT;



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
