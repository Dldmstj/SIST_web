select * from emp;

select empno from emp;  -- ctrl+enter 

select empno, ename from emp;
        -- ex) empno, job, mgr, depno�� 1,2,3,4 �����ؼ� ��ȸ
select empno, job, mgr, deptno from emp;

select deptno, empno, ename from emp;       -- ���ϴ� ������� ��ȸ

select ename, sal
from emp
where sal >= 3000;

select * from emp;

-- ex) sal �÷��� 2000 �̸��� ������� �˻��ϱ�
select * from emp where sal <2000;

-- ex) sal�� 2000�̻� 4000�̸� ������� �˻��ϱ�
select * from emp where sal >= 2000 and sal <4000;

-- ex) empno �������� 7500�̸� �̰ų� 7800 �̻��� ����� empno,ename, sal ����ϱ�
select empno, ename, sal from emp where empno <7500 or empno>=7800;