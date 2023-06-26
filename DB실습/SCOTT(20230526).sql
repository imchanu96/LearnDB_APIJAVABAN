--1. 사원의 급여가 2000에서 3000사이의 급여를 받는 사원을 조회하시오
--사원번호        사원명     급여
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE 2000 <= SAL
AND 3000 >= SAL;


--2. 급여가 2000미만이거나 3000 이상인 사원을 검색하시오
--사원번호       사원명     급여

SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE 2000 >= SAL
OR 3000 <= SAL;


--3. 커미션이 300이거나 500이거나 1400인 사원을 검색하시오
--사원번호        사원명     급여

SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE COMM = 300
OR COMM = 500
OR COMM = 1400;

--4. 사원 번호가 7521이거나 7844인 사원의 급여를 검색하시오
--empNo, Sal

SELECT EMPNO, SAL
FROM EMP
WHERE EMPNO = 7521
OR EMPNO = 7844;

--5. 소속이 삼성블루윙즈이면서 키가 170 이상인 선수들을
--조회하시오
--선수명     팀번호     포지션     백넘버     키

SELECT *
FROM PLAYER;

SELECT *
FROM TEAM;

SELECT PLAYER_NAME 선수명, TEAM_ID 팀번호, POSITION 포지션
,  BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND HEIGHT >= 170;


SELECT *
FROM EMP;

CREATE TABLE MY_ACCOUNT(
    NO NUMBER,
    NAME VARCHAR2(100),
    MONEY NUMBER
);


SELECT *
FROM my_account;

INSERT INTO my_account
VALUE(NO, NAME, MONEY)
VALUES(1, '홍길동', 0);

INSERT INTO my_account
VALUE(NO, NAME, MONEY)
VALUES(2, 'ㄴㅇㄹ', 0);

INSERT INTO my_account
VALUE(NO, NAME, MONEY)
VALUES(3, '성춘향', -243234);

ROLLBACK;

SELECT *
FROM EMP;

CREATE TABLE TEMP_EMP
AS
SELECT *
FROM EMP;

DESC TEMP_EMP;

SELECT *
FROM TEMP_EMP;


CREATE TABLE TTT
AS
SELECT ENAME, SAL
FROM EMP;

SELECT *
FROM TTT;

UPDATE TTT
SET SAL = 1000;

ROLLBACK;

UPDATE TTT
SET SAL = 1000
WHERE ENAME = 'JONES';      --JONES  2975

UPDATE TTT
SET SAL = SAL + 50
WHERE SAL <= 1500;

UPDATE TTT
SET SAL = 1500
WHERE SAL <= 1500;

DROP TABLE TTT;

ROLLBACK;
--문제
--스미스는 통장에 개설했다.
--궁금해서 100원을 입금했다.
SELECT *
FROM TEMP_EMP;

SELECT *
FROM MY_ACCOUNT;

UPDATE TEMP_EMP
SET SAL = SAL - 100
WHERE ENAME = 'SMITH';

SELECT *
FROM TEMP_EMP;

INSERT INTO my_account
VALUES(1, 'SMITH', 100);

SELECT *
FROM MY_ACCOUNT;
--월급날이다.
--사장님이 SMITH에게 월급 200원을 줬다.
--SMITH는 돈을 받았다.
SELECT *
FROM TEMP_EMP;

UPDATE temp_emp
SET SAL = SAL - 200
WHERE ENAME = 'KING';

SELECT *
FROM TEMP_EMP;

UPDATE temp_emp
SET SAL = SAL + 200
WHERE ENAME = 'SMITH';

SELECT *
FROM TEMP_EMP;
--SMITH는 통장에 500원을 입금했다.


UPDATE temp_emp
SET SAL = SAL - 500
WHERE ENAME = 'SMITH';

SELECT *
FROM TEMP_EMP;

SELECT *
FROM my_account;

UPDATE my_account
SET MONEY = MONEY + 500
WHERE NO = 1;

SELECT *
FROM my_account;
--나는 회사에 취업했다.
--통장을 개설했는데 내돈이 2000원 있어서
--1000원을 적금했다.
SELECT *
FROM temp_emp;

INSERT INTO TEMP_EMP
VALUE(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
VALUES(7999, 'CHANU', 'Developer', '7998'
, '23/05/26', 2000, 10);

SELECT *
FROM temp_emp;

UPDATE TEMP_EMP
SET SAL = SAL - 1000
WHERE ENAME = 'CHANU';

SELECT *
FROM temp_emp;

INSERT INTO my_account
VALUES(2, 'CHANU', 1000);

SELECT *
FROM my_account;

SELECT *
FROM temp_emp;
--회사에서 월급날이 되어서
--사장님이 200원을 줬다.
--나는 월급을 받았다.
SELECT *
FROM temp_emp;

UPDATE TEMP_EMP
SET SAL = SAL - 200
WHERE ENAME = 'KING';

SELECT *
FROM temp_emp;

UPDATE TEMP_EMP
SET SAL = SAL + 200
WHERE ENAME = 'CHANU';

SELECT *
FROM temp_emp;
--나는 월세를 내려고 300원을 계좌에서 찾았다.

SELECT *
FROM my_account;

UPDATE my_account
SET MONEY = MONEY - 300
WHERE NAME = 'CHANU';

SELECT *
FROM my_account;
--3사람은 돈을 얼마를 가졌을까요?
SELECT *
FROM temp_emp
WHERE ENAME = 'SMITH'
OR ENAME = 'CHANU'
OR ENAME = 'KING';

SELECT *
FROM my_account;

COMMIT;

-- SMITH 계좌 600 + 소지금 400 == 1000
-- KING 소지금 4600           == 4600
-- CHANU 계좌 700 + 소지금 1200 == 1900

DROP TABLE TEMP_EMP;
DROP TABLE MY_ACCOUNT;


SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
FROM PLAYER;

SELECT PLAYER_NAME, WEIGHT
FROM PLAYER
WHERE WEIGHT BETWEEN 70 AND 80;