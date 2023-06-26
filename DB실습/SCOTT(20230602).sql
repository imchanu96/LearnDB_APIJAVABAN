select ename, hiredate, add_months(hiredate, 6)
from emp;

--원하는 데이터 추출
SELECT EXTRACT(DAY FROM HIREDATE) 입사일
FROM EMP;

SELECT NULL, NVL(NULL, 'NVL-OK'), NVL(NULL, 10), NVL(NULL, 10) + 10
    ,NULL + 10 , NVL('ASDASD', 'NVL-OK')
FROM DUAL;

--성남 일화천마 소속 선수의 이름과 포지션을 출력하는데
--포지션이 없는 경우
--없음 이라고 표시되도록 출력하시오
--포지션이 느린 순으로
--선수명     소속팀ID       포지션

SELECT *
FROM TEAM;

SELECT *
FROM PLAYER
WHERE TEAM_ID = 'K08';

SELECT PLAYER_NAME 선수명, TEAM_ID 소속팀ID, NVL(POSITION, '없음') 포지션
FROM PLAYER
WHERE TEAM_ID = 'K08'
ORDER BY POSITION DESC;

SELECT EMPNO, ENAME, COMM, DEPTNO, NVL(ENAME, '넌 이름도 몰라?'), NVL(DEPTNO, 99)
FROM EMP;

--1. 사원의 SAL이 월급이라고 치자
--사원의 연봉과 상여금(COMM)을 포함한 금액을 구하시오
-- 사원명   월급      연봉      COMM      연봉+상여금
 
SELECT *
FROM EMP;

SELECT ENAME 사원명, SAL 월급, SAL * 12 연봉,  NVL(COMM, 0), SAL * 12 + NVL(COMM , 0) "연봉+상여금"
FROM EMP
ORDER BY SAL * 12 + NVL(COMM , 0) DESC;

SELECT ENAME 사원명, SAL 월급, SAL * 12 연봉,  NVL(COMM, 0), SAL * 12 + NVL(COMM , 0) "연봉+상여금"
FROM EMP
ORDER BY "연봉+상여금" DESC;

--2. 상관이 없는 사원을 출력하되
--PRESIDENT인 사원은 MGRD이 NULL 대신 C E O 라고 출력되도록 하시오
--사원번호        사원명      MANAGER(상사)

SELECT *
FROM EMP;

--숫자랑 문자열
SELECT EMPNO 사원번호, ENAME 사원명, NVL(TO_CHAR(MGR), 'C E O') "MANAGER(상사)"
FROM EMP
WHERE MGR IS NULL;

--SWITCH같은 조건식
SELECT DEPTNO,
    DECODE(
        DEPTNO, 10, 'A',
                20, 'B',
                'DEFAULT'
        ) 조건문
FROM EMP
ORDER BY DEPTNO;

SELECT *
FROM DEPT;

--IF같은 조건식
SELECT ENAME, DEPTNO,
     CASE		WHEN DEPTNO = 10 THEN 'ACCOUNTING'
	 			WHEN DEPTNO = 20 THEN 'RESEARCH'
	 			WHEN DEPTNO = 30 THEN 'SALES'
	 			ELSE 'OPERATIONS'
	 END 부서명
    FROM EMP;
    
SELECT *
FROM EMP;


--1.직급에 따라 급여를 인상하시오
--   ANAIYST 사원은 5%
--   CLERK      15%
--   SALESMAN   10%
--   MANAGER      20%
--   인상 시키시오
--   
--   사원번호   사원명   JOB      SAL      UPSAL
--   
--   인상율이 가장 높은 사람순으로 출력하되
--   소수점 3번째 자리에서 올림처리하시오
   
SELECT *
FROM EMP;
-- 이거는 개별로 올림처리를 해서 가독성과 실용성이 떨어진다.
SELECT EMPNO 사원번호, ENAME 사원명, JOB, SAL,
CASE		WHEN JOB = 'ANALYST' THEN CEIL((SAL + SAL / 100 * 5) * 100) / 100
	 		WHEN JOB = 'CLERK' THEN  CEIL((SAL + SAL / 100 * 15) * 100) / 100
	 		WHEN JOB = 'SALESMAN' THEN  CEIL((SAL + SAL / 100 * 10) * 100) / 100
            WHEN JOB = 'MANAGER' THEN  CEIL((SAL + SAL / 100 * 20) * 100) / 100
            ELSE		SAL
	 END UPSAL
FROM EMP
ORDER BY UPSAL DESC;

