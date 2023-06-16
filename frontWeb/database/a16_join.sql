/*
 # 조인
 1. 하나의 sql 명령문에 의해 여러 테이블에 저장된 데이터를 한 번에 조회할 수 있는 기능을 말한다
 2. 관계형 데이터베이스 분야의 표준으로 자리잡고 있다.
 3. 두 개 이상의 테이블을 결합한다는 의미이다.
 4. 단계별 학습 내용
 	1) 기본 조인 구문 형식 이해 및 활용
 	2) 여러가지 조인 구문 형식 활용
 	3) subquery, inline view를 통한 조인 구문 처리
 		그룹함수 처리 후, 조인 처리 등
 	4) 여러가지 복합 형식의 조인 구문 처리
 # 기본 조인 구문 형식
 1. 테이블과 테이블의 연관관계를 아래와 같이 설정한다
 	select 선택할 컬럼
 	from 테이블1 별칭1, 테이블2 별칭2
 	where 별칭1.공통컬럼 = 별칭2.공통컬럼
 2. 위 기본 조인 구문 형식은 두 개의 테이블의 공통 컬럼을 기준으로 inner 조인하는 것을 말한다.
 */
SELECT e.DEPTNO, d.dname 
FROM emp e, dept d
WHERE e.DEPTNO = d.Deptno;

SELECT e.*, d.* 
FROM emp e, dept d
WHERE e.DEPTNO = d.Deptno;
-- e.*: emp 테이블의 alias명 e를 테이블명으로 하위에 있는 컬럼을 접근할 때 사용하고
-- d.*: dept테이블의 alias명 d를 테이블명으로 하위에 있는 컬럼을 접근할 때 사용한다.
-- 일반적으로, 위 e.컬럼명, d.컬럼명을 두 개의 테이블에서 공통되는 컬러을 구분할 때 사용한다.
-- 공통된 컬럼이 아니면 생략해도 무방하다
SELECT empno, ename, e.deptno, dname, LOC
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO;
-- 두 개의 공통 컬럼은 구분해주어야 한다
-- 두 개의 테이블은 조인을 통해 연관관계에 있는 컬럼의 내용을 출력할 수 있다.
-- ex) 조인 구문을 이용해 부서명, 사원명, 부서위치, 급여를 출력하세요
SELECT dname, ename, loc, sal
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO;

-- ex1) 조인을 이용하여 부서위치와 사원명을 검색하세요
SELECT ename "사원명", dname "부서명", LOC "부서위치"
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO;

-- 조인을 하면, 이 기준을 지금까지 했던 조건, group, 함수처리 내용을 연관하여 처리할 수 있다.
-- 부서 위치를 기준으로 최고급여 처리
SELECT  dname, max(sal) FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
GROUP BY dname;

-- 급여가 3000이상인 부서명, 급여를 출력하세요
SELECT dname, sal FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND sal >= 3000;

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
-- ex)
SELECT first_name "사원명", salary "급여", department_name "부서명"
FROM EMPLOYEES e , DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.SALARY  >= 5000
AND d.DEPARTMENT_NAME ='Marketing' OR d.DEPARTMENT_NAME ='Purchasing';