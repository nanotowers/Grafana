/*CLIENTES ACTUALES DEL SERVICIO*/

/*============================================*/
/*QUERY PARA GRAFANA*/

SELECT count(*) FROM users WHERE  (id <> 1) AND (id <> 2);

/*================================================*/
/*QUERY PARA LINEA DE COMANDO*/

SELECT count(*) FROM users WHERE  (id <> 1) AND (id <> 2);
/*================================================*/
