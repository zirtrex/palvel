/********************************************
 *******************VISTAS*******************
 ********************************************/

USE palvel;

CREATE VIEW vw_requerimiento
AS
  SELECT c.codCurso, c.nombreCurso, c.codEscuela, e.nombreEscuela, 
		q.codQuimico, q.elemento, q.unidadMedida, q.min, q.max, q.intervalo, q.tipo, concat(q.elemento, " (", q.unidadMedida, ")") as elementoFull,
        r.cantidad, r.semestre, r.observacion, r.detalleObservacion, r.fechaPedido, r.estado,
        u.codUsuario, u.codigo, u.nombres, u.primerApellido, u.segundoApellido, u.correo, u.telefono, d.codDepartamento, d.nombreDepartamento
  FROM requerimiento r
  INNER JOIN curso c ON c.codCurso = r.codCurso
  INNER JOIN quimico q ON q.codQuimico = r.codQuimico
  INNER JOIN usuario u ON u.codUsuario = r.codUsuario
  INNER JOIN escuela e ON e.codEscuela = r.codEscuela
  LEFT JOIN departamento d ON d.codDepartamento = u.codDepartamento;
  


