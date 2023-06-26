--임찬우
create user sampleuser identified by sample12;

grant connect to sampleuser;

grant resource, dba to sampleuser;

SELECT *
FROM dba_role_privs;

select *
from user_role_privs;