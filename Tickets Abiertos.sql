/*TOTAL DE TICKETS ABIERTOS */

/*============================================*/
/*QUERY PARA GRAFANA*/

SELECT COUNT(*) AS 'Tickets Abiertos'         /*Contar el resultado y marcarlo como Tickets Abiertos*/
FROM ticket                                   /*De la tabla  otrs.tickets*/
WHERE ticket_state_id IN (1,4,6,7,8,9);       /*Donde los estados Correspondan a los descritos en la parte inferior del documento*/


/*================================================*/
/*QUERY PARA LINEA DE COMANDO*/
SELECT COUNT(*) as 'Tickets Abiertos' FROM ticket WHERE ticket_state_id IN (1,4,6,7,8,9);
/*================================================*/

/*
    TABLA ticket_state_id
+----+---------------------+
| id | name                |
+----+---------------------+
|  1 | new                 |
|  2 | closed successful   |
|  3 | closed unsuccessful |
|  4 | open                |
|  5 | removed             |
|  6 | pending reminder    |
|  7 | pending auto close+ |
|  8 | pending auto close- |
|  9 | merged              |
+----+---------------------+
*/
