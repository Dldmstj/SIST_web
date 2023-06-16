/*
 # 그룹함수란?
 1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화하여, 그룹별로 결과를 출력하는 함수
 	그룹함수는 통계적인 결과를 출력하는데 자주 사용한다.
 2. 기본 형식
 	select 기준 컬럼, 그룹함수(컬럼)
 	from 테이블명
 	where
 	group by 그룹컬럼
 	having 그룹함수를 적용한 결과를 조건 처리
 3. 그룹함수의 종류
 	1) count(): null을 제외한 데이터의 건수, 행의 건수
 	2) max(): null을 제외한 모든 행의 최대값
 	3) min(): null을 제외한 모든 행의 최소값
 	4) sum(): null을 제외한 모든 행의 합
 	5) avg(): null을 제외한 모든 행의 평균값
 	6) stddev(): null을 제외한 모든 행의 표준편차
 	7) variance(): null을 제외한 모든 행의 분산값
 */
SELECT comm FROM emp;
-- emp테이블에서 comm의 전체 컬럼의 null을 제외한 데이터 건수
SELECT COUNT(comm) FROM emp;
-- emp테이블에서 comm의 최대치와 최소치 (한 컬럼 대상)
SELECT max(comm),min(comm) FROM emp;
-- 부서 별 sal을 가진 데이터 건수가 얼마일까?
-- 부서 별 sal을 가진 데이터 최대값이 얼마일까?
-- 부서 별 sal을 가진 데이터 최소값이 얼마일까?
-- 부서 별 sal을 가진 데이터 평균값이 얼마일까?
SELECT deptno, count(sal) "건수", max(sal) "최대", min(sal)"최소"
FROM emp GROUP BY deptno ORDER BY DEPTNO;
-- SELECT 그룹화할 컬럼, 함수(통계처리할 데이터)
-- from 테이블
-- group by 그룹화할 컬럼 지정
-- 정렬해야하면 order by
-- 주의: 그룹화할 컬럼은 select 하나만 지정하면 group by 하나만 지정
--		통계할 함수는 여러 개를 선언해서 확인하는 것은 상관없음

SELECT DEPTNO, sal FROM emp ORDER BY DEPTNO, sal;
SELECT sum(comm) FROM emp;

SELECT ename, job,hiredate FROM emp ORDER BY job ,HIREDATE;

SELECT min(hiredate)"가장먼저입사", min(hiredate)"가장최근입사" FROM emp;

SELECT manager_id "관리자", max(SALARY) "최고 급여" FROM EMPLOYEES
GROUP BY MANAGER_ID ORDER BY MANAGER_ID;

-- 그룹화된 데이터 중, 관리자를 기준으로 검색할 때와 그룹된 최고 급여를 기준으로 검색할 때 처리
-- 주의: where 조건문, 테이블의 데이터를 기준으로 조건 처리

-- where EMPLOYEES(테이블 안에 컬럼을 기준으로 비교/조건)
-- group by 밑에 having이라는 키워드에 조건문으로 검색 처리해야 함
SELECT  manager_id 관리자, max(salary) 최고급여 FROM EMPLOYEES
WHERE MANAGER_ID >=130
GROUP BY MANAGER_ID
HAVING max(SALARY)>=11000
ORDER BY MANAGER_ID;

SELECT deptno "부서번호", max(sal) "최고급여" FROM EMP
WHERE DEPTNO=10 OR DEPTNO=20
GROUP BY DEPTNO
HAVING max(sal)>=4000
ORDER BY DEPTNO;