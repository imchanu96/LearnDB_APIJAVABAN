/*
SELECT
데이터를 조회하는 SQL문

표현식
SELECT 보고 싶은 컬럼명1, 보고 싶은 컬럼명2, ,,,
FROM 해당 컬럼들이 있는 테이블명;
*/
DESC DEPT;

-- SELECT는 COLUMN값을 순차적으로 적지 않아도 볼수 있다.
SELECT DEPTNO, DNAME, LOC
FROM DEPT;

SELECT LOC, DEPTNO, DNAME
FROM DEPT;

DESC PLAYER;

SELECT PLAYER_NAME, POSITION, BACK_NO ,BIRTH_DATE
FROM PLAYER;

--WILDCARD 사용하기
--와일드 카드 중 하나이며 해당 테이블의 모든 컬럼 정보를 보고 싶을 경우에
--사용한다. (에스터리스크) (에스테리크)

SELECT *
FROM EMP;

--좌측 정렬 : 문자 및 날짜 데이터
--우측 정렬 : 숫자 데이터

DESC EMP;

SELECT ENAME, HIREDATE, SAL
FROM EMP;

INSERT INTO EMP
VALUE(EMPNO, ENAME)
VALUES(1234, '1234');


--산술연산자
SELECT ENAME, SAL, SAL + 100
FROM EMP;

SELECT ENAME, SAL, SAL / 200
FROM EMP;

DESC EMP;

/*
BONUS 보너스
EMP 사원
EDPT 부서
SAL 월급
PLAYER 선수
SALGRADE 급여등급
SCHEDULE 축구경기일정
STADIUM 축구경기장

2번 문제 
1. 사원의 연봉을 구하시오
(사원의 급여는 월급이다.)
사원명     월급      연봉
2. 선수들의 키에서 몸무게를 뺀 값을 구하시오
이름      키-몸무게
*/
SELECT *
FROM EMP;

SELECT ENAME, SAL, SAL * 12
FROM EMP;

SELECT *
FROM PLAYER;

SELECT PLAYER_NAME, HEIGHT - WEIGHT
FROM PLAYER;
/*
--ALIAS 부여하기
조회된 결과에 일종의 별명을 보여해서 컬럼 레이블을 변경할 수 있다.
- 컬럼명 바로 뒤에 작성해야 된다.
- 컬럼명과 ALIAS 사이에 AS 키워드를 사용할 수도 있다. 
-(AS를 써도 되고 안써도 된다. 띄어쓰기만 하면 묵시가능)

- 이중 인용부호는 공백, 특수문자를 포함할 경우와 대소문자 구분이 필요한 경우 사용된다.
*/
SELECT ENAME AS 사원명, SAL AS 월급, SAL * 12 AS 연봉
FROM EMP;

SELECT PLAYER_NAME AS "선수 이름", HEIGHT - WEIGHT AS "키-몸무게"
FROM PLAYER;

DESC DEPT;

SELECT DEPTNO AS 부서번호, DNAME 부서명, LOC 부서위치
FROM DEPT;


SELECT ENAME AS 사원명, SAL AS 월급, SAL * 12 AS 연봉, SAL + NULL
FROM EMP;
/*
@NULL도 데이터다
오라클에서 NULL은 매우 중요한 데이터이다.
NULL의 특징
- 0이 아니다
- 빈 공간이 아니다.
- 미확정, 알수 없는 값을 의미(UNKNOWN)
- 어떤 값인지 알 수 없지만 값은 존재함
- 연산, 할당, 비교가 불가능
NULL의 모든 연산 결과는 NULL이다.
EX: 숫자 + NULL => NULL
문자 + NULL => NULL 등
*/

SELECT *
FROM EMP;

-- 사원의 연봉을 구하시오 (사원의 급여는 월급이다.)
--      사원명         월급      연봉              연봉+인센티브
SELECT ENAME 사원명, SAL 월급, SAL * 12 연봉, (SAL * 12) + COMM "연봉+인센티브"
FROM EMP;

-- BMI 비만지수를 구하시오
-- 선수명      BMI 비만지수
SELECT PLAYER_NAME, WEIGHT, HEIGHT
FROM PLAYER;

SELECT PLAYER_NAME 선수명, ROUND(((WEIGHT / ((HEIGHT/100) * (HEIGHT/100)))), 2) AS BMI지수
FROM PLAYER;


