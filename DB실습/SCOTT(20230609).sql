--1. DALLAS에서 근무하는 사원의 이름, 부서 번호를 출력하시오
--사원번호        사원명     부서번호

SELECT *
FROM DEPT
WHERE LOC = 'DALLAS';

SELECT *
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

--2. SALES 부서에서 근무하는 모든 사원의 이름과 급여를 출력하시오
--사원번호        사원명     급여      부서명
--                                   영업부
SELECT *
FROM DEPT
WHERE DNAME = 'SALES';

SELECT *
FROM EMP
WHERE DEPTNO = 30;

--컬럼 추가로 추가 정보값 표현
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, '영업부' AS 부서명
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
-- 영업부가 아니면 DECIDE를 사용해서 NULL로 표현
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, DECODE(DEPTNO, 30, '영업부')
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

--3.자신의 직속상관이 KING인 사원의 이름과 급여를 출력하시오
--사원번호   사원명   급여
SELECT *
FROM EMP
WHERE ENAME = 'KING';

SELECT *
FROM EMP
WHERE MGR = 7839;

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
   
--4.선수들 중 나이가 20~30세인 선수들의 정보를 출력하시오
--나이가 많은 사람이 먼저 나오도록 정렬하시오 
--선수번호   선수명   생년월일         나이
--                  ????년??월??일
SELECT *
FROM PLAYER;

SELECT TO_CHAR(BIRTH_DATE, '""YYYY"년 "MM"월 "DD"일"')
FROM PLAYER;

SELECT *
FROM PLAYER
WHERE TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 <= 30
AND TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 >= 20;

SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명,
TO_CHAR(BIRTH_DATE, '""YYYY"년 "MM"월 "DD"일"') 생년월일, TRUNC((TO_NUMBER(SYSDATE - BIRTH_DATE) / 365)) 나이
FROM PLAYER
WHERE TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 <= 30
AND TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 >= 20
ORDER BY 나이 DESC;

SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명,
TO_CHAR(BIRTH_DATE, '""YYYY"년 "MM"월 "DD"일"') 생년월일, TRUNC((TO_NUMBER(SYSDATE - BIRTH_DATE) / 365)) 나이
FROM PLAYER
WHERE TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 >= 20
AND TO_NUMBER(SYSDATE - BIRTH_DATE) / 365 < 31
ORDER BY 나이 DESC;


SELECT *
FROM DEPT;

SELECT *
FROM EMP;

SELECT DEPTNO
FROM EMP
WHERE SAL >= 2500;

--오류
SELECT ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE SAL >= 2500);
--해결 서브쿼리 IN
SELECT ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE SAL >= 2500);
                
-- 서브쿼리 ALL                
SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30;

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO
             HAVING DEPTNO = 30);

SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ALL (SELECT SAL
             FROM EMP);
             
-- 서브쿼리 ANY
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
--1. 부서별로 가장 급여를 많이 받는 사원의 정보를 출력하시오
--EMPNO   ENAME   SAL     DEPTNO

SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
               FROM EMP
               GROUP BY DEPTNO);
               
--2.직급이 SALESMAN 인 사원이 받는 급여들의 최소 급여보다
--많이 받는 사원들의 이름과 급여를 출력하되 
--부서번호가 20번인 사원은 제외하시오
--   사원번호      사원명      직급      급여      부서번호

SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY SAL;

SELECT *
FROM EMP
WHERE SAL > 1250
AND DEPTNO <> 20
ORDER BY SAL;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직급, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL > ALL (SELECT MIN(SAL)
             FROM EMP
             WHERE JOB = 'SALESMAN')
AND DEPTNO <> 20;


--1. 직급이 MANAGER인 사람이 속한 부서의 부서 번호와 부서명과 지역을 출력하시오
--부서번호     부서명     LOCATION
SELECT *
FROM EMP
WHERE JOB = 'MANAGER';

SELECT *
FROM DEPT
WHERE DEPTNO = 10
OR DEPTNO = 20
OR DEPTNO = 30;

SELECT DEPTNO 부서번호, DNAME 부서명, LOC LOCATION
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                  FROM EMP
                  WHERE JOB = 'MANAGER');
                  
--2.SMITH와 동일한 직급을 가진 사원의 이름과 직급을 출력하라
--사원번호   사원명   급여      직급
SELECT *
FROM EMP
WHERE ENAME = 'SMITH';

