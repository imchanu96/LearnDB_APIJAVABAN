package oracle_db_sql;

public class ConstraintTest_17 {

	/*
	 1.dept테이블의 구조를 파악해서
	 loc를 제외한 모든 컬럼에 not null을 적용하시오
	 
	 not null적용 후
	 입력문을 통해 not null 메시지가 뜨는 경우와
	 입력이 잘 되는 경우 2가지를 증명하시오
	 
	 제약조건을 자신이 만든 테이블에 적용되었는지 확인하시오

	-----------------------------------------------
		
	 2.부서테이블에서 LOC컬럼에만
	UNIQUE와 널 값을 허용하지 않는 제약조건을 적용하고
	수행이 되는 경우와 수행이 안 되는 경우를 작성하고
	제약조건이 적용되었는지 확인하시오
	 
	 기본키를 잘 적용하시오

	-----------------------------------------------
	
	3.DEPT테이블에서 DEPTNO컬럼에 기본키를 적용하시오
	나머지 컬럼들이 기본적으로 존재하고
	마지막에 컬럼명을 부서의 일련번호라는 컬럼을 만들고
	제약조건은 유니크 낫 널을 적용한다.

	입력이 가능한 경우와 불가능한 경우의 데이터를 입력하는데
	기본키와 유니크 낫 널의 차이를 살펴보시오

	-----------------------------------------------

	4.DEPT 테이블에
	DEPTNO에 기본키
	부서명에 NOT NULL제약조건명을 명시하여 적용하시오
	 
	 부서 테이블에서 새로 만들어지는 부서 중 입력하지 않으면
	무조건 서울이라는 값이 입력된다.
	LOC
	부서번호는 3자리의 숫자값이 입력되지 않으면 무조건 오류가 발생한다.
	1 오류 012오류  100 성공  999 성공
	
	-----------------------------------------------
	
	5. 사원 테이블과 부서 테이블을 활용하시오
	
	부서 테이블은 부모 테이블이다
	사원 테이블은 자식 테이블이다
	
	부서에는
	DEPTNO 기본키
	
	사원에는 
	EMPNO 기본키
	DEPTNO 외래키로 지정한다.
	
	부서정보를 3개 정도 입력한다.
	
	사원에는 각 부서별로 1명씩
	존재하고
	첫번째 부서에만 2명만 존재하도록 하시오
	
	제약조건 확인
	명명규칙
	외래키 제약조건 오류 증명하시오
	
	
	 */
	
}
