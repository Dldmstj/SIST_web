/*
# 여러가지 조인 구면 형식 활용
1. 
2. 조인 형식
	1) no equi join
		조인하는 두 개의 테이블의 컬럼값이 동일하지 않을 때 조인하는 형식
		- 범위로 조인하는 경우
	2) outer join
		equi join의 조인 조건에서 양측 컬럼 값 중, 어느 하나라도 null이면 '=' 비교ㅛ 결과가
		거짓이 되어 null값을 가진 행은 출력되지 않는다.
	3) self join
		테이블 컬럼 안에 내부적으로 연관관계가 있는 컬럼 간의 조인을 말함
	
 */
SELECT d.*, e.* FROM emp e, dept d WHERE e.DEPTNO = d.DEPTNO
ORDER BY d.deptno;

SELECT DEPARTMENT_name, nvl(FIRST_NAME,'미배정') FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID ORDER BY DEPARTMENT_name;

-- 부서별로 할당된 인원 현황 ( 반드시 outer join 설정 필요)
SELECT DEPARTMENT_name, count(FIRST_NAME)
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID 
GROUP BY DEPARTMENT_name ORDER BY DEPARTMENT_name;

