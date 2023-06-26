SELECT *
FROM user_role_privs;

--권한 회수
REVOKE CONNECT
FROM ICW;

--권한 부여
GRANT CONNECT
to icw;

SELECT *
FROM dba_role_privs
WHERE grantee = 'ICW'
OR grantee = 'SCOTT';

