-- alter table country
-- add PRIMARY KEY (code);

-- select * from country where code='NLD'

-- DELETE from country where code2='NA'


-- ALTER TABLE country add CHECK (
-- surfacearea>=0
-- )

-- select * from country


-- select DISTINCT continent from country

-- ALTER TABLE country
-- add CHECK (
--   (continent = 'Asia')
--   or (continent = 'South America')
--   or (continent = 'North America')
--   or (continent = 'Oceania')
--   or (continent = 'Antarctica')
--   or (continent = 'Africa')
--   or (continent = 'Europe')
-- )


-- select * from country where code='HND'


-- alter table country drop CONSTRAINT country_continent_check1




-- select * from country


-- create UNIQUE INDEX "unique_country_name" on country(
-- name
-- )

-- create  INDEX "unique_country_continet" on country(
-- continent
-- )


-- SELECT * from country where continent='Africa'


-- select * from country where continent='North America'




-- select
--   *
-- from
--   city
-- where
--   name = 'Jinzhou' and
--   countrycode = 'CHN' and
--   district = 'Liaoning'

-- create UNIQUE index "unique_name_countrycode_district" on city(
-- "name",countrycode,district
-- )



-- create  index "index_district" on city(
-- district
-- )

-- INSERT INTO country
-- 		values('NAM', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

-- alter TABLE city
-- 	add CONSTRAINT fk_country_code
-- 	FOREIGN KEY (countrycode)
-- 	REFERENCES country(code);
	
	
-- 	INSERT INTO country
-- VALUES (
--     'NAM',               -- country code
--     'Namibia',           -- name
--     'Africa',            -- continent
--     'Southern Africa',   -- region
--     825615,              -- surfacearea
--     1990,                -- indepyear
--     2600000,             -- population
--     64.0,                -- lifeexpectancy
--     11400000,            -- GNP
--     NULL,                -- GNPOld
--     'Namibia',           -- localname
--     'Republic',          -- governmentform
--     NULL,                -- headofstate
--     NULL,                -- capital
--     'NA'                 -- code2
-- );

-- alter TABLE countrylanguage
-- 	add CONSTRAINT fk_country_code
-- 	FOREIGN KEY (countrycode)
-- 	REFERENCES country(code);
	
	
-- 	select * from countrylanguage where countrycode='NAM'
	
	
-- 	select * from country c
-- 	inner join city cy on cy.countrycode=c.code
-- 	where code='AFG'
	

-- ALTER TABLE countrylanguage
-- DROP CONSTRAINT fk_country_code;

-- 	ALTER TABLE countrylanguage
-- ADD CONSTRAINT fk_country_code
-- FOREIGN KEY (countrycode)
-- REFERENCES country (code)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE;

	
-- 	DELETE from country where code='AFG'