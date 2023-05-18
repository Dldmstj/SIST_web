SELECT * FROM emp;
-- 사원번호empno, 이름ename, 직책job, 관리자번호mgr, 입사일hiredate, 급여sal, 보너스comm, 부서번호depno

-- ex) sal 3000이상 or 2000미만 이고, deptno가 30이 아닌 데이터
SELECT * FROM EMP
WHERE (SAL >=3000 OR SAL <2000) AND DEPTNO != 30;

-- ex) ename, mgr 이 null인 경우 
SELECT ENAME, MGR FROM EMP
WHERE MGR IS NULL;

-- ex) null이 아닌 경우만 중복되지 않는 관리자번호를 출력
SELECT DISTINCT mgr FROM EMP WHERE mgr IS NOT null;

-- ex) sal 2000이상 and comm은 not null인 경우 출력
SELECT * FROM EMP
WHERE sal >= 2000 AND comm IS NOT NULL;

-- ex) job이 saleman or deptno가 20인 경우 사원명, 직책, 부서번호 출력
SELECT ename, job, deptno FROM EMP
WHERE job ='SALEMAN' OR deptno =20;