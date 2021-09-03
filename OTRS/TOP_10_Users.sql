/*TOP 10 USUARIOS*/

/*================================================*/
/*QUERY PARA GRAFANA*/

SELECT concat_ws(' ', u.first_name, u.last_name) 'Nombre', count(0) Cantidad
FROM ticket t 
inner join users u on t.user_id=u.id 
where /*date(t.create_time) between '$Ano-01-01' and '$Ano-12-01' and*/u.valid_id='1'
group by u.id 
order by 2 desc
limit 10   

/*================================================*/
/*QUERY PARA LINEA DE COMANDO*/

SELECT concat_ws(' ', u.first_name, u.last_name) 'Nombre', count(0) Cantidad FROM ticket t inner join users u on t.user_id=u.id where /*date(t.create_time) between '$Ano-01-01' and '$Ano-12-01' and*/u.valid_id='1' group by u.id order by 2 desc limit 10   
