


INSERT INTO "user" (username,password)
values ('Hector',crypt('123456',gen_salt('bf')))

create EXTENSION pgcrypto;



create or REPLACE PROCEDURE user_login(user_name varchar,user_password VARCHAR)
as $$
DECLARE 
was_found BOOLEAN;
BEGIN

select COUNT(*) into was_found from "user" where username=user_name and password=crypt(user_password,"password");
if(was_found=false)
THEN
INSERT INTO session_failed(username,"when")
values(user_name,now());
COMMIT;
raise EXCEPTION 'Usuario y contraseña no son correctos';
END IF;
update "user" set last_login=now() WHERE username=user_name;
raise notice 'Usuario encontrado %',was_found;
END;
$$ LANGUAGE plpgsql;

CALL user_login('Hector','123456')

select * from "user"
select * from session_failed


create or REPLACE TRIGGER create_session_trigger AFTER UPDATE on "user"
FOR EACH ROW 
WHEN (OLD.last_login is DISTINCT from new.last_login)

EXECUTE PROCEDURE create_session_log();


create or REPLACE FUNCTION create_session_log()

RETURNS TRIGGER as $$

BEGIN

INSERT into "session" (user_id,last_login) VALUES(
new.id,now()
);

return new;

END;
$$ LANGUAGE plpgsql;


select * from SESSION
