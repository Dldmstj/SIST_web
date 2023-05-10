select * from emp;

select empno from emp;  -- ctrl+enter 

select empno, ename from emp;
        -- ex) empno, job, mgr, depno�� 1,2,3,4 �����ؼ� ��ȸ
select empno, job, mgr, deptno from emp;

select deptno, empno, ename from emp;       -- ���ϴ� ������� ��ȸ

select ename, sal	/* 보게 될 컬럼 지정 */
from emp
where sal >= 3000;

select * from emp;

-- ex) sal �÷��� 2000 �̸��� ������� �˻��ϱ�
select * from emp where sal <2000;

-- ex) sal�� 2000�̻� 4000�̸� ������� �˻��ϱ�
select * from emp where sal >= 2000 and sal <4000;

-- ex) empno �������� 7500�̸� �̰ų� 7800 �̻��� ����� empno,ename, sal ����ϱ�
select empno, ename, sal from emp where empno <7500 or empno>=7800;

-- = �񱳿�����(���ϵ�����)
-- '���ڿ�' : ���ڿ������� ǥ��
select * from EMP;

-- ex) sal�� 1250�� ��� ���� ���
select * from emp where sal=1250;
-- ex) job�� CLERK�� ��� ����(empno,ename,job)���
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
    -- emp���̺��� deptno�� dept���̺��� deptno�� ��������