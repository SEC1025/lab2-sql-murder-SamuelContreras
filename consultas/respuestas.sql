--1 Reviso los reposrtes de la escena del crimen y encuentro todas la que se visualizaron dependiento el crimen y la ciudad afectada
SELECT * 
FROM crime_scene_report
--2 Reduzco la busqueda en la ciudad y el tipo de crimen para mayor informacion
SELECT * 
FROM crime_scene_report
WHERE city ="SQL City"
AND type ="murder"
--3 Por la informacion dada en la muestra anterior ahora disminuir nuestro rango de busqueda
SELECT * 
FROM person
WHERE address_street_name ="Northwestern Dr"
OR name LIKE "%Annabel%"
AND address_street_name ="Franklin Ave"
ORDER BY address_number DESC
--4 Ahora sabiendo quienes son los interrogaremos llamandolos por sus ids
SELECT name, transcript
FROM person 
INNER JOIN interview ON person.id = interview.person_id
WHERE person.id = 14887 OR person.id = 16371;
--5 Despues de la Informacion dada por los testigos damos con los datos del asesino en su membresia del gimnasio.
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%' AND membership_status = 'gold';
--6 Ya habiendo reducido la informacion sobre quienes tienen la membresia gold con estos dijitos, usamos sus ids, quien maneja dicha placa de vehiculo.
SELECT person.id, person.name, drivers_license.plate_number
FROM person
JOIN drivers_license ON person.license_id = drivers_license.id
WHERE person.id = 67318 OR person.id = 28819
AND plate_number LIKE "%H42W%";
--7 Ya sabiendo el nombre de nuestro asesino, sin embargo confirmaremos la coartada que dijo Annabel sobre verlo el 9 de Enero
SELECT get_fit_now_check_in.*, get_fit_now_member.name
FROM get_fit_now_check_in 
JOIN get_fit_now_member  ON get_fit_now_check_in.membership_id = get_fit_now_member.id
WHERE get_fit_now_check_in.check_in_date = 20180109 AND get_fit_now_member.person_id = 67318;
--Final.
--Utilizando el ultimo muestreo genera una tabla que confirma la actividad de nuestro asesino
SELECT get_fit_now_check_in.*, get_fit_now_member.name
FROM get_fit_now_check_in 
JOIN get_fit_now_member  ON get_fit_now_check_in.membership_id = get_fit_now_member.id
WHERE get_fit_now_check_in.check_in_date = 20180109 AND get_fit_now_member.person_id = 67318;
--Verificacion
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;