SELECT *
FROM EMP
WHERE JOB = 'CLERK';

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, JOB 직급
FROM EMP
WHERE JOB IN (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SMITH')
AND ENAME <> 'SMITH';
   
--3.직급이 매니저인 사원이 받는 급여들의 최대 급여보다 많이 받는 사원들의
--이름과 급여를 출력하되 부서번호가 20번인 사원은 제외하시오
-- 사원이름    급여

SELECT MAX(SAL)
FROM EMP
WHERE JOB = 'MANAGER';

SELECT ENAME 사원이름, SAL 급여, DEPTNO
FROM EMP
WHERE SAL > 2975
AND DEPTNO IS NULL;

SELECT ENAME 사원이름, SAL 급여
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'MANAGER')
AND (DEPTNO <> 20 OR DEPTNO IS NULL);
------------------------------------------------------
SELECT ENAME 사원이름, SAL 급여
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'MANAGER')
OR DEPTNO IS NULL
AND DEPTNO <> 20;

SELECT ENAME 사원이름, SAL 급여
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'MANAGER')
AND DEPTNO <> 20
OR DEPTNO IS NULL;
----------------------------------------------
--4.선수들 중 정현수라는 선수가 소속되어 있는 팀 정보를 출력하시오
--연고지명   팀명      영문팀명
SELECT *
FROM TEAM;

SELECT *
FROM PLAYER
WHERE PLAYER_NAME = '정현수';

SELECT REGION_NAME 연고지명, TEAM_NAME 팀명, E_TEAM_NAME 영문팀명
FROM TEAM
WHERE TEAM_ID IN (SELECT TEAM_ID
                 FROM PLAYER
                 WHERE PLAYER_NAME = '정현수');
                 
--5.영업 사원들의 최소 급여보다 많이 받는 사원들의 이름과 급여,
--직급을 출력하되 영업 사원은 출력하지 마시오
--사원번호   사원명   담당업무   급여                 
SELECT MIN(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO 사원번호, ENAME 사원명, JOB 담당업무, SAL 급여
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
AND JOB <> 'SALESMAN';

--다중 컬럼 서브쿼리
--소속팀별 키가 가장 작은 사람들의 정보를 출력하시오?
SELECT TEAM_ID, PLAYER_NAME, HEIGHT
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT)
                           FROM PLAYER
                           GROUP BY TEAM_ID)
ORDER BY TEAM_ID, PLAYER_NAME;

SELECT TEAM_ID, MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID;

--선수 정보와 해당 선수가 속한 팀의 평균키를 함께 출력하시오?
SELECT TEAM_ID, PLAYER_NAME, HEIGHT
,    (SELECT AVG(HEIGHT)
      FROM PLAYER X
      WHERE X.TEAM_ID = P.TEAM_ID) 소속팀의평균키
FROM PLAYER P;

SELECT AVG(HEIGHT)
FROM PLAYER;


SELECT * 
FROM EMP;

SELECT EMPNO, ENAME, SAL, SAL * 12 AS 연봉
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--연봉의 급여가 30000이상인 사원들의 정보를 구하시오
SELECT *
FROM (SELECT EMPNO, ENAME, SAL, SAL * 12 AS YEAR_SAL
      FROM EMP
      WHERE SAL BETWEEN 2000 AND 3000) NEW_TABLE
WHERE DEPTNO = 10; -- 오류 (없는 쿼리 조회)

SELECT *
FROM (SELECT EMPNO, ENAME, SAL, SAL * 12 AS YEAR_SAL , DEPTNO
      FROM EMP
      WHERE SAL BETWEEN 2000 AND 3000) NEW_TABLE, DEPT D
WHERE NEW_TABLE.DEPTNO = D.DEPTNO;

--1. K-리그 선수들 중에서 포지션이 미드필더인 선수들의
--소속팀명 및 선수 정보를 출력하시오
--인라인 뷰를 꼭 사용하시오
--선수 테이블들에 관련된 정보만 인라인 뷰 시키시오
--팀ID     팀명    선수번호   선수명     백넘버

SELECT *
FROM PLAYER;

SELECT TEAM_ID 팀ID, TEAM_ID 팀명, PLAYER_ID 선수번호, PLAYER_NAME 선수명, BACK_NO 백넘버
FROM PLAYER
WHERE POSITION = 'MF';

SELECT *
FROM TEAM;

SELECT *
FROM (SELECT P.TEAM_ID 팀ID, T.TEAM_NAME 팀명, P.PLAYER_ID 선수번호, P.PLAYER_NAME 선수명, P.BACK_NO 백넘버
      FROM PLAYER P, TEAM T
      WHERE P.TEAM_ID = T.TEAM_ID 
      AND POSITION = 'MF') NEW_TABLE;
      
-- 문제의 지문에는 해당 해답이 좀 더 근접하다 (선수 테이블들에 관련된 정보만 인라인 뷰 시키시오)
SELECT NEW_TABLE.TEAM_ID 팀ID, T.TEAM_NAME 팀명,
    NEW_TABLE.PLAYER_ID 선수번호, NEW_TABLE.PLAYER_NAME 선수명,
    NEW_TABLE.BACK_NO 백넘버
