--SMITH사원의 부서명은 무엇인가?
SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 20;

SELECT ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SMITH';

--사원과 부서의 정보를 모두 출력하시오
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- FROM절에 순서에 따라 표현되는 순서가 달라진다.
SELECT *
FROM DEPT, EMP
WHERE DEPT.DEPTNO = EMP.DEPTNO;
-- 중복 행의 경우 알아서 _n으로 붙혀서 표현된다.
SELECT EMP.EMPNO, EMPNO, EMPNO 
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

--1. 선수들의 팀명을 출력하시오
--팀명을 기준으로 빠른순으로 정렬
--선수번호    선수명     팀ID     팀명
SELECT *
FROM PLAYER;

SELECT *
FROM TEAM;

SELECT PLAYER.PLAYER_ID 선수번호, PLAYER.PLAYER_NAME 선수명
, PLAYER.TEAM_ID 팀ID, TEAM.TEAM_NAME 팀명 
FROM PLAYER, TEAM
WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID
ORDER BY TEAM.TEAM_NAME;

--  2.조인을 사용하여 뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오
--   급여가 큰 사람 순으로 정렬
--   사원번호   사원명   급여      부서번호   부서명   근무지
SELECT *
FROM EMP;

SELECT *
FROM DEPT;

SELECT EMP.EMPNO 사원번호, EMP.ENAME 사원명, EMP.SAL 급여, EMP.DEPTNO 부서번호
,DEPT.DNAME 부서명, DEPT.LOC 근무지
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMP.SAL DESC;
   
--   3.ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
--   사원명   부서명      입사일
--                  1989-02-01 같은 느낌
SELECT *
FROM EMP;

SELECT *
FROM DEPT;
         
SELECT EMP.ENAME 사원명, DEPT.DNAME 부서명, TO_CHAR(EMP.HIREDATE, 'YYYY-MM-DD') 입사일
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND DEPT.DNAME = 'ACCOUNTING';
                  
--   4.직급이 MANAGER인 사원의 이름, 부서명을 출력하시오
--   사원번호      사원명   직급      부서번호      부서명
SELECT *
FROM EMP;

SELECT *
FROM DEPT;

SELECT EMP.EMPNO 사원번호, EMP.ENAME 사원명, EMP.JOB 직급
, EMP.DEPTNO 부서번호, DEPT.DNAME 부서명
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND JOB = 'MANAGER';

--DML 다룬다?
--DDL 구성?

--데이터베이스 제약조건

--제약 조건 확인하기
SELECT *
FROM USER_CONSTRAINTS;

-- 모든 권한 보기 SCOTT에서는 안됨
SELECT *
FROM DBA_CONSTRAINTS;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PLAYER';

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';