SELECT EMPNO 사원번호, ENAME 사원명, JOB, SAL,CEIL(
CASE		WHEN JOB = 'ANALYST' THEN (SAL + SAL / 100 * 5)
	 		WHEN JOB = 'CLERK' THEN (SAL + SAL / 100 * 15)
	 		WHEN JOB = 'SALESMAN' THEN (SAL + SAL / 100 * 10)
            WHEN JOB = 'MANAGER' THEN (SAL + SAL / 100 * 20)
            ELSE		SAL
	 END * 100) / 100  UPSAL
FROM EMP
ORDER BY UPSAL DESC;    
   
   
--   2.사원의 급여가 2000 이상인 사원들은 상
--   1000 이상인 사원들은 중
--   그 아래 사원들은 하로 급여등급을 출력하시오
--   급여가 가장 적은 사람순으로 출력하시오
--   
--   사원명   급여      SALARY_GRADE

SELECT *
FROM EMP;

SELECT ENAME 사원명, SAL 급여,
CASE        WHEN SAL >= 2000 THEN '상'
            WHEN SAL >= 1000 THEN '중'
            ELSE '하'
        END SALARY_GRADE
FROM EMP
ORDER BY SAL;
   
--   3.부서 정보에서 부서 위치를 미국의 동부, 중부, 서부로 구분하시오
--   부서명      LOC         AREA
--            NEW YORK   EAST
--            DALLAS      CENTER
--            CHICAGO      CENTER
--            BOSTON      EAST
SELECT *
FROM DEPT;

SELECT DNAME 부서명, LOC,
    DECODE(	LOC, 'NEW YORK', 'EAST',
	 			 'DALLAS', 'CENTER',
	 			 'CHICAGO', 'CENTER',
                 'BOSTON', 'EAST'
    )		AS AREA 
FROM DEPT;

SELECT *
FROM EMP;

SELECT SUM(SAL)
FROM EMP;

SELECT 800+1600+1250+2975+1250+2850+2450+5000+1500+950+3000+1300
FROM DUAL;

SELECT AVG(SAL)
FROM EMP;

SELECT (800+1600+1250+2975+1250+2850+2450+5000+1500+950+3000+1300) / 12
FROM DUAL;

SELECT (300 + 500 + 1400) / 12
FROM EMP;

SELECT (300 + 500 + 1400) / 3
FROM EMP;
--NULL값은 포함하지 않고 한다.
SELECT AVG(COMM)
FROM EMP;

SELECT MAX(SAL), MIN(SAL)
FROM EMP;

--1.선수들의 키 중에서 가장 큰 키와 몸무게가 가장 작은 값을 찾아라.
--큰키      적은몸무게

SELECT *
FROM PLAYER;

SELECT MAX(HEIGHT) 큰키, MIN(WEIGHT) 적은몸무게
FROM PLAYER;

--전체 사원의 평균 급여를 구하시오(소수점 1의 자리수 까지 구하시오 내림처리)
--평균급여

SELECT *
FROM EMP;

SELECT AVG(SAL)
FROM EMP;

SELECT TO_CHAR((TRUNC(AVG(SAL) * 10) / 10), 9999.9) 평균급여
FROM EMP;

--선수들 중 가장 나이가 많은 사람의 생년월일을 구하시오
--최고참선수_생년월일

SELECT *
FROM PLAYER;

SELECT MIN(BIRTH_DATE) "최고참선수_생년월일"
FROM PLAYER;

선수들 평균 몸무게를 구하시오
평균몸무게

SELECT *
FROM PLAYER;

SELECT AVG(WEIGHT) 평균몸무게
FROM PLAYER;

--단순 컬럼, 그룹 함수
SELECT ENAME, MAX(SAL)
FROM EMP;
--왜 에러가 날까?

SELECT POSITION, AVG(HEIGHT)평균키
FROM PLAYER;

SELECT POSITION, AVG(HEIGHT)평균키
FROM PLAYER
GROUP BY POSITION;


SELECT *
FROM DEPT;

SELECT DEPTNO, SUM(DEPTNO)
FROM DEPT
GROUP BY DEPTNO;

--사원 테이블에서 직업의 갯수, COMM을 받는 사원의 수
--사원 테이블에서 사원의 수
SELECT COUNT(JOB), COUNT(COMM)
FROM EMP;

--직업별 직무 사원의 수, COMM을 받는 사원의 수
SELECT JOB, COUNT(JOB),COUNT(COMM)
FROM EMP
GROUP BY JOB;

SELECT COUNT(DISTINCT JOB)
FROM EMP;

SELECT COUNT(*) 전체사원의수
FROM EMP;

--1. 10번 부서 소속의 사원 중에서 커미션을 받는 사원의 수를 구하시오 
--부서번호       사원수

