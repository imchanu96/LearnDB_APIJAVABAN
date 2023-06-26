SELECT *
FROM EMP
WHERE COMM = 300
OR COMM = 500
OR COMM = 1400;

--사원 중 커미션이 300 또는 500 이거나 1400인
--사원들을 조회하시오
SELECT *
FROM EMP
WHERE COMM IN(300, 500, 1400);

--1. 사원의 번호가 7521 이거나 7654 또는 7844 인 사원을 검색하시오 IN연산자.
SELECT *
FROM EMP;

SELECT * 
FROM EMP
WHERE EMPNO IN(7521, 7654, 7844);

--2. 부서번호가 20 또는 10이 아닌 사원들을 조회하시오
--사원명     직업      상사번호    부서번호
SELECT *
FROM EMP;

SELECT ENAME 사원명, JOB 직업, MGR 상사번호, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO NOT IN(20, 10);

--사원의 이름이 두 번째 글자가 A인 사람을 찾아라
--글자수 위치를 정해서 찾을경우 앞에 글자수 만큼 언더바를 넣어주면 된다.
SELECT *
FROM EMP
WHERE JOB LIKE '_A%';

--1. 사원들 중에서 이름이 J로 시작하는 사람만을 찾으시오
--사원명     직업      급여
SELECT *
FROM EMP;

SELECT ENAME 사원명, JOB 직업, SAL 급여
FROM EMP
WHERE ENAME LIKE 'J%';

--2.사원들 중에서 이름이 N이 포함되는 사람만 찾으시오
--사원명     직업  급여
SELECT *
FROM EMP;

SELECT ENAME 사원명, JOB 직업, SAL 급여
FROM EMP
WHERE ENAME LIKE '%N%';

--3. 선수 중에서 장씨 성과 박씨 성을 찾으시오
--선수번호    선수명
SELECT *
FROM PLAYER;

SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명
FROM PLAYER
WHERE PLAYER_NAME LIKE '장%' 
OR PLAYER_NAME LIKE '박%'; 


--4. 사원들 중에서 이름이 3번째 글자가 I인 사람만을 찾으시오
--사원번호 사원명
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE ENAME LIKE '__I%';

--5.M과 I를 포함하고 있는 이름 검색
--   사원번호      사원명
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE ENAME LIKE '%M%'
AND ENAME LIKE '%I%';

SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE ENAME LIKE '%M%I%'
OR ENAME LIKE '%I%M%';
   
--6.SALES로 시작하는 직군을 제외하고 검색
--   사원번호      사원명      직업
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE NOT JOB LIKE 'SALES%';  
   
--7.다섯 자리 이름만 검색
--   사원번호      사원명      직업
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE ENAME LIKE '_____'; 

   
--8.다섯 자리 이름 중 세째자리가 A인 사원만 검색
--   사원번호      사원명      직업
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE ENAME LIKE '_____'
AND ENAME LIKE '__A%';

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE ENAME LIKE '__A__';


   
--9. 부서번호가 30이면서 AM을 포함하고 있는 사원을 검색하시오
--   사원번호      사원명      직업      부서번호
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO LIKE 30
AND ENAME LIKE '%AM%';



SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE COMM = NULL;

--커미션을 받지 못하는 사원을 검색
SELECT *
FROM EMP
WHERE COMM IS NULL;

--1.사원 중 상관이 없는 사원을 검색하시오
--전체 컬럼 조회
SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE MGR IS NULL;

--2. 포지션이 없는 선수들을 조회하시오
--선수명     포지션     팀ID
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, TEAM_ID 팀ID
FROM PLAYER
WHERE POSITION IS NULL;

SELECT *
FROM EMP
WHERE SAL != 800;

SELECT *
FROM EMP
WHERE SAL ^= 800;

SELECT *
FROM EMP
WHERE SAL <> 800;

SELECT *
FROM EMP
WHERE NOT SAL = 800;


--1. 선수 테이블에서 국적이 내국인이 아닌 경우 선수와 국적을 표시하라
--선수명     국적
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, NATION 국적
FROM PLAYER
WHERE NATION IS NOT NULL;


--2. 팀 ID가 K02이면서
--포지션이 MF가 아닌 선수들을 조회하시오
--선수명     팀ID     포지션
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, TEAM_ID 팀ID, POSITION 포지션
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND POSITION <> 'MF';

COMMIT;

ROLLBACK;
--롤백 시점 알아보기
INSERT INTO PLAYER
VALUE(PLAYER_ID, PLAYER_NAME, TEAM_ID, NATION)
VALUES('8007178', '우르모브S234', 'K06', 'NULL');

ROLLBACK;

DELETE FROM PLAYER
WHERE PLAYER_NAME = '우르모브S234';

SELECT *
FROM PLAYER;

CREATE TABLE TEST_A
(
    NO NUMBER
);

ROLLBACK;

SELECT *
FROM PLAYER;

DROP TABLE TEST_A;


--소속팀이 삼성블루윙즈이거나 전남드래곤즈에 소속된 선수들이어야 하고,
--포지션이 미드필더이어야 한다.
--키는 170센티미터 이상이고 180 이하이여야 한다.

--여기에 해당하는 선수들을 조회하시오
--선수명     포지션     백넘버     키
SELECT *
FROM TEAM;

SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE POSITION = 'MF'
AND HEIGHT BETWEEN 170 AND 180
AND TEAM_ID IN('K02', 'K07');


SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE POSITION = 'MF'
AND HEIGHT >= 170 
AND HEIGHT <= 180
AND TEAM_ID = 'K02'

OR POSITION = 'MF'
AND HEIGHT >= 170 
AND HEIGHT <= 180
AND TEAM_ID = 'K07';

SELECT TEAM_NAME = '삼성블루윙즈'
OR (REGION_NAME = '전남'
AND TEAM_NAME = '드래곤즈');


SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE (TEAM_ID = 'K02' or TEAM_ID = 'K07')
AND POSITION = 'MF'
AND HEIGHT >= 170 
AND HEIGHT <= 180;

SELECT *
FROM EMP;

SELECT *
FROM EMP
ORDER BY SAL ASC;

SELECT *
FROM EMP
ORDER BY SAL DESC;

--1. 사원의 이름이 가장 느린 사원의 이름순으로 정렬하시오
--사원번호        사원명     급여
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
ORDER BY ENAME DESC;

--2. EMP테이블에서 사원 번호를 기준으로 내림차순으로 정렬하여
--사원 번호와 사원명 컬럼을 표시하시오
SELECT *
FROM EMP;

SELECT *
FROM EMP
ORDER BY EMPNO DESC;

--3.사원 중 신입 사원에서 고참 사원 순으로 출력하시오
SELECT *
FROM EMP
ORDER BY HIREDATE DESC;

-- DEPTNO 우선 내림차순 정렬, ENAME 내림차순 정렬
SELECT *
FROM EMP
ORDER BY DEPTNO, ENAME DESC; 

--1. 급여가 가장 높은 순으로 출력하고 숫자가 동일하면 사원명이 빠른 순으로 정렬하시오 
--사원명     급여

SELECT ENAME 사원명, SAL 급여
FROM EMP
ORDER BY SAL DESC, ENAME ASC;

--2. 부서 번호가 빠른 사원부터 출력하되
--같은 부서내의 사원을 출력할 경우 최근에 입사한
--사원부터 출력하되 사원 번호, 입사일, 사원명, 급여 컬럼을 출력하시오

SELECT EMPNO "사원 번호", HIREDATE 입사일, ENAME 사원명, SAL 급여
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

SELECT EMPNO "사원 번호", HIREDATE 입사일, ENAME 사원명, SAL 급여, DEPTNO 부서번호
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;


--3. 키가 큰 순서대로, 키가 같은 경우 백넘버 순으로
--정렬한다( 단, 키가 NULL인 데이터는 제외한다.)
--선수명     포지션     백넘버     키
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, BACK_NO;

--4. 부서명이 빠른 순으로, 그 후 부서위치 글자가 빠른 순으로,
--그 후 부서번호가 큰 순으로 정렬하시오.
--부서명     위치      부서번호
SELECT *
FROM DEPT;

SELECT DNAME 부서명, LOC 위치, DEPTNO 부서번호
FROM DEPT
ORDER BY DNAME, LOC, DEPTNO DESC;

SELECT ENAME
FROM EMP;

SELECT length('%sdf'), length(ename)
FROM EMP;

SELECT length('신기하네')
FROM EMP;

SELECT 21312
FROM EMP;

--디버깅을 도와줄 테이블이다.
SELECT length('신기하네'), 23
FROM DUAL;

SELECT *
FROM DUAL;

DESC DUAL;

SELECT ROUND(150000 / 7, 3)
FROM DUAL;

--대문자로 변경
SELECT 'welcome to Oracle', upper('welcome to Oracle')
FROM DUAL;
--소문자로 변경
SELECT 'welcome to Oracle', lower('welcome to Oracle')
FROM DUAL;
--문자열 길이
SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;
--바이트 수를 알려주는 함수
SELECT LENGTHB('ORACLE'), LENGTHB('오라클')
FROM DUAL;

SELECT '아 집에 가고 싶다 너무 졸리다.'
FROM DUAL;

--1.사용자로부터 문자열 입력을 받았다
--사원테이블의 직급이 비밀번호라고 가정한다.
--직급을 사용자가 소문자로 manager이라고 입력했다면
--틀린게 아니라 비밀번호가 맞다고 할려고 한다면 어떨게 SQL문을 작성하여야
--하는가?

--manager인 사원을 모두 조회하시오
--사원명     직급
SELECT *
FROM EMP;

SELECT ENAME 사원명, LOWER(JOB) 직급
FROM EMP
WHERE JOB = 'MANAGER';
-- WHERE 절에 변화할수 있다.  (다른곳에 주지말고 WHERE에 변화를 줘라)
-- 밑에가 문제에 좀더 적합한 풀이이다.
SELECT ENAME 사원명, JOB 직급
FROM (EMP);
WHERE JOB = upper('manager');
--2. 경기장의 지역번호와 전화번호를 합친 번호의 길이를 구하시오
--STADIUM_ID      TEL           T_LEN
--출력 예시
--D03             063273-1763     11
--B02             031753-3956     11
--C06             054282-2002     11
--,
--,
--,
--F04             055            3
--F05             031            3
SELECT *
FROM STADIUM;

SELECT STADIUM_ID, DDD || TEL  AS TEL , LENGTH(DDD || TEL) AS T_TEL
FROM STADIUM;

SELECT STADIUM_ID, CONCAT(DDD, TEL) AS TEL , LENGTH(CONCAT(DDD, TEL)) AS T_TEL
FROM STADIUM;