합성 연산자(CONCATENATION)
문자와 문자를 연결하는 합성 연산자이다.
- 문자와 문자를 연결하는 경우 2개의 수직 바(|)를 사용한다.
- 컬럼과 문자 또는 다른 컬럼과 연결시킨다.
- 문자 표현식의 결과에 의해 새로운 컬럼이 생성된다.

SELECT *
FROM DEPT;

SELECT '부서번호가' || DEPTNO || '인 곳들은' || LOC || '에 있다.'
FROM DEPT;

--1.다음과 같은 선수들의 출력 형태를 만드시오
--체격정보         키 cm        몸무게 kg
--박지성 선수,     176cm       70kg
SELECT PLAYER_NAME, HEIGHT, WEIGHT
FROM PLAYER;

SELECT PLAYER_NAME || '선수, ' || HEIGHT || ' cm, ' || WEIGHT || ' kg' AS 체격정보
FROM PLAYER;

--2.사원들의 자기 소개서 작성
--자기소개서
--나의 이름은 ??? 입니다 입사한 날은 ???이고 직업은 ???인데요 앞으로 잘 부탁드립니다.

SELECT ENAME, HIREDATE, job
FROM EMP;

SELECT '나의 이름은 ' || ENAME || ' 입니다 입사한 날은 ' || HIREDATE || 
'이고 직업은 ' || job || ' 인데요 앞으로 잘 부탁드립니다.' AS 자기소개서
FROM EMP;

/*
where절
테이블에서 원하는 로우만 얻으려면 where절을 사용해야 한다.

표현식
SELECT 컬럼명 [ALIAS명]
FROM 테이블명
WHERE 조건식;

WHERE 절은 FROM절 다음에 위치하며, 조건식 아래 내용으로 구성된다.
- 컬럼명(보통 조건식의 좌측에 위치)
- 비교 연산자
- 문자, 숫자, 표현식(보통 조건식의 우측에 위치)
- 비교 컬럼명(JOIN 사용시)

연산자의 종류
거의 자바와 비슷
EX : 비교 연산자, 논리연산자등
()연산자의 우선 순위가 가장 높다

1. 비교 연산자
=, >, >= 등등
*/

SELECT *
FROM EMP;

--사원 테이블에서 급여가 2000이상인 사원들을 조회하시오
SELECT *
FROM EMP
WHERE SAL >= 2000;

SELECT *
FROM PLAYER;

SELECT PLAYER_NAME, BACK_NO, nickname, position
FROM PLAYER
WHERE NICKNAME = '킹카';

SELECT *
FROM EMP
WHERE JOB = 'SALESMAN';


--WHERE
--1. 급여가 1500 이하인 사원을 출력하시오
--사원 번호       사원명     급여
DESC EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP;

SELECT EMPNO "사원 번호", ENAME 사원명, SAL 급여
FROM EMP
WHERE SAL <= 1500;

--2. 축구선수 포지션이 골키퍼인 선수들만 출력하시오
--선수명     포지션     백넘버(등번호)     키
DESC PLAYER;

SELECT POSITION
FROM PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO "백넘버(등번호)", HEIGHT 키
FROM PLAYER
WHERE POSITION = 'GK';


--3. 사원 중 이름이 SMITH인 사원의 모든 정보를 출력하시오.
DESC EMP;

SELECT *
FROM EMP
WHERE ENAME = 'SMITH';

--4. 선수 테이블에서 키가 170 센티미터 이상인 사람을 찾으시오.
-- 선수명      키       포지션     팀번호
DESC PLAYER;

SELECT PLAYER_NAME 선수명, HEIGHT 키, POSITION 포지션, TEAM_ID 팀번호
FROM PLAYER
WHERE HEIGHT >= 170;

SELECT *
FROM EMP;

--날짜?
SELECT *
FROM EMP
WHERE HIREDATE <= '81/02/22';

DESC EMP;

/*
2. 논리 연산자

AND     AND라고 적는다   두 결과가 참이면 TRUE
OR      OR라고 적는다    하나가 참이면 TRUE 둘 다 FALSE이면 FALSE
NOT     부정연산자이다 NOT이라고 적는다 조건의 결과를 되돌려 준다
*/

SELECT *
FROM EMP;

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE NOT DEPTNO = 10
AND JOB ='MANAGER';

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE NOT DEPTNO = 10
OR JOB ='MANAGER';

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE NOT DEPTNO = 10;