SELECT *
FROM EMP;

SELECT DEPTNO 부서번호, COUNT(COMM)
FROM EMP
WHERE DEPTNO = 10
GROUP BY DEPTNO;

--2. 소속 부서별       급여총액        급여 평균을 구하시오 (소수점 3자리에서 반올림)
--부서번호         별칭없는 컬럼명       별칭없는 컬럼명
SELECT *
FROM EMP;

SELECT DEPTNO 부서번호, SUM(SAL), TO_CHAR(ROUND(AVG(SAL), 2))
FROM EMP
GROUP BY DEPTNO;

--3. 부서번호별 최대급여       최소급여
--부서번호를 오름차순 하시오
SELECT *
FROM EMP;

SELECT DEPTNO, MAX(SAL) 최대급여, MIN(SAL) 최소급여
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

--   4.선수들의 팀별 총 선수의 수와 닉네임이 존재하지 않는 선수의 수를 출력하시오
--   별칭없는 컬럼명      총선수의수         닉네임X수
--   총선수의 수가 가장 많은 순으로 정렬
SELECT *
FROM PLAYER;

SELECT *
FROM PLAYER
WHERE TEAM_ID = 'K05'
AND NICKNAME IS NULL;

SELECT TEAM_ID, COUNT(TEAM_ID)총선수의수, COUNT(NVL(NICKNAME, 'X')) - COUNT(NICKNAME) 닉네임X수
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY 총선수의수 DESC;

SELECT *
FROM EMP;

--부서 번호별 평균 급여가 2000이상인 부서번호와 평균급여를 구하시오
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

HAVING절에서 일반적으로 그룹함수를 적용한 컬럼이 조건으로 온다
WHERE 절은 단순컬럼들이 온다.

--1.부서의 최대값과 최소값을 구하되 
--   최대 급여가 2900 초과인 부서만 출력하시오
--   부서번호가 빠른 순으로 

--부서번호        최대
SELECT *
FROM EMP;

SELECT DEPTNO 부서번호, MAX(SAL) "max", MIN(SAL) "min"
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 2900
ORDER BY DEPTNO;

-- 2.선수테이블에서
--   포지션별 최대키, 최소키, 평균키를 출력하시오
--                  count(height)
--   포지션      인원수   키대상       최대키   최소키   일반평균키      null적용평균키
--   단, null값이 150를 적용한다
SELECT *
FROM PLAYER;

SELECT *
FROM PLAYER
WHERE POSITION = 'DF'
AND HEIGHT IS NULL;


--SELECT POSITION 포지션, COUNT(PLAYER_ID) 인원수, COUNT(HEIGHT) 키대상
--, MAX(HEIGHT)최대키, MIN(HEIGHT)최소키, AVG(HEIGHT)일반평균키
--, AVG(NVL(HEIGHT, 150)) "null적용평균키"
--FROM PLAYER
--GROUP BY POSITION;


SELECT POSITION 포지션, COUNT(PLAYER_ID) 인원수, COUNT(HEIGHT) 키대상
, MAX(HEIGHT)최대키, MIN(HEIGHT)최소키, AVG(HEIGHT)일반평균키
, AVG(NVL(HEIGHT, 150)) "null적용평균키"
FROM PLAYER
GROUP BY POSITION;

--3.평균키가 180이상인 
--   포지션별 평균키를 반올림으로 소수점 3번째 자리에서 적용한 값을 구하시오
--   포지션      평균키
SELECT *
FROM PLAYER;

SELECT POSITION 포지션, ROUND(AVG(HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING AVG(HEIGHT) >= 180;

   
--   4.선수들 중 삼성블루윙즈와 fc서울의 인원수는 얼마인가?
--   팀ID      인원수      
SELECT *
FROM PLAYER;

SELECT *
FROM TEAM;

SELECT COUNT(PLAYER_ID)
FROM PLAYER
WHERE TEAM_ID = 'K09';

SELECT TEAM_ID 팀ID, COUNT(PLAYER_ID) 인원수
FROM PLAYER
GROUP BY TEAM_ID
HAVING TEAM_ID = 'K09'
OR TEAM_ID = 'K02';
         
--   5.포지션별 평균키만 출력하는데
--   최대키가 190 이상인 선수를 가지고 있는 포지션의 정보만 출력하시오
--   포지션   평균키
SELECT *
FROM PLAYER;

SELECT POSITION 포지션, AVG(HEIGHT) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING MAX(HEIGHT) >= 190;


SELECT *
FROM EMP
WHERE ROWNUM = 1;

SELECT *
FROM EMP
WHERE ROWNUM <= 3;


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
