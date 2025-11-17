

-- 1. Ver todos los registros
SELECT * FROM users

-- 2. Ver el registro cuyo id sea igual a 10

SELECT * FROM users where id=10

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)

SELECT * FROM users where name LIKE 'Jim %'

-- 4. Todos los registros cuyo segundo nombre es Alexander

SELECT * FROM users WHERE name LIKE '% Alexander'

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'

UPDATE users set name='Fernando Herrara' WHERE id=1
select * from  users WHERE id=1


-- 6. Borrar el último registro de la tabla
select * from users order by id desc
select max(id) from  users
DELETE from users where id= (select COUNT(*) from users)