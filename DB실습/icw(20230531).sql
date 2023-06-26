-- SUBSTRING 사용하기, ORACLE은 0인덱스에서 시작안하고 1인덱스에서 시작한다.
SELECT 'Welcome to Oracle', substr('Welcome to Oracle', 4, 3)
FROM DUAL;
-- 음수도 가능
SELECT 'Welcome to Oracle', substr('Welcome to Oracle', -2, 3)
FROM DUAL;


--1. SQL Expert라는 문자열이 있다.
--Exp라는 문자열을 출력하시오
SELECT SUBSTR('SQL Expert', 5, 3)
FROM DUAL;

--2. SQL Expert라는 문자열이 있다.
--xpert를 대문자로 변경하여 출력하시오
SELECT UPPER(SUBSTR('SQL Expert', 6, 5))
FROM DUAL;

-- 3.사원 테이블의 입사년도 컬럼에서 년도와 달을 출력하시오
--   입사년도      년도      달
--                 81      02
--                 80      12
--            ,,,
--   
--   4.9월에 입사한 사원을 출력하시오
--   사원명      입사년도
SELECT *
FROM EMP;

SELECT ENAME 사원명, HIREDATE 입사년도
FROM EMP
WHERE SUBSTR(HIREDATE, 4, 2) = '09';
--문자열 ? 문자열

SELECT ENAME 사원명, HIREDATE 입사년도
FROM EMP
WHERE SUBSTR(HIREDATE, 4, 2) = 10 - 1;

SELECT SUBSTR(HIREDATE, 4, 2)
FROM EMP;

SELECT 049
FROM DUAL;

SELECT 'A'
FROM DUAL;

SELECT HIREDATE, 09, 9
FROM EMP;

SELECT HIREDATE, 09, 9
FROM EMP
WHERE 09 = 9
OR 9 = 09;

--5.선수 테이블에서 생년월일이 87년 생인 선수들을 조회하시오
--   선수명   생년월일
SELECT PLAYER_NAME, BIRTH_DATE
FROM PLAYER;

SELECT PLAYER_NAME, SUBSTR(BIRTH_DATE, 1, 2) 생년월일
FROM PLAYER;

SELECT PLAYER_NAME, SUBSTR(BIRTH_DATE, 1, 2) 생년월일
FROM PLAYER
WHERE SUBSTR(BIRTH_DATE, 1, 2) = 87;
   
--   6.where ename like '%E';
--   라는 sql문이 있다
--   이를 substr을 활용하여 같은 기능을 구현하시오
--   전체 컬럼

SELECT *
FROM EMP;

SELECT *
FROM EMP
WHERE ENAME LIKE '%E';

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, -1,1) = 'E';


SELECT INSTR('Welcome to Oracle', 'o'),
INSTR('Welcome to Oracle', 'o', 1, 1), INSTR('Welcome to Oracle', 'o', 6, 1)
FROM DUAL;

SELECT INSTR('Welcome to Oracle', 'o', 6, 1)
FROM DUAL;

SELECT SUBSTR('......oracle', INSTR('Welcome to Oracle', 'o', 6, 1), 1)
FROM DUAL;


사원의 이름이 있다.
사원 테이블에서 3번째글자중 R인 사원을 조회하시오
EMPNO    ENAME

SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '__R%';
--1. 위의 쿼리문의 지문을 글로 작성하시오.

--2. 위의 문제를 LIKE 없이 구현하시오
SELECT EMPNO, ENAME
FROM EMP
WHERE INSTR(ENAME, 'R' , 3, 1) = 3; 

SELECT TRIM('a' FROM 'aaaaOraclEaaaa')
FROM DUAL;


SELECT TRIM('   Oracle  '), LENGTH('   Oracle  ')
, LENGTH(TRIM('   Oracle  '))
FROM DUAL;

SELECT 34.5678, FLOOR(34.5678)
FROM DUAL;

SELECT FLOOR(34.5678 * 100) / 100 숫자야
FROM DUAL;

SELECT 34.5678, ROUND(34.5678), ROUND(34.5678, 2)
FROM DUAL;


--1. 34.5678이라는 숫자를 반올림처리하여
--30이라는 숫자가 나오도록 작성하시오
SELECT ROUND(34.5678 / 10) * 10
FROM DUAL;

SELECT FLOOR(34.5678 / 10) * 10
FROM DUAL;

--35.5678이 반올림 해서 40이 되게 하라
SELECT ROUND(35.5678 / 10) * 10
FROM DUAL;

SELECT 34.5678, TRUNC(34.5678)
, TRUNC(34.5678, 1), TRUNC(34.5678, -1)
FROM DUAL;

SELECT 27 /  2, MOD(27, 2), MOD(27, 5)
FROM DUAL;

--ORACLE에서 나머지 구할때 %는 사용하지 못하고 MOD를 사용하여 구한다.
SELECT 27%2
FROM DUAL;

--1.사원들의 연봉은 (SAL + 3000)라고 친다.
--위와 같은 경우
--각 사원들의 월급은 얼마인지 구하시오
--연봉에서 월급을 구하는데 소수점 2번째 자리에서 반올림
--연봉에서 월급을 구하는데 소수점 2번째 자리에서 내림처리한 결과
--급여가 가장 높은 순으로 정렬
--ENAME       SAL     연봉      월급(ROUND)   월급(????)

