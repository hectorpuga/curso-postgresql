select
  now(),
  current_date,
  current_time,
  CURRENT_TIMESTAMP,
  CURRENT_USER,
  date_part('hours', now()) as hours,
  date_part('minutes', now()) as minutes,
  date_part('seconds', now()) as seconds,
  date_part('days', now()) as days,
  date_part('years', now()) as years
select
  *
from
  employees
where
  hire_date > '1998-02-05'
order by
  hire_date asc
  
  
select
  MAX(hire_date) as mas_nuevo,
  MIN(hire_date) as mas_viejo
from
  employees
  
  
  
    
select
  *
from
  employees where hire_date BETWEEN '1999-01-01' and '2000-01-01'
  order by hire_date desc
  
select
--   max(hire_date),
--   MAX(hire_date) + INTERVAL '1 day' as days,
--   MAX(hire_date) + INTERVAL '1 month' as months,
--   MAX(hire_date) + INTERVAL '1 year' as years,
  MAX(hire_date)+ INTERVAL '1.1 years' + INTERVAL '1 day' as years,
  date_part('year',now()),
  make_interval(years:=date_part('year',now()) :: INTEGER),
  max(hire_date)+make_interval(years:=23)
from
  employees
  
  
  
  select hire_date,
  make_interval(years:=2025-extract(years from hire_date)::INTEGER) as manual,
    make_interval(years:=date_part('years',CURRENT_DATE)::integer-extract(years from hire_date)::INTEGER) as computed
  from employees
  order by hire_date desc
  
  
  update employees set hire_date=hire_date+INTERVAL '25 years'
  
  
 select
  first_name,
  last_name,
  hire_date,
  CASE
  when hire_date>now() - interval '1 year' then 'Rango A'
  when hire_date>now() - interval '3 year' then 'Rango B'
  when hire_date>now() - interval '6 year' then 'Rango C'


  else 'Rango D'
  end as rango_antiguedad
from
  employees
  
  order by hire_date desc
  