FROM (SELECT PLAYER_NAME, BACK_NO, TEAM_ID, PLAYER_ID
        FROM PLAYER
        WHERE POSITION = 'MF') NEW_TABLE, TEAM T
WHERE NEW_TABLE.TEAM_ID = T.TEAM_ID;


--2. 세일즈 부서에 속한 사원들 중 급여가 가장 높은 사원의 정보와 부서명을 출력하시오
--부서번호 부서명 사원번호 사원명 급여
SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT *
FROM DEPT;

--틀린 답 BLAKE가 나와야된다.
SELECT D.DEPTNO, D.DNAME, 사원번호, 사원명, 급여
FROM (SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, DEPTNO, JOB
      FROM EMP
      WHERE JOB = 'SALESMAN') NEW_TABLE INNER JOIN DEPT D
ON NEW_TABLE.DEPTNO = D.DEPTNO
WHERE 급여 >= ALL(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN');

--서브 쿼리만 사용하여 구현
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE e.deptno = D.DEPTNO
AND E.SAL = (SELECT MAX(SAL)
            FROM EMP
            WHERE DEPTNO = (SELECT DEPTNO
                            FROM DEPT
                            WHERE DNAME = 'SALES'));


--인라인 뷰로 표현하기
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.SAL, D.DNAME, D.DEPTNO
FROM DEPT D JOIN (SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
                  FROM EMP E                   
                  WHERE E.SAL = (SELECT MAX(SAL)
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = 'SALES'))) WORKER
ON D.DEPTNO = WORKER.DEPTNO;

--3.선수들 중에서 평균키 보다 높은 선수들 중
--키가 제일 큰 사람들 순서로 출력하되
--키에 null인 선수들은 제외하시오
--선수번호      선수명   키   
SELECT COUNT(*)
FROM PLAYER;

SELECT AVG(HEIGHT)
FROM PLAYER;

SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명, HEIGHT 키
FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT)
                  FROM PLAYER)
ORDER BY 키 DESC;

--인라인뷰 사용
SELECT P.PLAYER_ID 선수번호, P.PLAYER_NAME 선수명, P.HEIGHT 키
FROM (SELECT PLAYER_ID, PLAYER_NAME, HEIGHT
      FROM PLAYER
      WHERE HEIGHT > (SELECT AVG(HEIGHT)
                      FROM PLAYER)) P
ORDER BY 키 DESC;


--4.사원 중 급여가 가장 낮은 순에서 3번째 사원들 까지 정보를 출력하시오
--ROWNUM 써야된다.
--사원번호   사원명   급여

SELECT *
FROM EMP;

SELECT *
FROM EMP
ORDER BY SAL;

SELECT E.EMPNO 사원번호, E.ENAME 사원명, E.SAL 급여
FROM (SELECT EMPNO, ENAME, SAL
      FROM EMP
      ORDER BY SAL) E
WHERE ROWNUM <= 3;

--5. 년차가 높은 사원들 중 5명의 정보를 출력하되 연차가 높은 순으로 정렬하시오
SELECT *
FROM EMP;

SELECT ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) 연차 ,SAL
FROM EMP
ORDER BY 연차 DESC;
-- 정렬이 살짝 다름 이유는 ROWNUM때문
SELECT YEAR.ENAME 사원명, YEAR.HIREDATE 입사일, 연차
FROM (SELECT ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) 연차 ,SAL
      FROM EMP
      ORDER BY 연차 DESC) YEAR
WHERE ROWNUM <= 5;

-- 순서를 정렬후 인라인뷰로 ROWNUM으로 순서를 정해주고 만든걸 인라인뷰로 순서를 사용한다.
--그걸로 정렬(정렬된 값에 순서를 추가, 추가된 순서도 정보로 포함 인라인뷰(정렬한 정보 인라인뷰))
SELECT NEW_EMP.ENAME, NEW_EMP.HIREDATE, NEW_EMP.YEAR_SAL
FROM (SELECT ROWNUM R_NUM, ENAME, HIREDATE, YEAR_SAL, SAL
      FROM (SELECT ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) YEAR_SAL ,SAL
      FROM EMP
      ORDER BY HIREDATE) YEAR) NEW_EMP
WHERE NEW_EMP.R_NUM <= 5;

-- 순서를 미리 정렬하여 만들고 ROWNUM으로 순위를 매겨준다. 아니면 순서가 깨진다.
SELECT ROWNUM, ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) 연차 ,SAL
FROM EMP;

SELECT ROWNUM, ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) 연차 ,SAL
FROM EMP
ORDER BY 연차 DESC;