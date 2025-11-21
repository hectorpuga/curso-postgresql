CREATE OR REPLACE FUNCTION comment_replies(id INTEGER)
RETURNS json
LANGUAGE plpgsql
AS $$
DECLARE result json;
BEGIN

SELECT
  json_agg(
    json_build_object(
      'user', c.user_id,
      'comment', c."content"
    )
  ) into result
FROM comments c
WHERE 
   c.comment_parent_id = id;

RETURN result;
END;
$$;


SELECT sayhello('Hector')


select comment_replies(1)