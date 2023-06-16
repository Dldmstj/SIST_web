/*
# self join
1. 테이블 컬럼 안에 내부적으로 연관관계가 있는 컬럼간의 조인을 말한다.
2. 하나의 테이블 내에 있는 컬럼끼리 연결하는 조인이 필요한 경우에 사용된다.
	조인 대상 테이블이 자신 하나라는 것 외에는 equi join이 동일하다
3. where 절을 사용하는 self join
	하나의 테이블에서 두 개의 컬럼을 연결하여 equi join from 절에서 하나의 테이블에 테에블의 별명을 따로 지정해서 처리
4. 형식
	select a.*, b.* from 테이블 a, 테이블 b
	where a.컬럼 = b.컬럼
5. 사용예
	emp테이블에서 empno와 mgr은 연관관계의 계층형 join관계로 내부 join을 유지하고 있다.
	empno: 모든 사원 고유 번호
	mgr: 해당 사원의 관리자 번호
	
	SMITH의 관리자 번호는 7902이고, 이 관리자번호로 하는 이름은 fORD
	
 */
SELECT * FROM emp;
SELECT empno, ename, mgr FROM emp WHERE empno=7902;

SELECT e.empno 사원번호, e.ename 사원명, e.mgr 관리자번호,
		m.ename 관리자이름
FROM emp e, emp m
WHERE e.mgr = m.EMPNO; 		-- 하위 테이블의 mgr과 상위 테이블의 empno가 연관관계로 SELF JOIN

SELECT '사원명'||e.ename||'의 관리자는 '||m.ename||'입니다.' show
FROM emp e, emp m
WHERE e.mgr = m.empno;


--1. Group 함수 연습 예제:
--   1.1 직업별로 평균 급여를 계산하시오.
SELECT job, AVG(sal) "평균급여" FROM emp GROUP BY job;

--   1.2 각 부서별로 가장 높은 급여를 받는 사람을 찾으시오.
SELECT e.* FROM emp e,
(
	SELECT deptno, max(sal) sal FROM emp GROUP BY deptno
) ms
WHERE e.DEPTNO = ms.deptno
AND e.sal = ms.sal;

--2. Subquery 연습 예제:
--   2.1 급여가 평균 급여보다 많이 받는 사원들의 이름과 급여를 찾으시오.
SELECT ename, sal FROM emp WHERE sal > (
	SELECT avg(sal) FROM emp
);

--   2.2 Smith의 급여보다 많은 급여를 받는 사원들의 이름과 급여를 찾으시오.
SELECT ename, sal FROM emp WHERE sal > (
	SELECT sal FROM emp WHERE ename='SMITH'
);

--3. Outer Join 연습 예제:
--   3.1 사원들의 이름과 부서 이름을 가져오시오. (부서에 할당되지 않은 사원도 포함)
SELECT nvl(ename,'사원없음')"사원명", dname "부서이름"
FROM emp e, dept d
WHERE e.DEPTNO(+) = d.DEPTNO;

SELECT * FROM emp;

--   3.2 각 부서별로 최대 급여를 받는 사원의 이름을 가져오시오. (부서에 할당되지 않은 사원도 포함)
SELECT e.ename, ms.deptno, ms.sal "최대 급여" FROM emp e,
(
	SELECT deptno, max(sal) sal
	FROM emp
	GROUP BY deptno
	ORDER BY DEPTNO
) ms
WHERE e.DEPTNO = ms.deptno
AND e.sal (+)= ms.sal;

--4. Group 함수와 Subquery를 조합한 연습 예제:
--   4.1 각 직업별로 최대 급여를 받는 사원의 이름을 가져오시오.
SELECT e.ename, ms.job, ms.sal "최대 급여" FROM emp e,
(
	SELECT job, max(sal) sal FROM emp GROUP BY job
) ms
WHERE e.job = ms.job
AND e.sal = ms.sal;

--   4.2 각 부서별로 최소 급여를 받는 사원의 이름을 가져오시오.
SELECT e.ename, ms.deptno, ms.sal "최소 급여" FROM emp e,
(
	SELECT deptno, min(sal) sal FROM emp GROUP BY deptno ORDER BY DEPTNO
) ms
WHERE e.DEPTNO = ms.deptno
AND e.sal = ms.sal;
