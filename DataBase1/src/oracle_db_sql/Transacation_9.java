package oracle_db_sql;

public class Transacation_9 {
/*
	TCL(Transaction Control Language)
	
	@트랜잭션 개요
	데이터베이스의 노리적 연산단위다.
	
	트랜잭션이란 밀접히 관련되어 분리될 수 없는 한 개 이상의 
	데이터베이스 조작을 가리킨다
	
	하나의 트랜잭션에는 하나 이상의 sql 문장이 포함된다.
	트랜잭션은 분할할 수 없는 최소의 단위이다.
	그렇기 때문에 전부 적용하거나 전부 취소한다.
	
	@트랜잭션의 특성
	특성				설명
		원자성		트랜잭선에서 정의된 연산들은 모두 성공적으로 실행되던지 아니
	(atomicity)		전혀 실행되지 않은 상태로 남아 있아야한다.(all or nothing)
	
		일관성		트랜잭션이 실행되기 전의 데이터베이스 내용이 잘못되어 있지 않다면
	(consistency)	트랜잭션이 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안 된다.
	
		고립성		트랜잭션이 실행되는 도중에 다른 트랜잭션의 영향을 받아 잘못된 결과를
	(isolation)		만들어서는 안 된다.
	
		지속성		트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의
	(durability)	내용은 영구적으로 저장된다.
	
	COMMIT
   -입력한 자료나 수정한 자료에 대해서 또는 삭제한 자료에 대해서 전혀 문제가
   없다고 판단되었을 경우 commit 명령어를 통해 트랜잭션을 완료할 수 있다
   -현재 사용자는 select 문장으로 자신이 수행한 결과를 확인 가능하다
   -다른 사용자는 현재 사용자가 수행한 명령의 결과를 볼 수 없다
   
   
    ROLLBACK
    
   	원격접속
   
   //문제----------------------------------------------------
   자신의 테이블에 대해서만 조작하시오
   총 4명의 자신의 팀원의 정보를 입력하시오
   
   update
   1팀  
   1.자신의 테이블에 한 사람을 수정한다(첫번째 돈을 0으로)
   3.2팀의 테이블에 2번째 친구의 정보를 수정한다
   
   2팀 
   2.자신의 테이블에 한 사람을 삭제한다(2번째 사람)
   4.1팀의 테이블에 한 사람을 새로 추가한다(????)
   
   EMP사원들에는
   KING CEO    5000
	----------------------------------------------------
	
	COMMIT 이후의 데이터 상태는 다음과 같다.
	- 데이터에 대한 변경 사항이 데이터베이스에 반영된다.
	- 이전 데이터는 영원히 잃어버리게 된다.
	- 모든 사용자는 결과를 볼 수 있다.
	- 관련된 행에 대한 잠금이 풀리고, 다른 사용자들이 행을 조작할 수 있다.
	
	ROLLBACK
	테이블 내 입력한 데이터나, 수정한 데이터, 삭제한 데이터에 대하여
	COMMIT 이전에 변경 사항을 취소할 수 있는데
	데이터베이스에서는 롤백(ROLLBACK) 기능을 사용한다
	롤백은 데이터 변경 사항이 취소되어 데이터의 이전 상태로 복구되어,
	관련된 행에 대한 잠금이 풀리고 다른 사용자들이 데이터 변경을 할 수 있게 한다.
	
	COMMIT과 ROLLBACK을 사용하면 얻는 효과
	- 데이터 무결성 보장
	- 영구적인 변경을 하기 전에 데이터의 변경 사항 확인 가능
	- 논리적으로 연관된 작업을 그룹핑하여 처리 가능
	
	@트랜잭션은 기본적으로 3가지 방식으로 이루어진다.
	
	1)AUTO COMMIT
	DDL이 수행되면 자동적으로 마지막에 COMMIT를 수행한다.
	COMMIT를 수행하고 오류가 발생하면 자동으로 ROLLBACK을 수행한다.
	일반적으로 데이터베이스가 성공적으로 종료되면 자동으로 COMMIT된다.
	일반적으로 데이터베이스가 잘못 종료되면 자동으로 ROLLBACK된다.
	
	2)암시적 트랜잭션
	ORACLE은 이와 같은 방식으로 처리된다.
	트랜잭션의 시작은 DBMS가 처리하고 트랜잭션 끝은 사용자가 명시적으로 
	COMMIT, ROLLBACK으로 처리한다.
	
	3)명시적 트랜잭션
	AUTO COMMIT 형태로 SQL SERVER에서 이와 같은 방식으로 처리된다.
*/
}
