SELECT *
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND EMP.ENAME = 'SMITH';

--부서테이블 기본키 추가
ALTER TABLE DEPT
ADD CONSTRAINT DEPT_DEPTNO_PY PRIMARY KEY(DEPTNO);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT';

DESC DEPT;


--사원테이블 외래키 추가
ALTER TABLE EMP
ADD CONSTRAINT EMP_DEPTNO_FK
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT'
OR TABLE_NAME = 'EMP';

--1. 포지션이 골키퍼(GK)인 선수들에 대한 데이터만을 백넘버 순으로 출력하시오
--선수명     백넘버     연고지(REGION_NAME)     팀명
SELECT *
FROM PLAYER;

SELECT *
FROM TEAM;

DESC PLAYER;

SELECT PLAYER.PLAYER_NAME 선수명, PLAYER.BACK_NO 백넘버, TEAM.REGION_NAME "연고지(REGION_NAME)"
    , TEAM.TEAM_NAME 팀명
FROM PLAYER,TEAM
WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID
AND PLAYER.POSITION = 'GK'
ORDER BY 백넘버;

--테이블도 별칭을 이용하여 축약하여 할수 있다.
SELECT P.PLAYER_NAME 선수명, P.BACK_NO 백넘버, T.REGION_NAME "연고지(REGION_NAME)"
    , T.TEAM_NAME 팀명
FROM PLAYER P,TEAM T
WHERE P.TEAM_ID = T.TEAM_ID
AND P.POSITION = 'GK'
ORDER BY P.BACK_NO;

-- 2.팀 테이블과 구장 테이블의 관계를 이용해서 구하시오
--   소속팀이 가지고 있는 전용구장의 정보를 팀의 정보와 함게 출력하시오
--   연고지가 빠른 순으로 정렬
--   연고지   팀명         STADIUM_ID      STADIUM_NAME   좌석수
--EX:   전북      현대모터스      D03            전주월드컵경기장   28,000                              
--   경남                                       27,085

SELECT *
FROM TEAM;

SELECT *
FROM STADIUM;

SELECT TEAM.REGION_NAME 연고지, TEAM.TEAM_NAME 팀명, STADIUM.STADIUM_ID
    , STADIUM.STADIUM_NAME, TO_CHAR(STADIUM.SEAT_COUNT, '99,999') 좌석수
FROM TEAM,STADIUM
WHERE TEAM.STADIUM_ID = STADIUM.STADIUM_ID
ORDER BY REGION_NAME;

--마찬가지로 바꿀수 있다.
SELECT T.REGION_NAME 연고지, T.TEAM_NAME 팀명, S.STADIUM_ID
    , S.STADIUM_NAME, TO_CHAR(S.SEAT_COUNT, '99,999') 좌석수
FROM TEAM T,STADIUM S
WHERE T.STADIUM_ID = S.STADIUM_ID
ORDER BY T.REGION_NAME;


--CROSS JOIN(전체 조인)
SELECT *
FROM EMP E, DEPT D;

--EQUI JOIN(동등 조인)
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--전체 조인 수 확인
SELECT COUNT(*)
FROM EMP E, DEPT D;

-- 동등 조인 수 확인
SELECT COUNT(*)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--NON-EQUI JOIN(비동등 조인)
SELECT *
FROM SALGRADE;

SELECT ENAME, SAL, GRADE
FROM EMP E, SALGRADE S
WHERE SAL >= LOSAL
AND SAL <= HISAL;

--SELF JOIN
SELECT *
FROM EMP;

SELECT EMPNO 내사원번호, ENAME, MGR 상사사원번호
FROM EMP;

SELECT *
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO;

SELECT EMPLOYEE.EMPNO 내사원번호, EMPLOYEE.ENAME, EMPLOYEE.MGR
    , MANAGER.ENAME 상사이름, MANAGER.EMPNO 상사사원번호
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO;


--1.'SMITH의 상사는  ???입니다' 라고 출력되도록 하시오
--정렬은 사원이름순으로 한다.
--컬럼명은 사원과 상사의 정보

--사원명     상사명     사원과 상사의 정보
--  
SELECT EMPLOYEE.ENAME 사원명, MANAGER.ENAME 상사명
    , EMPLOYEE.ENAME  || '의 상사는 ' || MANAGER.ENAME || '입니다' "사원과 상사의 정보", MANAGER.JOB
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO
ORDER BY EMPLOYEE.ENAME;

--2.매니저가 KING인 사원들의 이름과 직급을 출력하시오
--WORK_NAME   WORK_JOB   상사명

SELECT EMPLOYEE.ENAME WORK_NAME,EMPLOYEE.JOB WORK_JOB, MANAGER.ENAME 상사명
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO
AND MANAGER.ENAME = 'KING';

   
--3.SMITH와 동일한 근무지에서 근무하는 사원의 이름을 출력하시오
--SMITH사원명   동료사원명    

SELECT *
FROM EMP
WHERE DEPTNO = 20;

SELECT 'SMITH' "SMITH사원명", MANAGER.ENAME 동료사원명
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.DEPTNO = MANAGER.DEPTNO
AND EMPLOYEE.ENAME = 'SMITH'
AND MANAGER.ENAME != 'SMITH';



SELECT *
FROM EMP;

SELECT*
FROM EMP
WHERE ENAME LIKE '%';

--ESCAPE 로 나갈수 있는 문자를 설정할수 있다.
SELECT*
FROM EMP
WHERE ENAME LIKE '%@%' ESCAPE '@';


ROLLBACK;

--사원과 부서의 정보를 모두 출력하라
select *
from emp e, dept d
where e.deptno = d.deptno;

--사원과 부서의 정보를 모두 출력하라
--사원의 정보를 표현하는데 부서의 정보도 모두 출력하시오
select *
from emp e, dept d
where e.deptno(+) = d.deptno;
--(+)가 없는쪽에 정보가 완벽하니, (+)가 붙은쪽에 NULL을 추가해서 출력해라

SELECT *
FROM EMP;

SELECT *
FROM DEPT;


--1.상사와 사원이 존재한다.
--상사가 있는 사원들과 상사가 존재하지 않는 사원들의 정보를 모두 출력하시오

--일반 사원       직장상사                        직장상사의 상사       
--SMITH          JONES                          1234
--???            NULL 은 상사없음으로 출력하시오    NULL은  0으로 출력

SELECT *
FROM EMP;

SELECT E.ENAME 일반사원, NVL(M.ENAME, '상사없음') 직장상사, NVL(M.MGR, 0) "직장상사의 상사번호"
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO(+);


--2.경기장에 등록된 운동장 중에 홈팀이 없는 경기장도 출력하시오
--홈팀ID로 오름차순하시오
--경기장명   경기장ID      좌석수   HOMETEAM_ID      팀명
SELECT *
FROM STADIUM;

SELECT *
FROM TEAM;

SELECT S.STADIUM_NAME 경기장명, S.STADIUM_ID "경기장ID", S.SEAT_COUNT 좌석수
    ,S.HOMETEAM_ID, T.TEAM_NAME 팀명
FROM STADIUM S, TEAM T 
WHERE S.HOMETEAM_ID = T.TEAM_ID(+)
ORDER BY S.HOMETEAM_ID;


