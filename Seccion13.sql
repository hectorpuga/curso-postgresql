
create view comments_per_week as
SELECT
  date_trunc('week', posts.created_at) as weeks,
    sum(claps.counter) as total_claps,
  count(DISTINCT posts.post_id) as number_of_posts,
  count(*) as number_of_claps
from
  posts
  inner join claps on claps.post_id = posts.post_id
group by
  weeks
order by
  weeks desc;


select * from  comments_per_week

drop view comments_per_week




create MATERIALIZED view comments_per_week_mat as
SELECT
  date_trunc('week', posts.created_at) as weeks,
    sum(claps.counter) as total_claps,
  count(DISTINCT posts.post_id) as number_of_posts,
  count(*) as number_of_claps
from
  posts
  inner join claps on claps.post_id = posts.post_id
group by
  weeks
order by
  weeks desc;
  
  
  
  
  select * from comments_per_week
  select * from comments_per_week_mat
  
  REFRESH MATERIALIZED VIEW comments_per_week_mat

select * from posts where post_id=1


alter MATERIALIZED view comments_per_week_mat rename to posts_per_week_mat
alter  view comments_per_week rename to posts_per_week
  
  
  
  WITH posts_week_2024
  as (
  
   SELECT
  date_trunc('week', posts.created_at) as weeks,
    sum(claps.counter) as total_claps,
  count(DISTINCT posts.post_id) as number_of_posts,
  count(*) as number_of_claps
from
  posts
  inner join claps on claps.post_id = posts.post_id
group by
  weeks
order by
  weeks desc
  )
 select * from posts_week_2024 where weeks BETWEEN '2024-01-01' and '2024-12-31' and total_claps>=600
  
  
  
  WITH claps_per_post as (
   select post_id,SUM(counter) FROM claps
  GROUP BY post_id
  ),post_from_2023 as(
  
   select * from posts where created_at BETWEEN '2023-01-01' and '2023-12-31'
  
  
  )
  
 
  
 select * from claps_per_post where claps_per_post.post_id in (SELECT post_id from post_from_2023)
  
  
    select * from claps_per_post

  
  -- Nombre de la tabla en memoria
  -- Campos que vamos a tener
  WITH RECURSIVE countdown(val) as(
  -- initializacion => el primer nivel, o valores iniciales
--   values(5)
select 5 as val
  UNION
  
  -- Query recursivo
  SELECT val-1 from countdown where val>1
  
  )
  
  -- Select de los campos
  select * from countdown;
  
  
  
  
    -- Nombre de la tabla en memoria
  -- Campos que vamos a tener
  WITH RECURSIVE countup(val) as(
  -- initializacion => el primer nivel, o valores iniciales
--   values(5)
select 1 as val
  UNION
  
  -- Query recursivo
  SELECT val+1 from countup where val<10
  
  )
  
  -- Select de los campos
  select * from countup;
  
  
  
  WITH RECURSIVE multiplication_table(base,val,result) as(
  
  select 5 as base, 1 as val, 5 as result
  UNION 
  
  select 5 as base,val+1,(val+1)*base from multiplication_table
  WHERE val<10
  
  )
  
  SELECT * from multiplication_table;
  
  
  select * from employees
  
  
  
  
  
  INSERT INTO employees (name,reports_to)VALUES
 
  ('jr Mariano',8)
  
  
  WITH RECURSIVE bosses as (
  
  -- init
  select id,name,reports_to from employees WHERE id=7
  UNION
  -- Recursive
  
  select employees.id,employees.name,employees.reports_to from 
  employees INNER JOIN bosses on bosses.id=employees.reports_to
  
  
  )
  select * from bosses