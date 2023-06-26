package oracle_db_sql;

public class GroupBy_Having_12 {

	/*
	 집계 함수(Aggregate Function)
	 
	 여러 행들의 그룹이 모여서 그룹당 단 하나의 결과를 돌려주는
	 다중행 함수 중 집계 함수의 특징
	 
	 - 여러 행들의 그룹이 모여서 그룹당 단 하나의 결과를 돌려주는 함수
	 - group by 절은 행들을 소그룹화 한다.
	 - select, having 등에 사용할 수 있다.
	 
	 @합계를 구하는 sum()
	 
	 @평균을 구하는 avg()
	 
	 @최대값 구하는 max()
	 
	 @최소값 구하는 min()
	 
	 etc -> 기타등등이라는 영어 표현이다.
	 
	 GROUP BY 절
	 어떤 컬럼 값을 기준으로 그룹함수를 적용해 줄지 기술해 주어야 할 경우에는
	 SELECT 문에 GROUP BY 절을 추가하되
	 GROUP BY 절 뒤에 해당 컬럼을 기술하면 기준이 된다.
	 
	 WHERE 절을 통해 조건에 맞는 데이터를 조회했지만 테이블에
	 1차적으로 존재하는 데이터 이외의 정보를 가공할 정보도 필요하다.
	 GROUP BY절은 SQL문에서 FROM 절과 WHERE 절 뒤에 오며
	 데이터들을 작은 그룹으로 분류하여 소그룹에 대한
	 항목별로 통계 정보를 얻을 때 추가로 사용된다.
	 
	 SELECT
	 FROM
	 WHERE
	 GROUP BY	컬럼이나 표현식
	 HAVING절	그룹조건식
	 ORDER BY
	 
	 GROUP BY절과 HAVING절의 특징
	 - GROUP BY 절을 통해 소그룹 기준을 정한 후, SELECT 절에 집계 함수를 사용한다.
	 - 집계 함수의 통계 정보는 NULL 값을 가진 행을 제외하고 수행한다.
	 - GROUP BY 절에서는 SELECT 절과는 달리 ALIAS 명을 사용할 수 없다.
	 - WHERE 절은 전체 데이터를 GROUP으로 나누기 전에 행들을 미리 제거시킨다.
	 - HAVING 절은 GROUP BY 절의 기준 항목이나 소그룹의 집계 함수를
	 이용할 조건을 표시할 수 있다.
	 - GROUP BY 절에 의한 소그룹별로 만들어진 집계 데이터 중, HAVING 절에서
	 제한 조건을 두어 조건을 만족하는 내용만 출력한다.
	 - HAVING 절은 일반적으로 GROUP BY 절 뒤에 위치한다.
	 
	 **로우 개수를 구하는 함수 COUNT()
	 
	 테이블에서 조건을 만족하는 행의 개수를 반환하는 함수
	 
	 특정 컬럼을 기술하면 해당 컬럼값을 가지고 있는 로우의 개수를 계산하여
	 리턴한다.
	 
	 SELECT 문장 실행 순서					수행순서
	 SELECT			컬럼명	[ALIAS] 	5
	 FROM			테이블명				1
	 WHERE			조건식				2
	 GROUP BY		컬럼이나 표현식			3
	 HAVING			그룹조건식				4
	 ORDER BY		컬럼이나 표현식			6
	 
	 @ROWNUM??
	 
	 ORACLE의 ROWNUM은 컬럼과 비슷한 성격의 Pseudo Column으로써
	 sql 처리 결과 집합의 각 행에 대해 임시로 부여되는 일련번호이며,
	 테이블이나 집합에서 원하는 만큼의 행만 가져오고 싶을 떄
	 WHERE 절에서 행의 개수를 제한하는 목적으로 사용한다.
	 
	 */
}
