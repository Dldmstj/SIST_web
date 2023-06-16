/*
 # 기타함수들
 1. nvl(데이터, null값일 때 처리할 데이터)
 	해당 데이터가 null값일 때 처리할 데이터를 설정함으로 null에 대한 여러가지 에러나
 	연산처리 등에 대하여 효과적으로 처리할 수 있다.
 */
SELECT ename, sal, COMM, sal+comm "합산",
nvl(comm,0) "보너스 초기", 
sal + nvl(comm,0) "합산2"
FROM EMP e ;
/*
 2. nvl2(데이터, null이 아닐 때, null일 때 처리)
 	특정한 데이터(컬럼)가 null이 아닐 때와 null일 때는 구분하여 처리가 필요한 경우
 	ex) comm이 null일 때는 100, null이 아닐 때는 comm에서 10% 더 추가해서 결과값을 처리
 */
SELECT ename, sal, comm, nvl2(comm,comm*1.1, 100) "보너스"
FROM emp;

-- ex) comm이 null일 때는 sal의 15%로 설정하고,
-- null이 아닐 때는 comm에서 sal의 5%를 더하여 보너스 금액을 처리
-- 결과값은 10단위로 절삭처리()
SELECT ename, comm, TRUNC(nvl2(comm, comm*1.05 ,comm*0.15)) "보너스"
FROM emp;
/*
 # nullif(데이터1, 데이터2)
 두 개의 매개변수로 받는 데이터를 비교하여, 동일하면 null을 반환하고,
 동일하지 않으면 첫번째 데이터1을 반환하는 함수를 말한다. 
 */
SELECT nullif('a','a') "동일할때",
nullif('a','b') "다를때1",
nullif(12,13) "다를때2",
nvl(NULLIF('a','a'),'동일') "중첩1",
nvl(NULLIF('a','b'),'동일') "중첩2" 
FROM dual;
-- nvl(nullif(data1,data2),'null인경우') :
-- 중첩함수를 이용해서 동일할 때는 문자열처리, 다를 때는 데이터1처리

-- ex1) comm이 0인 경우에는 null 반환, 그렇지 않으면 comm 그대로 출력. 사원명, 급여, comm을 출력하세요
SELECT ename, sal, comm, nullif(comm,0) FROM emp;

-- ex2) hiredate와 현재 날짜를 비교하여 hiredate가 현재 날짜와 같은 경우 null,그렇지 않은 경우 hiredate 반환
SELECT ename, hiredate, nullif(hiredate, SYSDATE) FROM emp;

/*
 # 조건을 처리하는 1단계 decode함수
 1. 프로그래밍 언어의 if 문이나 case문으로 표현되는 내용을 하나의 함수로 처리할 수 있게 해준다.
 2. 기본형식
 	decode(데이터, 케이스1, 처리1, 케이스2, 처리2,..., 그 외 처리할 데이터)
 */
-- 부서정보가 10(인사), 20(총무), 그 외는 부서미정
SELECT ename, decode(deptno, 10, '인사',
							 20, '총무',
							 '부서 미정'
					) dname
FROM emp;

SELECT * FROM emp;

-- ex) 직책(job)을 기준으로 팀을 정하기로 했다. clerk인 경우 1팀, salesman인 경우 2팀,
		-- 그 외는 3팀이라고 처리할 때, 사원명과 팀을 출력하세요.
SELECT ename, job, decode(job, 'CLERK','1팀',
						'SALESMAN', '2팀',
						'3팀'
							) JNAME
FROM EMP;

SELECT empno, ename, mod(empno,2) div,
		DECODE(MOD(empno,2), 0, '홍팀','청팀'
				) team
FROM emp;

SELECT empno, ename, job, comm,
		decode(job,'SALESMAN',decode(comm,NULL,'비영업직','영업직'),'비영업직'
--				job이 saleman이면 (comm이 null이 아니면 '영업직'), 이외 비영업직
		) "영업직 여부"
FROM emp;

