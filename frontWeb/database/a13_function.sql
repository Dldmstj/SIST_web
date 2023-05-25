/*
 # 오라클의 데이터타입 변환
 1. 오라클에서 사용하는 데이터유형을 함수에 의해 타입을 변환하기도 하고, 자동형변환 처리가 되기도 한다.
 	날짜
 숫자	문자열
 2, 형변환 유형
 	1) 묵시적 데이터 타입의 변환
 		오라클은 특정한 경우에 묵시적 변환되어 데이터 처리를 해준다.
 		조건문에 정확하게 해당 type으로 변환을 함수로 처리하지 않더라도 묵시적으로 활용할 수  있다.
 		ex) select * fro emp where sal >= '2000';
 			문자열로 '2000'을 입력하더라도 시스템에서 연산을 인식하여 숫자로 자동 형변환시켜 처리된다.
 			select * from emp where hiredate like'81%'
 			hiredate가 날짜형이지만 묵시적으로 문자열로 변환되어 키워드 검색되어진다.
*/ 			
-- # to_char
-- ex) 사원명과 입사일, 입사 분기를 표시해서 출력. 1/4 2/4 분기
SELECT ename, HIREDATE, TO_CHAR(hiredate,'Q')||'/4분기' "분기" FROM emp WHERE TO_CHAR(HIREDATE,'Q') IN ('1','2');
-- ex2)
SELECT ename||'은 '||
TO_CHAR(hiredate,'YY')||'년 '||
TO_CHAR(hiredate,'MM')||'월 '||
TO_CHAR(hiredate,'DD')||'일 '||
TO_CHAR(hiredate,'Q')||'/4분기에 입사했습니다.' "str" FROM emp;

/*
 # 출력할 형식2(시간 => 문자열)
 	1) AM/PM 오전/오후 표시
 	2) A.M/P.M
 	3) HH/HH12: 시간표시(1~12)
 	4) HH24 : 24시 표시
 	5) MI : 분
 	6) SS : 초
 */
SELECT SYSDATE, to_char(SYSDATE,'AM HH:MI:SS') "현재 시간" FROM dual;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY/MM/DD AM HH:MI:SS') "날짜/시간" FROM dual; 