--파일명: 임찬우_studentDML.sql

DESC STUDENT;

SELECT NO 번호, ID 아이디, NAME 이름, AGE 나이, TO_CHAR(JOIN_DATE, 'YYYYMMDD') 가입일
FROM STUDENT;


--데이터 삽입
INSERT INTO STUDENT
VALUES(1, 'JGR', '빙그레', 26, TO_DATE(20141018));

INSERT INTO STUDENT
VALUES(2, 'AYL', '안영이', 25, TO_DATE(20141024));

INSERT INTO STUDENT
VALUES(3, 'OSS', '오상식', 42, TO_DATE(20091220));

SELECT NO 번호, ID 아이디, NAME 이름, AGE 나이, TO_CHAR(JOIN_DATE, 'YYYYMMDD') 가입일
FROM STUDENT;


--데이터 수정
UPDATE STUDENT SET NAME = '장그래'
WHERE NO = 1;

SELECT NO 번호, ID 아이디, NAME 이름, AGE 나이, TO_CHAR(JOIN_DATE, 'YYYYMMDD') 가입일
FROM STUDENT;


--데이터 삭제
DELETE 
FROM STUDENT
WHERE ID = 'OSS';

SELECT NO 번호, ID 아이디, NAME 이름, AGE 나이, TO_CHAR(JOIN_DATE, 'YYYYMMDD') 가입일
FROM STUDENT;

--데이터 조회
SELECT NO 번호, ID 아이디, NAME 이름, AGE 나이, TO_CHAR(JOIN_DATE, 'YYYYMMDD') 가입일
FROM STUDENT;