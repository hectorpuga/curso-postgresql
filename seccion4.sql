-- select
--   first_name,
--   last_name,
--   followers
-- from
--   users
-- where
-- --   followers > 4600
-- --   and followers < 4700

--  followers BETWEEN 4600 and 4700
-- order BY
--   followers asc




-- SELECT COUNT(*) as total_users,
-- min(followers) as min_followers,
-- MAX(followers) as max_followers,
-- round(avg(followers)) as avg_followers,
-- SUM (followers)/COUNT(*) as avg_manual
-- from users


-- select avg(followers) from users;



select
  first_name,
  last_name,
  followers
from
  users
where
  followers = 4
  or followers = 4999
select
  COUNT(*),
  followers
from
  users
where
  followers = 4
  or followers = 4999
GROUP BY
  followers
select
  COUNT(*),
  followers
from
  users
where
  followers BETWEEN 4500 and 4999
GROUP BY
  followers
order by
  followers desc
  
  
  
SELECT
  COUNT(*) as count_contry,
  country
from
  users
GROUP by
  country
HAVING
  COUNT(*) > 5
order by
  COUNT(*) desc



-- select DISTINCT country from users 

-- select SUBSTRING(email,POSITION('@' in email)+1) as domain,COUNT(*) as count_domain from users
-- GROUP BY domain
-- HAVING COUNT(*)>1



-- select * from (
-- select SUBSTRING(email,POSITION('@' in email)+1) as domain,COUNT(*) as count_domain,'Hector' as name , 37 as age from users
-- GROUP BY domain
-- HAVING COUNT(*)>1 order by domain
-- ) as email_domains





