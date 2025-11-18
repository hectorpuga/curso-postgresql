

select * from continent where name like '%America%'
union
SELECT * from continent WHERE code in (3,5) order by "name" ASC



-- select a.name as country,b.name as continent from country a,continent b
-- where a.continent=b.code
-- order by b.name asc



select
  a."name" as country,
  b."name" as continent
from
  country a
  inner JOIN continent b on a.continent = b.code
ORDER by
  a."name" asc
  
  ALTER SEQUENCE 'seq name' RESTART WITH 8
  
  insert into continent ("name") 
  VALUES('Central Asia'),
  ('South Asia')
  
  
  select
  a."name" as country,
  a.continent as continentCode,
  b."name" as continentName
from
  country a
  FULL outer join continent b on a.continent = b.code
  order by a."name" desc
  
  
  SELECT * from country a
  RIGHT JOIN continent b on a.continent=b.code
  where a.continent is null or b.code is null
  
 select
  count(*) as total,
  b.name
from
  country a
  full outer JOIN continent b on a.continent = b.code
GROUP by
  b.name
UNION
select
  0 as total,
  b.name
from
  country a
  RIGHT JOIN continent b on a.continent = b.code
WHERE
  a.continent is NULL
GROUP by
  b.name
ORDER by
  total asc
  
  
  