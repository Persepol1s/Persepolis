use `persepolis.proyecto.solucion`;


-- Componentes de una solución
select * 
from 
`persepolis.servicio.vertical`.solucion a 
	join `persepolis.proyecto.solucion`.requerimiento_caracteristica b	on a.idsolucion = b.solucion_idsolucion 
    join `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion carimpl on requerimiento_caracteristica_idrequerimiento_caracteristica = b.idrequerimiento_caracteristica
    join `persepolis.proyecto.solucion`.implementacion aa on aa.idimplementacion = carimpl.implementacion_idimplementacion
    left join `persepolis.proyecto.solucion`.implementacion_has_proveedor imp_prov on aa.idimplementacion = imp_prov.implementacion_idimplementacion
    left join `persepolis.proyecto.solucion`.proveedor prov on imp_prov.proveedor_idproveedor = prov.idproveedor
    left join `persepolis.proyecto.solucion`.implementacion_has_componente c on aa.idimplementacion = c.implementacion_idimplementacion
    left join `persepolis.proyecto.solucion`.componente d on c.componente_idcomponente = d.idcomponente
where a.solucion = "SOLX201 COM"
and b.nombre = 'Seguimiento del Caso'
;

