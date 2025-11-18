

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar


SELECT * from language
SELECT DISTINCT language from countrylanguage
SELECT * from countrylanguage


-- Actualizar todos los registros

INSERT INTO  language(name)
SELECT DISTINCT language from countrylanguage

update countrylanguage a set languagecode=(SELECT code from language b where a."language" =b."name")



-- Cambiar tipo de dato en countrylanguage - languagecode por int4

ALTER TABLE countrylanguage ALTER COLUMN languagecode TYPE int4 USING languagecode::INTEGER


-- Crear el forening key y constraints de no nulo el language_code

alter TABLE countrylanguage add CONSTRAINT fk_language_code
FOREIGN KEY (languagecode)
REFERENCES "language"(code)

ALTER TABLE countrylanguage add CHECK (
languagecode not null
)

-- Revisar lo creado

SELECT *,b.name as codeLe from countrylanguage a 
inner join language b on a.languagecode=b.code