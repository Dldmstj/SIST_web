/*
 # 중첩 함수
 1. 함수1(함수2(컬럼))
 		해당 컬럼의 데이터를 함수2를 적용하고, 함수1이 적용되어 중첩적으로 적용되는 것을 말함
 		- 기본 함수 기능을 충분히 연습했을 때 가능
 		- 이전에 학습했던 함수를 통해 처리할 수 있는 데이터를 상기
 		- 다양한 문제를 통해 필요로 하는 중첩함수 철
 # instr(지정한 문자열 데이터 | 컬럼, '검색문자')
 1. 특정한 문자열을 검색해서 해당 문자열의 위치를 index로 반환처리하는 함수
 	ex) 주로 대용량의 문자열 데이터를 검색해서 해당 문자열의 첫 번째 위치를 index로 표현해준다.
 2. 추가옵션
 	instr(데이터|컬럼, '검색문자', 시작위치, 검색된 횟수) 
 */
SELECT  INSTR('sql*plus','*') sch1, 
		  INSTR('s*qlplus*s','*',3,1) sch2, 
		  INSTR('s*qlplus*s','*',3,2) sch3, 
		  INSTR('s*qlplus*s','#',3,2) sch4
		  FROM dual;

-- ex) 직책을 검색하되ㅏ man이 있는 데이터를 검색, 해당 위치와 함께 사원명, 직책명, 검색된 위치를 출력하세요
SELECT ename, job, instr(job,'MAN') POS FROM emp WHERE instr(JOB,'MAN')>0;
/*
 # 문자열에 대한 데이터를 크기와 형식을 만들어서 처리할 때
 가면형(varchar2), 고정형(char)
 
 1. 고정형 데이터를 만들어서 처리할 때
 	10자리를 만들어서 데이터 부족할 때 특정 문자열로 채움
 	홍길동#######
 	길동########
 	lpad : left padding, rpad : right padding
 	형식
 	lpad(데이터,크기, 왼쪽에 덧붙일 문자열)
 	rpad(데이터,크기,오른쪽에 덧붙일 문자열)
 */
SELECT lpad('sql',5,'*') show1, rpad('sql',10,'#') show2 FROM dual;
-- 사원명의 최대 크기 확인 후, 고정형으로 모르는 데이터는 *로 추가하여 데이터를 출력
SELECT max(Length(ename)) "최대크기" FROM emp;
SELECT LENGTH(ename), ename FROM emp;
SELECT ename,RPAD(ename,6,'*')"사원명" FROM emp; 
/* 	
 2. 양 옆에 특정 문자를 삭제해서 처리할 때
 	##안녕@@@@
 	옆에 @는 다 지워서 처리 ##안녕
 	옆에#은 다 지워서 처리 안녕@@@
 # ltrim, rtrim
 1. trim은 절삭이라는 말로, 오른쪽 또는 왼쪽에 있는 특정한 문자열을 삭제처리할 때 사용한다.
 	1) ltrim(데이터,'제거할 문자') 왼쪽에 제거할 문자를 없애주는데 반복적으로 처리
 	2) rtrim(데이터,'제거할 문자') 오른쪽에 제거할 문자를 없애주는데 반복적으로 처리
 	3) trim(양쪽에 삭제할 문자' from 데이터) 양쪽에 제거할 문자가 있을 때 한번에 제거
 */
SELECT LTRIM('****sql','*') str1, RTRIM('sql***','*') str2, trim('*' FROM '***sql**') str3 FROM dual;
SELECT job,LTRIM(job,'S') job1 FROM emp; 
SELECT LTRIM(job,'S') str1, RTRIM(job,'N') str2,RTRIM(LTRIM(job,'S'),'N') str3 FROM emp;