/*
 # 조건을 처리하는 2단계 case
 1. decode의 확장된 형태로, 컬럼값의 '=' 비교를 통해, 조건이 일치하는 경우에만 다른 값을 대치하지만,
 	case함수는 산술연산, 관계연산, 논리연산을 통해 boolean으로 범위를 지정하여 다양한 비교가 가능하게 해준다.
 2. 기본형식
 	1) 조건문 형태로 사용
 		조건문(논리, 산술, 관계, 비교)
 		case when 조건문1 then 처리할 데이터
 			 when 조건문2 then 처리할 데이터
 			 else 위 조건에 해당하지 않을 경우, 처리할 데이터
 		end alias명
 		
 	2) switch case문 형태로 사용 
 		 case 컬럼|데이터
 		 	when 케이스1 then 처리할데이터
 		 	when 케이스2 then 처리할데이터
 		 	when 케이스3 then 처리할데이터
 		 	..
 		 	else 그외
 		 end alias명
 */	
-- 부서번호에 따라서 보너스 적용
SELECT ename, deptno, sal, 
		CASE WHEN deptno = 10 THEN sal*0.2
			 WHEN deptno = 20 THEN sal*0.5
			 WHEN deptno = 30 THEN sal*0.7
			 ELSE sal*1.2
			 END 보너스
FROM emp;

-- job에 따른 보너스 적용

SELECT DISTINCT job FROM emp;

SELECT ename, job, sal, bonus,
		FLOOR(bonus+100) || '%' "%", 
		FLOOR(sal*bonus) || 보너스, 
		FLOOR(sal+sal*bonus) 합산
from(
	SELECT ename, job, sal,
		CASE WHEN job='CLERK' THEN 0.05
			 WHEN job='SALESMAN' THEN 0.1
			 WHEN job='PRESIDENT' THEN 0.15
			 WHEN job='MANAGER' THEN 0.17
			 WHEN job='ANALYST' THEN 0.2
			 ELSE 0
		END bonus
	FROM emp);

/*
 switch(job){
 case: 'CLERK'
 	sal*0.05
 	break;
 case: 'SALESMAN'
 	sal*0.1
 	break;
 case: 'PRESIDENT'
 	sal*0.15
 	break;
 case: 'MANAGER'
 	sal*0.17
 	break;
 case: 'ANALYST'
 	sal*0.2
 	break;
 }
 */

SELECT sal, 
		CASE WHEN sal >=5000 THEN 'A'
			 WHEN sal between 4000 AND 5000 THEN 'B'
			 WHEN sal between 3000 AND 4000 THEN 'C'
			 WHEN sal between 2000 AND 3000 THEN 'D'
			 ELSE 'E'
		END grade
FROM emp;

SELECT sal, 
		CASE WHEN sal >=5000 THEN 'A'
			 WHEN sal >=4000 THEN 'B'
			 WHEN sal >=3000 THEN 'C'
			 WHEN sal >=2000 THEN 'D'
			 ELSE 'E'
		END grade
FROM emp;

/*
 
 */
SELECT SIGN(-5), sign(0), SIGN(7) FROM dual;
-- 급여가 3000이상인 경우와 그렇지 않은 경우
SELECT sal, sign(sal - 3000) div FROM emp;
-- decode 함수와 함께 혼합해서 원하는 데이터를 처리한다.
-- ex) decode와 sign을 활용해서 2000인 경우와, 그렇지 않은 경우를 구분해서
--		2000미만인 경우 보너스 대상자, 보너스 대상자 아님 을 표시
SELECT ename, sal, SIGN(sal - 2000) div,
		DECODE(sign(sal-2000), -1, '보너스 대상자','보너스대상자 아님') "보너스 여부"
FROM emp;

/*
 # extract
 1. 날짜에서 숫자형으로 연도, 월, 일을 추출할 때 활용
 2. 형식
 	extract(옵션 from 날짜형데이터)
 */
SELECT EXTRACT(YEAR FROM sysdate) "오늘 연도",
		EXTRACT(month FROM sysdate) "오늘 월",
		EXTRACT(day FROM sysdate) "오늘 일"
FROM DUAL;

--employees의 hire_date를 이용해서 숫자형으로 연월일 추출, sign()과 decode를 이용해 2005년 이후 입사자 출력
SELECT * FROM EMPLOYEES;
SELECT EXTRACT(YEAR FROM hire_date) "연도",
		EXTRACT(month FROM hire_date) "월",
		EXTRACT(day FROM hire_date) "일",
		decode(sign(EXTRACT(YEAR FROM hire_date)-2005),-1,'2005년 이전입사','2005년 이후 입사') "입사시기"
		FROM EMPLOYEES e2 ;