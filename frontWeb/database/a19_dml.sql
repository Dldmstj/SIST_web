/*
 # 데이터 조작어(DML - Data Manipulation Language)
 1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 또는 삭제하기 위한 명령어
 2. 종류
 	1) insert: 입력 처리 명령어
 	2) update: 수정 처리 명령어
 	3) delete: 삭제 처리 명령어
 3. 트랜잭션
 	여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다.
 	1) 트랜잭션 명령어 종류
 		commit: 정상종료 확정
 		rollback: 비정상종료 복구
 	ex) DB클라이언트가 접속해서 변경을 했을 때, 본인 계정으로만 변경된 데이터가 보인다.
 		(다른 계정으로 접근하면 변경되지 않는 데이터 보임)
 		이 때, commit 하는 순간 현재 클라이언트 뿐만 아니라, 다른 계정으로 접속하더라도
 		데이터가 변경되는 처리가 되고, 현재 계정을 rollback을 하더라도 복구가되지 않는다.
 		
 # 데이터 입력 처리(insert)
 1. 테이블에 데이터를 입력하기 위한 명령어 insert구문을 말한다
 2. 입력방법
 	1) 단일 행 입력: 한 번에 하나의 행을 테이블에 입력하는 구문
 	2) 다중 행 입력: 서브쿼리(subquery)를 이용하여 한 번에 여러 행을 동시에 입력하는 구문
 3. 단일 행 입력
 	1) 기본 구문
 		- 모든 컬럼 입력
 			insert into 테이블명 values(데이터1, 데이터2,...)
 			ps) 데이터는 테이블이 만들어질 때, 컬럼 순서대로 데이터를 입력한다.
 			ex) insert into emp values(1000,'홍길동','사원',7800,sysdate,4000.0,300.0,10);

 		- 특정 컬럼 입력
 			insert into 테이블명(컬럼1, 컬럼2, 컬럼3,...) values(데이터1, 데이터2, 데이터3,...);
 			ex) insert into emp(empno,ename,sal) values(1002,'김길동',4000.0);
 			ps) row단위로 입력되기에 지정되지 않는 컬럼은 null로 처리된다.
 	
 4. 다중행 입력
 	1) 전체 컬럼 입력
 		insert into 테이블명
 		subquery(select 컬럼1, 컬럼2 from 테이블
 		입력할 테이블의 컬럼의 순서와 타입이 subquery의 조회되는 컬럼의 순서와 타입이 동일해야 한다
 		
 	2) 지정된 컬럼 입력
 		insert into 테이블명(컬럼1, 컬럼2,..)
 		select 컬럼1, 컬럼2
 		from 테이블명
 		
  	주의) 복사 테이블을 만들어서 처리, 기본 테이블은 변경하면 데이터를 만들거나 변경할 수 없음
 		
 */
CREATE  TABLE emp03
AS SELECT * FROM emp;

SELECT max(empno) FROM emp03;
SELECT * FROM emp03;

INSERT INTO emp03 values(1001, '신형만','계장',7902,sysdate,4000,300,10);
ROLLBACK;
COMMIT;

INSERT INTO emp03(empno, ename, job, hiredate, deptno)
values(1002, '봉미선','경리',to_DATE('2023-06-08','yyyy-mm-dd'),40);

/*
 # null 처리 컬럼
 1. 입력하지 않는 컬럼을 위와같이 생략하여 처리할 수 있지만, 명시적으로 null을 입력하는 경우도 있다
 */
INSERT INTO emp03 values(1003, '성재현','대리',null,sysdate,4000,300,null)

-- ex) dept03 테이블의 복사테이블을 만들고, ename, loc의 컬럼 크기를 변경하고
--	1) 전체 컬럼 입력
-- 	2) 지정 컬럼 입력(부서번호,부서명)
-- 	3) null 지정 컬럼 입력을 처리하세요

CREATE TABLE dept03
AS SELECT * FROM dept;\

SELECT * FROM dept03;

INSERT INTO dept03 values(50,'Marketing','Seoul');
INSERT INTO dept03(deptno,loc) values(60,'busan');
INSERT INTO dept03 values(70,NULL,'jeju');

/*
 # 다중행 입력 
 */
CREATE TABLE emp04 AS SELECT * FROM emp WHERE 1=0;
-- where 1=0: false이면 구조만 복사되고 데이터는 복사되지 않은 테이블 생성
SELECT * FROM emp04;

INSERT INTO emp04
SELECT * FROM emp WHERE sal BETWEEN 3000 AND 5000;

CREATE TABLE emp05 AS SELECT * FROM emp WHERE 1=0;
INSERT INTO emp05
SELECT * FROM emp WHERE deptno=10;
SELECT * FROM emp05;

-- ex1) 부서별 최고 급여를 입력할 수 있는 테이블 emp07을 생성하여,
		-- emp 테이블의 부서별 최고 금액을 입력하세요.
CREATE TABLE emp07 AS SELECT deptno,sal FROM emp WHERE 1=0;
INSERT INTO emp07
SELECT deptno, max(sal) FROM emp GROUP BY deptno;
SELECT * FROM emp07;

-- ex2) emp의 복사테이블 emp08을 생성하고, 부서별 최고 급여자의 정보를 입력하세요.
CREATE TABLE emp08 AS SELECT * FROM emp WHERE 1=0;
INSERT INTO emp08
SELECT * FROM emp WHERE sal=(
	SELECT max(sal) FROM emp
);
SELECT * FROM emp08;