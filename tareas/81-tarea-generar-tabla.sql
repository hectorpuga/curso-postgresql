

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa


(select count(*) as Total,b."name" as Continent from country a
inner join continent b on a.continent=b.code
WHERE b."name"  not like '%America%'
GROUP by b."name")
UNION
(
select COUNT(*) as Total,'America' as Continent from country a
inner join continent b on a.continent=b.code
WHERE b."name" like '%America%')
ORDER by Total asc

-- Quiero que me muestren el pais con mas ciudades
-- Campos: total de ciudades y el nombre del pais
-- usar INNER JOIN



SELECT COUNT(*) as Total,a.name from country a
inner join city b on a.code=b.countrycode
GROUP by a.name
ORDER by COUNT(*) desc
LIMIT 1


select * from city



-- ¿Quiero saber los idiomas oficialess que se hablan por continente?

select * from countrylanguage where isofficial=true;
SELECT *J from country
SELECT * from continent


select
 DISTINCT a."language",c."name" as Continent
from
  countrylanguage a
  
  inner JOIN country b ON a.countrycode = b.code
  inner JOIN continent c on b.continent=c.code
where
  a.isofficial = true
  
  
  
  -- ¿Cuantos idiomas oficiales se hablan por continent?
  
  
SELECT
  c."name" AS continent,
  COUNT(DISTINCT a."language") AS total_idiomas_oficiales
FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE a.isofficial = true
GROUP BY c."name"
ORDER BY c."name";

    
select COUNT(*),continent from (
select
 DISTINCT c."name" as Continent,a."language"
from
  countrylanguage a
  
  inner JOIN country b ON a.countrycode = b.code
  inner JOIN continent c on b.continent=c.code
where
  a.isofficial = true

  
)as totales GROUP by continent
  
  
   