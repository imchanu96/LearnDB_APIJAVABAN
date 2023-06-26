--USER의 테이블을 전체 조회
select *
from user_tables;
--TABLE_NAME만 조회한다.
select table_name
from user_tables;

-- SELECT절로 출력된 구문을 복사해서 실행하여 계정의 전체 테이블을 삭제한다.
select 'drop table "' || table_name || '" cascade Constraints;'
from user_tables;

drop table "BONUS" cascade Constraints;
drop table "DEPT" cascade Constraints;
drop table "EMP" cascade Constraints;
drop table "SALGRADE" cascade Constraints;
drop table "EMP01" cascade Constraints;
drop table "EMP02" cascade Constraints;
drop table "DEPT_TEST01" cascade Constraints;
drop table "EMP03" cascade Constraints;
drop table "DEPT_TEST02" cascade Constraints;
drop table "DEPT_TEST2" cascade Constraints;
drop table "EMP04" cascade Constraints;
drop table "DEPT_TEST03" cascade Constraints;
drop table "EMP05" cascade Constraints;
drop table "DEPT_TEST04" cascade Constraints;
drop table "EMP06" cascade Constraints;
drop table "EMP07" cascade Constraints;
drop table "DEPT_TEST05" cascade Constraints;
drop table "DEPT09" cascade Constraints;
drop table "EMP09" cascade Constraints;
drop table "DEPT_TEST06" cascade Constraints;
drop table "EMP_TEST06" cascade Constraints;
drop table "EMP_TEST" cascade Constraints;