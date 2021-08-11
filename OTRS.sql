
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

/*============================================*/
/*TOTAL DE TICKETS ABIERTOS */
SELECT COUNT(*) FROM ticket WHERE (ticket_state_id = 1) or (ticket_state_id = 4) or (ticket_state_id = 6) or (ticket_state_id = 7) or (ticket_state_id = 8) or (ticket_state_id = 9)
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
/**/

/**/
/*================================================*/
/**/
