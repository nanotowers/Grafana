
/*
#############################################
Queries para Grafana por cada panel, cada uno tiene su explicaione de como realiza la consulta y que metrica retorna 
#############################################
*/

/*  PANEL       =       STAT
    TABLA       =       ticket
    CONDICIONES =       ticket_state_id = 1     +   NEW
                        ticket_state_id = 2     -   CLOSED SUCCESSFUL
                        ticket_state_id = 3     -   CLOSED SUCCESSFUL                    
                        ticket_state_id = 4     +   OPEN
                        ticket_state_id = 5     -   REMOVED          
                        ticket_state_id = 6     +   PENDING REMINDER
                        ticket_state_id = 7     +   PENDING AUTO CLOSE +
                        ticket_state_id = 8     +   PENDING AUTO CLOSE -
                        ticket_state_id = 9     +   MERGED
*/

/*================================================*/
/*TOTAL DE TICKETS NUEVOS */
SELECT count(*) FROM ticket where ticket_state_id = '1';
/*================================================*/
/*TOTAL DE TICKETS SIN ATENCION */
SELECT count(*) FROM ticket where  user_id = 1;
/*user_id = 1 Hace referencia al usuario root@localhost*/
/*================================================*/
/*TOTAL DE TICKETS ABIERTOS HOY*/
SELECT COUNT(*) FROM ticket WHERE create_time >= CURDATE();
/*create_time >= CURDATE() = Fecha de hoy en este formato "YYYY-MM-DD" (string)*/
/*================================================*/
/*TICKETS ABIERTOS POR COLA*/
SELECT 
now() as time,
queue.name AS FILA, 
count(*) AS Total
FROM ticket INNER JOIN queue ON ticket.queue_id = queue.id 
WHERE (ticket_state_id = '4' OR ticket_state_id = '6' OR ticket_state_id = '1'  ) 
GROUP BY queue.name;
/**/
/*================================================*/
/*TICKETS ABIERTOS INCIDENTES VS REQUERIMIENTOS*/
SELECT 
  COUNT(*), ticket_type.name  
  FROM ticket 
    INNER JOIN ticket_type ON ticket.type_id = ticket_type.id  
  WHERE ticket_state_id IN (1,4,6,7,8,9) 
GROUP BY ticket_type.name;
/**/
/*================================================*/
/*TICKETS ABIERTOS POR AGENTE EN UNA COLA "LA 2"*/
SELECT CONCAT(u.first_name, ' ',u.last_name)  AS Nombre, count(t.id) Tickets 
  FROM ticket t, queue q, users u 
  WHERE u.id = t.user_id AND q.id = t.queue_id AND t.ticket_state_id in (4,6,7,8) AND q.id = 2 
GROUP BY Nombre;

SELECT CONCAT(u.first_name, ' ',u.last_name)  AS Nombre, count(t.id) Tickets FROM ticket t, queue q, users u  WHERE u.id = t.user_id AND q.id = t.queue_id AND t.ticket_state_id in (4,6,7,8) AND q.id = 2 GROUP BY Nombre;
/*================================================*/


