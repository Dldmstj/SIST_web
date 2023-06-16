/*
# outer join
1. equi join의 조인 조건에서 양측 컬럼 값 중, 어느 하나라도
	null이면 '=' 비교 결과가 거짓이 되어 null값을 가진 행은
	출력이 되지 않는다.
2. 부서번호에 해당하는 사원이 없으면 inner join시 해당 부서정보를
	표시 못하는 경우가 발생한다.
3. 즉, 해당 부서에 사원이 없더라도, 부서정보를 표시할 필요성이 있을 때는
	equi join으로 불가능하게 된다.
4. out join 처리 형식
	1) ANSI 방식
		where 절의 조인 조건에서 outer join 연산자이 (+) 기호
		사용하면 조인 조건에 의해 null로 출력되는 테이블의 컬럼 처리
				
*/
SELECT d.*, e.*
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
ORDER BY d.deptno;

SELECT dname 부서명, nvl(ename,'사원없음') 사원명
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
ORDER BY dname;

SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;
--  ex) EMPLOYEES와 DEPARTMENTS의 DEPARTMENT_ID 기준으로
--      부서명, 사원명(first_name)을 출력하되, 사원이 없는 부서는
--      미배정이라고 표시하세요.
SELECT department_name 부서명, 
	nvl(FIRST_NAME,'미배정') 이름
FROM EMPLOYEES e, DEPARTMENTS d  
WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID 
ORDER BY department_name;

-- 부서별로 할당된 인원 현황..(반드시 outer join 설정 필요)
SELECT department_name 부서명, 
	count(FIRST_NAME) 인원수
FROM EMPLOYEES e, DEPARTMENTS d  
WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID 
GROUP BY department_name
ORDER BY department_name;

SELECT *
FROM DEPARTMENTS;

/*
#self join
1. 테이블 컬럼안에 내부적으로 연관관계가 있는 컬럼간의 조인을 말한다.
2. 하나의 테이블 내에 있는 컬럼끼리 연결하는 조인이 필요한 경우에 사용된다.
	조인 대상 테이블이 자신 하나라는 것 외는 equi join가 동일하다.
3. where 절을 사용하는 self join
	하나의 테이블에서 두 개의 컬럼을 연결하여 equi join
	from 절에서 하나의 테이블에 테이블의 별명을 따로 지정해서 처리.'
4. 형식
	select a.*, b.*
	from 테이블 a, 테이블 b
	where a.컬럼 = b.컬럼
5. 사용예
	emp테이블에서 empno와 mgr은 연관관계의 계층형 join관계로
	내부 join을 유지하고 있다.
	empno : 모든 사원 고유 번호
	mgr : 해당 사원의 관리자 번호..
	SMITH의 관리자 번호는 7902이고 이 관리자의 번호로 하는 이름은 FORD
 */
SELECT empno, ename, mgr 
FROM emp;
SELECT empno, ename, mgr
FROM emp
WHERE empno = 7902;
SELECT empno, ename, mgr
FROM emp
WHERE empno = 7566;
SELECT empno, ename, mgr
FROM emp
WHERE empno = 7839;
SELECT e.empno 사원번호, e.ename 사원명, e.mgr 관리자번호,
       m.ename 관리자의이름
FROM emp e, emp m
WHERE e.mgr = m.empno; 
-- 하위테이블의 mgr(관리자번호)과 상위테이블 empno연관관계로 self join
 SELECT '사원명 '|| e.ename||'의 관리자는 ' ||
       m.ename || '입니다.' show
FROM emp e, emp m
WHERE e.mgr = m.empno;    
