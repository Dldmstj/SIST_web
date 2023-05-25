-- ex) 급여를 100 단위로 반올림처리, 급여+보너스를 1000단위로 절삭처리하여 출력
SELECT ename, sal, ROUND(sal,-2) "급여1", TRUNC(sal + nvl(comm,0),-3) "급여2(급여+보너스)" FROM emp;

-- ex) 급여를 1/13으로 나누어 소숫점 2자리에서 절삭출력 컬럼, 정수형 올림 처리로 출력 컬럼
SELECT ename, sal, TRUNC(sal/13,2) 급여1, ceil(sal/13) 급여2 FROM emp;

/*
 # mod
 1. 데이터베이스에서는 산술연산자 %(나머지값) 처리 키워드가 없기 때문에 mod가 사용된다.
 2. 형식
 	mod(데이터, m) : 데이터를 m으로 나눈 나머지값
 	ex) mod(10,3) ==> 1 
 */
SELECT mod(10,3) d1, MOD(11,2) d2, mod(10,2) d3 FROM dual;

-- 사번이 짝수인 사원번호와 사원명을 출력하되, 짝/홀 구분자 0/1도 출력하세요
SELECT empno "짝수 empno", ename, mod(empno,2) "0/1" FROM emp WHERE MOD(empno,2) = 0;
/*
 # 날짜함수
 1. oracle 의 날짜 데이터 타입(Date)는 날짜 + 시간을 포함하고 있다
 2. oracle DB의 Date타입의 시간과 날짜 처리 구조
 	1/1000초 => 1초 => 1분 => 1시간 => 1일 => 월 단위부터 규칙적이지 않음 28,29,30,31
 3. 연산과 날짜 데이터
 	1) 기본 연산
 		날짜형 데이터 +1 : 해당 날짜의 1일 이후(시간을 포함해서 24시간 이후)
 		날짜형 데이터 -1 : 해당 날짜의 1일 이전
 		날짜 +1/24 : 해당 날짜의 200분 이후
 		날짜 +200/24/60 : 해당 날짜의 200분 이후
 		ex) 1일 기분으로 0.5 => 12시간
 	2) sysdate : 현재 날짜 + 시간
 */
SELECT SYSDATE 오늘, SYSDATE+1 내일, SYSDATE 어제, SYSDATE+1/24 한시간이후, SYSDATE+6/24 집갈시간, sysdate+1/60/24 쉬는시간 FROM dual;
-- EMPLOYEES에서 현재일을 기분으로 근무일수를 계산한다면 소숫점이하 처리
SELECT FIRST_name, hire_date, SYSDATE, floor(SYSDATE -hire_date), ceil(SYSDATE -hire_date) "근무일차(올림)" FROM EMPLOYEES e ;
/*
 ex) 사원명과 함께 인턴기간 (입사후,120일), 입사 8일전, 현재일 기준으로 근무일 수를 출력해보세요
 **/
SELECT ename, hiredate "입사일", hiredate+120 "입사 120일 후", hiredate-8 "입사 8일 전", FLOOR(SYSDATE - hiredate) "근무일수" FROM emp;

/*
 # 일데이터 처리
 1. 날짜형 데이터는 월단위가 30/31/29 등 유동적이어서, 해당 월에 따라 함수로 이러한 월계산 처리를 하고있다.
 2. 기본형식
 	1) 기본적으로 월 처리함수의 1은 1달을 의미한다. 그래서 1달의 반은 0.5가 된다.
 	2) months_between(날짜1, 날짜2) : 날짜 사이의 개월수를 표시한다
 	월에 대한 증가 카운트가 일단위가 가변적이기에 함수를 이용하는 것이 효율적이다.
 */
SELECT ename, hiredate, MONTHS_BETWEEN(SYSDATE, hiredate) "근무 개월 수",
floor(MONTHS_BETWEEN(SYSDATE,hiredate)) "근무 개월 수",
ceil(MONTHS_BETWEEN(SYSDATE,hiredate)) "근무 개월 차" FROM emp;

