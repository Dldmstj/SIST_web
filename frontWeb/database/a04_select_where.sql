/*
 # where 조건문 처리
 1. 행단위 데이터로 검색할 때 주로 사용된다.
 2. where 조건절에는 컬럼명을 기준으로 여러가지 연산자를 이용하여 조건처리를 한다.
 	1) 형식
 		where 컬럼명 연산자형식 비교할 데이터
 		ex) where ename like '%홍%';
 		ex) where sal >= 3000
 3. where절에서 사용하는 데이터타입은 문자,숫자,날짜 타입을 사용할 수 있다.
 4. where절에는 
 	1) 비교 연산자
 		>,<,>=,<=, =, !=, ==
 	2) 논리 연산자
 		and, or, not
 	3) 그 외, 키워드 비교 연산자
 		컬럼명 between 데이터1 and 데이터2
 		컬럼명 in(데이터1, 데이터2,...)	
 */
-- 숫자형 데이터 비교
SELECT * FROM EMP
WHERE EMPNO = 7369;

-- 문자형 데이터 비교
SELECT * FROM EMP
WHERE job = 'SALESMAN';

-- ex) mgr이 7839인 데이터와, deptno가 10, job이 clerk인 데이터를 각각 출력하세요
SELECT * FROM EMP
WHERE MGR = 7839;

SELECT * FROM EMP
WHERE deptno = 10;

SELECT * FROM EMP
WHERE JOB = 'CLERK';