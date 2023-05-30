/*
 # 오라클의 데이터타입 변환
 1. 오라클에서 사용하는 데이터유형을 함수에 의해 타입을 변환하기도 하고, 자동형변환 처리가 되기도 한다.
 	날짜
 숫자	문자열
 2. 형변환 유형
 	1) 묵시적 데이터 타입의 변환
 		오라클은 특정한 경우에 묵시적 변환되어 데이터 처리를 해준다.
 		조건문에 정확하게 해당 type으로 변환을 함수로 처리하지 않더라도 묵시적으로 활용할 수  있다.
 		ex) select * fro emp where sal >= '2000';
 			문자열로 '2000'을 입력하더라도 시스템에서 연산을 인식하여 숫자로 자동 형변환시켜 처리된다.
 			select * from emp where hiredate like'81%'
 			hiredate가 날짜형이지만 묵시적으로 문자열로 변환되어 키워드 검색되어진다.
 			''||hiredate 묵시적
 	# 묵시적 형변환을 오라클 서버 내부에 맞게 처리하는 경우
 		
 	2) 명시적 데이터 타입의 변환	
		일반적으로 데이터베이스는 변환함수를 이용하여 데이터 타입을 변환하여 효과적으로 처리한다.
		ex) 현재 컬럼 데이터 유형을 변환해서 조건에 맞게 처리하는 경우
			where to_char(hirdate,'YYYY') = '2002'
				==> 날짜형인데 문자형 날짜 중 연도을 추출하여 비교하여 검색
			where hiredate = to_date('2022-02-12','YYYY-MM-DD')
				==>  해당 컬럼의 유형에 맞게 명시적으로 변경하여 검색하는 경우
		
			to_char(컬럼/데이터,'변환형식') 숫자/날짜 타입을 문자열로 변환해주는 함수이다.
			to_number(컬럼/데이터) 날짜/문자 타입을 숫자로 변환해주는 함수
			to_date(컬럼/데이터) 문자/숫자 타입을 날짜로 변환해주는 함수
*/ 			
/*
	# to_char
	1. 날짜/숫자를 원하는 형태 문자열 형태로 변환하여 데이터를 처리하는 함수
	2. 기본 형식
		to_char(데이터, 출력할 형식)
	3. 출력할형식1(날짜 ==> 문자열)
		1) CC:세기 ex) to_char(sysdate,'CC')
		2) YYYY/YYY/YY/Y 년도 표기
		3) AD/A.D AD/BC 표기
			둘 중에 하나만 표기하면 해당 연도의 A.D/B.C인지를 구분하여 데이터 처리가 된다.
		4) Q  분기 1/4분기, 2/4분기..
		5) MM/MONTH/MON 월표기
		6) WW/W 연을 주기단위로 주차표기/월 주단위로 표기
			WW: 1년을 기준으로 52주차를 표시
			W: 월을 기준으로 1~5주차를 표시
		7) DDD/DD/D 날짜표기
		8) DY/DAY 요일 표기
		위 날짜 표기 형식을 조합하여 원하는 날짜표기 형식으로 처리한다.
			YYYY/MM/DD
			특수문자를 추가해서 표기할 경우 ""사이에 사용한다.
			YYYY"년 "MM"월 "DD"일 
 * */
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