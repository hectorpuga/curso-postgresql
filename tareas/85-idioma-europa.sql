

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


SELECT 
    cl."language",
    cl.languagecode,
    COUNT(DISTINCT c.code) AS num_paises
FROM country c
JOIN countrylanguage cl 
    ON cl.countrycode = c.code
WHERE 
    cl.isofficial = true
    AND c.continent = 5     -- Europa en tu modelo
GROUP BY 
    cl."language",
    cl.languagecode
ORDER BY 
    num_paises DESC
LIMIT 1;                     -- si solo quieres el más hablado






-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)



select * from country c
inner join countrylanguage cl on c.code=cl.countrycode
where  cl.isofficial=true and c.continent=5 and cl.languagecode=135



select languagecode from (
SELECT 
    cl."language",
    cl.languagecode,
    COUNT(DISTINCT c.code) AS num_paises
FROM country c
JOIN countrylanguage cl 
    ON cl.countrycode = c.code
WHERE 
    cl.isofficial = true
    AND c.continent = 5     -- Europa en tu modelo
GROUP BY 
    cl."language",
    cl.languagecode
ORDER BY 
    num_paises DESC
LIMIT 1                     -- si solo quieres el más hablado

) as subquery








