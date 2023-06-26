DROP TABLE STUDENT;

CREATE TABLE student(
    no number(3),
    name varchar2(10),
    scoreNum number(5,2) 
);

desc student;

--DML(Data Manipulation Language)
--데이블에 원하는 자료들을 입력, 수정, 삭제, 조회하는 명령어
--
--INSERT : 입력
--UPDATE : 수정
--DELETE : 삭제
--SELECT : 조회

--INSERT 표현식
--1.INSERT INRO 테이블명 (COLUMN_LIST)
--VALUES (컬럼명에 넣을 밸류값들);
--
--2.INSERT INRO 테이블명 괄호를 제외하면 순서대로 전체에 다 넣어주어야 한다
--VALUES (전체 컬럼명에 넣을 밸류값들);



DESC STUDENT;

INSERT INTO STUDENT
(NO, NAME)
VALUES(1, '특이점');

INSERT INTO STUDENT 
(NO, scorenum)
VALUES(1,132);

INSERT INTO STUDENT
VALUES(999, '특이점A', 312.09);
--한글은 한 글자에 3바이트이다.

INSERT INTO STUDENT
VALUES(1000, '특이점A', 312.09);

INSERT INTO STUDENT
VALUES(100, '특이점A', 312.099);

SELECT *
FROM STUDENT;

SELECT *
FROM AAA;


--@ALTER TABLE
--테이블 구조에서 컬럼을 추가/삭제 OR 제약조건을 추가 삭제하는 작업을 함

--테이블에 새 컬럼을 추가하시오
--단, 표현식으로 (EXPRESSION)
--ADD COLUMN
--기존 테이블에 필요한 컬럼을 추가하는 명령

--ALTER TABLE 테이블명
--ADD 추가할 컬럼명 데이터 타입;

ALTER TABLE STUDENT
ADD (AGE NUMBER);
--NUMBER의 자리를 지정 해주지 않으면 38자릿수까지 묵시적으로 생성한다.

ALTER TABLE STUDENT
ADD (AGE2 NUMBER(10));

DESC STUDENT;

SELECT *
FROM STUDENT;



나.MODIFY COLUMN
기존 테이블에 있는 컬럼을 수정하는 명령

--표현식
ALTER TABLE 테이블명
MODIFY (컬럼명1 데이터 유형, 컬럼명2 데이터 유형, ,,,);



ALTER TABLE STUDENT
MODIFY(NAME VARCHAR2(30));

DESC STUDENT;

SELECT *
FROM STUDENT;

INSERT INTO STUDENT
VALUES (111, '일이삼사오육칠팔구십', 123.12, 1, 1234567891);

--NAME이 30BYTE까지만 입력 가능이지만 입력하려는 값이 33BYTE이기에 오류
INSERT INTO STUDENT
VALUES (111, '일이삼사오육칠팔구십일', 123.12, 1, 1234567891);

SELECT *
FROM STUDENT;


--**컬럼을 변경할 때 몇 가지 사항을 고려해서 변경해야 한다.
--- 해당 컬럼의 크기를 늘릴 수는 있지만 줄이지는 못한다.
--  이는 기존의 데이터가 훼손될 수 있기 때문이다.
--- 해당 컬럼이 NULL값만 가지고 있거나 테이블에 아무 행도 없으면 컬럼의
--  폭을 줄일 수 있다.
--- 해당 컬럼이 NULL값만을 가지고 있으면 데이터 유형을 변경할 수 있다.
--- 해당 컬럼의 DEFAULT 값을 바꾸면 변경 작업 이후 발생하는 행 삽입에만 영향을 미치게 된다.
--- 해당 컬럼에 NULL값이 없을 경우에만 NOT NULL 제약조건을 추가할 수 있다.

DESC STUDENT;

ALTER TABLE STUDENT
MODIFY(NAME VARCHAR2(8));

SELECT * 
FROM STUDENT;

ALTER TABLE STUDENT
ADD (ALIAS_NAME VARCHAR2(100));

DESC STUDENT;

SELECT *
FROM STUDENT;

ALTER TABLE STUDENT
MODIFY(ALIAS_NAME VARCHAR2(1));


다. DROP COLUMN
기존 테이블에 있는 컬럼을 수정하는 명령

표현식
DROP TABLE 테이블명
DROP COLUMN 삭제할 컬럼명;

DESC STUDENT;

ALTER TABLE STUDENT
DROP COLUMN AGE2;

DESC STUDENT;

ALTER TABLE STUDENT
DROP COLUMN ALIAS_NAME;

DESC STUDENT;


--2023-05-25 첫번째 문제
CREATE TABLE EMPLOYEE(
    ename VARCHAR2(30),
    jab VARCHAR2 (27),
    sal NUMBER
);

DESC EMPLOYEE;

ALTER TABLE EMPLOYEE
ADD (comm NUMBER(4));

DESC EMPLOYEE;

INSERT INTO EMPLOYEE
(ENAME, JAB, SAL, COMM)
VALUES ('임찬우', '백엔드', '3000', 1111);

DESC EMPLOYEE;

SELECT *
FROM EMPLOYEE;

INSERT INTO EMPLOYEE
(ENAME, SAL)
VALUES ('조남용', 4000);

SELECT * 
FROM EMPLOYEE;

ALTER TABLE EMPLOYEE
DROP COLUMN SAL;

SELECT *
FROM EMPLOYEE;

DROP TABLE EMPLOYEE;
-- 문제 끝

@rename table
테이블의 이름을 변경할 수 있다.

expr(표현식)
rename 변경전 테이블명 to 변경후 테이블명;

desc aaa;

rename aaa to bbb;

desc bbb;

--수정 ?    ->    삭제 -> 생성

테이블을 삭제하는 DROP TABLE

표현식
DROP TABLE 테이블명;

DROP TABLE BBB;