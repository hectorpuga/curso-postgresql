create or REPLACE FUNCTION greet_employee (employee_name varchar)
returns VARCHAR 
as $$
-- DECLARE
BEGIN 


RETURN 'Hola '||employee_name;

END;
$$
LANGUAGE plpgsql;

select greet_employee('Hector')

select first_name,greet_employee(first_name) from employees

select
  employee_id,
  first_name,
  max_raise(employee_id) as possible_raise,
  max_raise2(employee_id)
from
  employees
  
  
  
  
  
  select max_raise(206);
  
  
  CREATE OR REPLACE FUNCTION max_raise(empl_id int)
  returns  NUMERIC (8,2) as $$
  
  DECLARE possible_raise NUMERIC(8,2);
  
  BEGIN
  
   select
  max_salary-salary into possible_raise
from
  employees
  inner join jobs on jobs.job_id = employees.job_id WHERE employee_id=empl_id;
  
  
  return possible_raise;
  
  
  
  END;
  
  $$ LANGUAGE plpgsql;
  
  
  
  
  
  
  
  
  
    
  CREATE OR REPLACE FUNCTION max_raise2(empl_id int)
  returns  NUMERIC (8,2) as $$
  
  
  DECLARE 
  employee_job_id int;
  current_salary NUMERIC(8,2);
  job_max_salary NUMERIC(8,2);
  possible_raise NUMERIC(8,2);
  
  BEGIN
  
-- Tomar el puesto de trabajo y el salario
select job_id,salary INTO employee_job_id,current_salary from employees where employee_id=empl_id;
 
-- Tomar el max salary, acorde a su job

SELECT max_salary into job_max_salary FROM jobs where job_id=employee_job_id;
-- Calculos


possible_raise=job_max_salary-current_salary;

IF( possible_raise < 0) THEN
  
  possible_raise=0;
  END IF;
  raise EXCEPTION 'Person con salario mayor max_salary: %',empl_id;
--   return possible_raise;
END;
  $$ LANGUAGE plpgsql;
  
  
  select
  employee_id,
  first_name,
  max_raise(employee_id) as possible_raise,
  max_raise2(employee_id)
from
  employees where employee_id=206
  
  
  select * from employees where employee_id=206
  
  
  
  
  
  
  
  
    CREATE OR REPLACE FUNCTION max_raise2(empl_id int)
  returns  NUMERIC (8,2) as $$
  
  
  DECLARE 

  selected_employee employees%rowtype;
  selected_job jobs%rowtype;
  possible_raise NUMERIC(8,2);
  
  BEGIN
  
-- Tomar el puesto de trabajo y el salario
select * from employees into selected_employee where employee_id=empl_id;
 
-- Tomar el max salary, acorde a su job

SELECT *  FROM jobs into selected_job where job_id=selected_employee.job_id;
-- Calculos


possible_raise=selected_job.max_salary-selected_employee.salary;

IF( possible_raise < 0) THEN
  
  possible_raise=0;
  END IF;
  raise EXCEPTION 'Person con salario mayor max_salary: id:%, %',selected_employee.employee_id,selected_employee.first_name;
--   return possible_raise;
END;
  $$ LANGUAGE plpgsql;
  
  
   
  select
  employee_id,
  first_name,
  max_raise(employee_id) as possible_raise,
  max_raise2(employee_id)
from
  employees where employee_id=206
  