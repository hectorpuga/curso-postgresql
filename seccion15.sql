select country_id,country_name,region_name from countries 
inner join regions on countries.region_id=regions.region_id



create or REPLACE FUNCTION country_region()
RETURNS TABLE (id CHARACTER(2),name VARCHAR(40),region VARCHAR(25))
as $$
BEGIN


RETURN query
select country_id,country_name,region_name from countries 
inner join regions on countries.region_id=regions.region_id;

END;
$$ LANGUAGE plpgsql;


create or REPLACE PROCEDURE insert_region_proc(int,varchar)
as $$

BEGIN

INSERT into regions(region_id,region_name)
VALUES($1,$2);
-- ROLLBACK;
raise notice 'Variable 1: %, %',$1,$2;

COMMIT;
END;

$$ LANGUAGE plpgsql;


CALL insert_region_proc(5,'Central America')

select * from regions




CREATE OR REPLACE FUNCTION max_raise( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	possible_raise NUMERIC(8,2);

BEGIN
	
	select 
		max_salary - salary into possible_raise
	from employees
	INNER JOIN jobs on jobs.job_id = employees.job_id
	WHERE employee_id = empl_id;

	if ( possible_raise < 0 ) THEN
		possible_raise = 0;
	end if;

	return possible_raise;

END;
$$ LANGUAGE plpgsql;


select max_raise(employee_id),salary,job_id from employees;

select * from jobs where job_id=4

select CURRENT_DATE as "date",
salary,
max_raise(employee_id),
max_raise(employee_id)*0.01 as amount,
1 as percentage,
salary+(max_raise(employee_id)*0.01)
from employees


-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: vivo
-- Generation Time: 2023-07-29 12:44:25.9870
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."raise_history";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS raise_history_id_seq;

-- Table Definition
CREATE TABLE "public"."raise_history" (
    "id" int4 NOT NULL DEFAULT nextval('raise_history_id_seq'::regclass),
    "date" date,
    "employee_id" int4,
    "base_salary" numeric(8,2),
    "amount" numeric(8,2),
    "percentage" numeric(4,2),
    PRIMARY KEY ("id")
);



-- percentage=5%
create or REPLACE PROCEDURE controlled_raise (percentage NUMERIC) as

$$
DECLARE

real_percentage NUMERIC(8,2);
total_employees int;

BEGIN

real_percentage=percentage/100; --5% = 0.05

INSERT INTO raise_history(date,employee_id,base_salary,amount,percentage)
select CURRENT_DATE as "date",
employee_id,
salary,
max_raise(employee_id)*real_percentage as amount,
percentage as percentage
from employees;

COMMIT;

SELECT count(*) into total_employees from employees;
raise notice 'Afectado % empleados',total_employees;

-- Impactar la tabla de empleados

UPDATE employees set salary=(max_raise(employee_id)*real_percentage)+salary;

END;

$$ LANGUAGE plpgsql;


CALL controlled_raise(10)
select * from raise_history;


select * from employees;
