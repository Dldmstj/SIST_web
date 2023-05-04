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

-- = 비교연산자(동일데이터)
-- '문자열' : 문자열데이터 표시
select * from EMP;

-- ex) sal이 1250인 사원 정보 출력
select * from emp where sal=1250;
-- ex) job이 CLERK인 사원 정보(empno,ename,job)출력
select empno, ename,job from emp where job ='CLERK';
/*
    DB => ArrayList<Emp>
    
    class Emp{
        private int empno;
        private String ename;
        private String job;
        private int mgr;
        private Date hiredate;
        private double sal;
        private int deptno;
    }
*/
select * from dept;

select * from emp;

select * from emp, dept where emp.deptno = dept.deptno;
    -- emp테이블의 deptno와 dept테이블의 deptno의 연관관계