SELECT *
FROM EMP;

SELECT ENAME, SAL, (SAL + 3000) 연봉, ROUND((SAL + 3000) / 12, 1) "월급(ROUND)"
, TRUNC((SAL + 3000) / 12, 1) "월급(TRUNC)"
FROM EMP
ORDER BY SAL DESC;

-- 2.선수들의 키가 짝수인 사람들만 출력하는데
--   키가 작은 순으로 정렬하시오
--   선수명      키
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, HEIGHT 키
FROM PLAYER
WHERE MOD(HEIGHT, 2) = 0
ORDER BY HEIGHT;



--현재 날짜와 시각을 출력한다.
SELECT SYSDATE
FROM DUAL;


SELECT SYSDATE - 1 어제, SYSDATE 현재, SYSDATE + 1 내일
FROM DUAL;

사원들의 경력(년차수)를 구하시오
SELECT EMPNO, ENAME, SYSDATE, HIREDATE, SAL
FROM EMP;

--데이터가 1900년도 여서 가능함
SELECT ENAME, SYSDATE, HIREDATE
, SUBSTR(SYSDATE, 1, 2) + (100 - SUBSTR(HIREDATE, 1, 2)) "경력(년차)"
FROM EMP;

SELECT ENAME, SYSDATE, HIREDATE
, CEIL((SYSDATE - HIREDATE) / 365) "경력(년차)"
FROM EMP;
--------------증명을 해보왔는데 안됨
SELECT (SYSDATE - HIREDATE)
FROM EMP;

SELECT ENAME, SYSDATE, HIREDATE 
, (2000 + SUBSTR(SYSDATE, 1, 2)) * 365 + SUBSTR(SYSDATE, 4, 2) * 12 + SUBSTR(SYSDATE, 7, 2)
, (1900 + SUBSTR(HIREDATE, 1, 2)) * 365 + SUBSTR(HIREDATE, 4, 2) * 12 + SUBSTR(HIREDATE, 7, 2)
,((2000 + SUBSTR(SYSDATE, 1, 2)) * 365 + SUBSTR(SYSDATE, 4, 2) * 12 + SUBSTR(SYSDATE, 7, 2))
- ((1900 + SUBSTR(HIREDATE, 1, 2)) * 365 + SUBSTR(HIREDATE, 4, 2) * 12 + SUBSTR(HIREDATE, 7, 2))
FROM EMP;

--숫자형을 문자형으로 변환
--0           자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채운다.
--9           자릿수를 나타내며 자릿수가 맞지 않아도 채우지 않는다.
--L           각 지역별 통화 기호를 앞에 표시한다.
--.           소수점 표시
--,           천 단위 자리 구분
SELECT TO_CHAR(12300), TO_CHAR(12300) + 20000, TO_CHAR(12300) * 20000
FROM DUAL;
--                                  형식
SELECT ENAME, SAL, TO_CHAR(SAL, 'L999,999')
FROM EMP;

--                                  0 8개
SELECT ENAME, SAL, TO_CHAR(SAL, '00000000'), TO_CHAR(123456, '999,999,999')
FROM EMP;

--문자열 타입이지만 숫자로서의 의미를 가지는 값을 숫자로 형변환해서 리턴함
SELECT '20,000' - '10,000'
FROM DUAL;
--                          패턴
SELECT TO_NUMBER('20,000', '99,999') - TO_NUMBER('10,000', '99,999')
FROM DUAL;

SELECT TO_CHAR(TO_NUMBER('20,000', '99,999')
- TO_NUMBER('10,500', '99,999'), '999,999,999') "20,000 - 10,500은 몇이냐"
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD') 날짜
, TO_CHAR(SYSDATE, 'YYYY, MON, DAY') 문자형
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY AM HH24:MI:SS') "모든 시간 표시"
FROM DUAL;

--사원? 입사날짜 DATE
--이 사원들은 몇 시 분에? 입사했을까?
--사원명       직급      입사날짜        년월일 ????/??/??  시분초 ??,??,??
DESC EMP;

SELECT ENAME 사원명, JOB 직급, HIREDATE 입사날짜
, TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') "년월일 시분초"
FROM EMP;


현재 날짜를 기준으로 2023년05월31일21시08분42초
SELECT SYSDATE
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY') || '년' 
    || TO_CHAR(SYSDATE, 'MM') || '월'
    || TO_CHAR(SYSDATE, 'DD') || '일 '
    || TO_CHAR(SYSDATE, 'HH24') || '시'
    || TO_CHAR(SYSDATE, 'MI') || '분'
    || TO_CHAR(SYSDATE, 'SS') || '초' AS "한국 전용 달력"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일 " HH24"시" MI"분" SS"초"' ) "한국 전용 달력"
FROM DUAL;

1981년10월20일의 DATE을 만들기

SELECT TO_DATE('19811020', 'YYYYMMDD')
FROM DUAL;

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = '19811117';

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = TO_DATE('1981/11/17', 'YY/MM/DD');