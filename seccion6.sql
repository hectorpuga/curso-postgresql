

select DISTINCT continent from country order BY continent asc


CREATE TABLE continent(
code serial not NULL,
"name" TEXT not null

)


alter TABLE continent add PRIMARY key (code)


INSERT INTO continent (name )
select DISTINCT continent from country order BY continent asc


select * from continent


-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);



INSERT INTO country_bk 
SELECT * from country_bk



SELECT * from country

ALTER TABLE country DROP CONSTRAINT country_continent_check



select a."name",a.continent,(SELECT code from continent b WHERE  b."name"=a.continent  )

from country a

alter TABLE country drop CONSTRAINT country_continent_check

UPDATE country a set continent=(SELECT code from continent b WHERE  b."name"=a.continent)


select * from country

alter TABLE country
alter COLUMN continent type int4 USING continent::integer


alter TABLE country add CONSTRAINT fk_country_continent
FOREIGN KEY (continent)
REFERENCES continent (code)


DROP TABLE country_bk