/*
 #
 **/
SELECT * FROM emp e, dept d;
-- equi join(inner join) 12(emp)*4(dept) = 48건이 조인이 된다.
-- 범위로 join하는 경우
SELECT ename, sal FROM emp;
-- 등급, 최소급여, 최대급여 : 해당 등급에 최소 최대 범위를 설정
SELECT * FROM SALGRADE;

SELECT ename, sal, grade FROM emp e, SALGRADE s
WHERE sal BETWEEN LOsAL AND hisal;

-- 4등급에 해당하는 사원 정보를 출력하세요
SELECT grade, e.*
FROM emp e, SALGRADE s
WHERE sal BETWEEN  LOsal AND hisal AND grade=4;

SELECT ename, sal FROM emp WHERE ename='SMITH';
-- ex1) smith의 급여와 급여등급을 출력하세요
SELECT ename, sal, grade
FROM emp e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND e.ename='SMITH';

-- ex2) salesman의 급여와 등급을 출력하세요
SELECT job, sal, grade
FROM emp e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND e.job = 'SALESMAN';

/*
 # subquery, inline view를 통한 조인구문 처리
 1. 조인하기 전, 데이터를 로딩해서 가져오는 형식을 subquery라고 한다
 	1) subquery에서 컬럼에 대한 비교 연산식으로 subquery를 가져오는 형태도 있고,
 		select *
 		from 테이블
 		where 컬럼 = (sql결과)
 	2) sql 실행 결과를 테이블 형태로 선언(inline view)하여 처리하는 형태가 있다.
 		select *
 		from (
 			sql결과
 		)
 		where ...
 **/

-- 사원 정보 중 최고 급여자의 사원 정보를 출력하세요
SELECT max(sal) FROM emp;
SELECT * FROM emp WHERE sal=(
	SELECT max(sal) FROM emp
);

-- ex1) 사원번호가 가장 낮은 사원의 사원정보 출력
SELECT * FROM emp WHERE empno=(
	SELECT min(empno) FROM emp
);

-- ex2) 가장 최근에 입사한 사원의 사원정보 출력
SELECT * FROM emp WHERE hiredate=(
	SELECT max(HIREDATE) FROM emp
);

-- 부서별 최고 급여자에 대한 정보 출력
SELECT deptno, max(sal) FROM emp GROUP BY deptno;

SELECT e.* FROM emp e,
(
	SELECT deptno, max(sal) sal  FROM emp GROUP BY deptno
) me
WHERE e.deptno = me.deptno
AND e.sal = me.sal ORDER BY e.DEPTNO;

-- ex) job별로 가장 최근에 입사한 사원정보
SELECT job, max(hiredate) FROM emp GROUP BY job;

SELECT * FROM emp e,
(
SELECT job, max(hiredate) hiredate FROM emp GROUP BY job
) mh
where e.job = mh.job
AND e.hiredate = mh.hiredate;