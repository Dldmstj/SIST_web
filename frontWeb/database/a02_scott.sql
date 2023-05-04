select * from emp;

select empno from emp;  -- ctrl+enter 

select empno, ename from emp;
        -- ex) empno, job, mgr, depno를 1,2,3,4 선택해서 조회
select empno, job, mgr, deptno from emp;

select deptno, empno, ename from emp;       -- 원하는 순서대로 조회

select ename, sal
from emp
where sal >= 3000;

select * from emp;

-- ex) sal 컬럼이 2000 미만인 사원정보 검색하기
select * from emp where sal <2000;

-- ex) sal가 2000이상 4000미만 사원정보 검색하기
select * from emp where sal >= 2000 and sal <4000;

-- ex) empno 기준으로 7500미만 이거나 7800 이상인 사원의 empno,ename, sal 출력하기
select empno, ename, sal from emp where empno <7500 or empno>=7800;