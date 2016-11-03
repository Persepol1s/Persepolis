use `persepolis.servicio.vertical`;


-- soluciones de una vertical
select *
from `persepolis.servicio.vertical`.servicio ss 
	join `persepolis.servicio.vertical`.s_especializado esp on ss.idservicio = esp.servicio_idservicio
    join `persepolis.servicio.vertical`.funcionalidad fun on esp.ids_especializado = fun.s_especializado_ids_especializado
    join `persepolis.servicio.vertical`.funcionalidad_has_solucion funsol on fun.idfuncionalidad = funsol.funcionalidad_idfuncionalidad
    join `persepolis.servicio.vertical`.solucion sol on sol.idsolucion = funsol.solucion_idsolucion
where ss.vertical_idvertical = 200;


-- implementaciones de una solucion
select *
from `persepolis.servicio.vertical`.servicio ss 
	join `persepolis.servicio.vertical`.s_especializado esp on ss.idservicio = esp.servicio_idservicio
    join `persepolis.servicio.vertical`.funcionalidad fun on esp.ids_especializado = fun.s_especializado_ids_especializado
    join `persepolis.servicio.vertical`.funcionalidad_has_solucion funsol on fun.idfuncionalidad = funsol.funcionalidad_idfuncionalidad
    join `persepolis.servicio.vertical`.solucion sol on sol.idsolucion = funsol.solucion_idsolucion
    join `persepolis.proyecto.solucion`.requerimiento_caracteristica car on car.solucion_idsolucion = sol.idsolucion
    join `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion carimpl on requerimiento_caracteristica_idrequerimiento_caracteristica = car.idrequerimiento_caracteristica
    join `persepolis.proyecto.solucion`.implementacion impl on impl.idimplementacion = carimpl.implementacion_idimplementacion
-- where ss.vertical_idvertical = 200
-- and solucion = "SOLX200 AAE";
;