-- 12로 나누면 근무 연한과 근무 연차를 계산
-- ceil, floor, 중첩적으로 활용해서 처리할 수 있다

-- ex1) dual을 이용해서 오늘로부터 1000일 이후, 개월수를 출력
SELECT SYSDATE "오늘", SYSDATE+1000 "1000일이후", FLOOR(MONTHS_BETWEEN(SYSDATE+1000,SYSDATE)) "개월수" FROM dual;
SELECT SYSDATE+1000 "1000일이후", ceil(MONTHS_BETWEEN(SYSDATE+1000,SYSDATE)) "개월차" FROM dual;
-- ex2) ename, hiredate, 월단위함수를 이용해서 @@년 @@개월 근무 출력
SELECT ename, hiredate, 
FLOOR(MONTHS_BETWEEN(SYSDATE,hiredate)) "근무 개월",
FLOOR(MONTHS_BETWEEN(SYSDATE,hiredate)/12)||'년 '||
MOD(FLOOR(MONTHS_BETWEEN(SYSDATE,hiredate)),12)||'개월 근무' "근무 일"
FROM emp;

-- ex) 오늘부터 근무하는 것을 기준으로 2000일 이후의 근무연한과 개월수 
SELECT SYSDATE, SYSDATE+2000, 
Floor(MONTHS_BETWEEN(SYSDATE+2000,SYSDATE)/12)||'년 '||
MOD(FLOOR(MONTHS_BETWEEN(SYSDATE+2000,SYSDATE)),12)||'개월 근무' "근무 연/개월"
FROM dual;

/*
 # add_months를 통한 개월수 추가
 1. 특정한 날짜를 기준으로 개월 수를 추가하여 해당 이후 날짜를 처리하는데 사용
 2. 형식
 	add_months(날짜, 추가 개월 수/이전 개월 수) 
 */
SELECT SYSDATE 오늘, ADD_MONTHS(SYSDATE,4) "4개월 후", ADD_MONTHS(SYSDATE,-1) "1개월 전" FROM dual;

-- ex)사원정보를 기준을 사원명,입사일,인턴기간(3갤), 입사 10주년 기념일, 20주년 기념일 출력
SELECT ename, hiredate "입사일", ADD_MONTHS(hiredate,3) "인턴기간", ADD_MONTHS(hiredate,120) "10anv",
ADD_MONTHS(hiredate, 240) "20anv" FROM emp;
/*
 # 다가올 가장 빠른 요일의 날짜 : next_day
 1. 해당 기준일로 명시된 요일에 가장 빠른 날짜
 	next_day(날짜데이터,'요일')

 * */
-- 오늘 이후 가장 빠른 수요일
SELECT NEXT_DAY(SYSDATE,'수') "가장 빠른 수요일" FROM dual;
SELECT NEXT_DAY(SYSDATE,'토') "주말" FROM dual;
-- ex) 입사 후, 첫 주말
SELECT ename, NEXT_DAY(hiredate,'토') FROM emp;
-- ex) 입사 후, 세 번째 되는 일요일의 날짜 출력
SELECT NEXT_DAY(NEXT_DAY(NEXT_DAY(hiredate,'일'),'일'),'일') "세번째 일요일" FROM emp; 

/*
 # 매 월의 마지막 날을 가져오거나 첫 날을 가져올 때 사용하는 함수 : last_day(날짜)
 1. 형식
 	last_dat(기준일) : 해당 기준일에서의 열의 마지막 날짜
 	add_mounths(last_day)+1=1	// 해당 월의 첫째 날짜
 */

-- 개발
-- 삼성전자 => 1차(sbs) -> 2차차(혁력업체1) =>

--사원명과 급여일(그 달 종료일 10일 전), 보너스일(다음달 10)
SELECT ename, hiredate, LAST_DAY(hiredate)-10 "급여일", LAST_DAY(hiredate)+10 "보너스일" FROM emp;