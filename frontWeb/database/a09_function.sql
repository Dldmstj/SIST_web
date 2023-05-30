/*
 # SQL 함수
 1. 컬럼의 값이나 데이터 타입을 변경하는 경우
 2. 숫자 또는 날짜 데이터의 출력 형식을 변경하는 경우
 3. 하나 이상의 행에 대한 집계를 하는 경우
 # SQL 함수의 유형
 1. 단일행 함수: 테이블에 저장되어 있는 개별 행을 대상으로 함수를 적용하여 하나의 결과를 반환하는 함수
 	- 데이터 값을 조작하는데 주로 사용
 	- 행별로 함수를 적용하여 하나의 결과를 반환하는 함수
 	 	1) 종류
 	 	- 문자함수
	 	- 숫자함수
	 	- 날짜함수
	 	- 변환함수 : 묵시적 데이터변환/명시적 데이터 변환
	 	- 일반함수
	 	2) 사용방법
	 		함수명(컬럼명|표현식, 매개변수1, 매개변수1,...)
	 	
 2. 복수 행 함수: 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수
 	결과를 하나씩 반환하는 함수
 		1) 사용방법
 			select 그룹대상컬럼, 그룹함수(그룹데이터)
 			from 테이블
 			group by 그룹대상컬럼
 			ex) 부서번호별 최고 급여
	 			select deptno, max(sal)
	 			from emp
	 			group by deptno;

 */
-- 문자함수: 문자데이터를 입력하여 문자나 숫자를 결과로 반환하는 함수
-- 1. initcap() : 문자의 첫 번째 문자만 대문자로 변환


SELECT ename, INITCAP(ename), job, INITCAP(job) FROM EMP;
-- ex) || 연결연산자, initcap()를 활용하여 [ename]is a [job]! 표현하기
SELECT INITCAP(ename)||' is a ' ||initcap(job)||'!' info FROM emp; 

SELECT first_name || ' ' ||last_name "전체이름1", upper(first_name|| ' ' || last_name) "전체이름2" FROM EMPLOYEES e;

-- ex) job_id는 소문자, email은 소문자, first_name은 대문자로 변환하여 job @@인 @@의 이메일은 @@입니다 출력
SELECT '직책이 '||LOWER(job_id)||'인 '||UPPER(first_name)||'의 이메일은 "'||lower(email)||'"입니다.' "str" FROM EMPLOYEES e;

-- 검색시, 대소문자 입력 상관없이 검색을 처리해야 할 경우
-- ex) first_name이 대소문자 상관없이 키워드 검색 처리
-- 1) 컬럼의 데이터를 대문자/소문자로 전환한다.
-- 2) 대문자 변환 => 키워드도 대문자로 변경
-- 3) 소문자 변환 => 키워드도 소문자로 변경
/*
  WHERE lower(FIRST_NAME) LIKE lower(?)
  실제 DAO단 처리시, pstmt에는
  pstmt.setString(1,"%"+emp.getFirst_name()+"%");
 */

SELECT FIRST_NAME, UPPER(FIRST_NAME)이름A, LOWER(FIRST_NAME) 이름a  FROM EMPLOYEES e;

SELECT * FROM EMPLOYEES e WHERE LOWER(FIRST_NAME) LIKE '%a'; 
SELECT * FROM EMPLOYEES e2 ;
SELECT email, job_id FROM EMPLOYEES e WHERE LOWER(email) LIKE '%r'; 
SELECT email, job_id FROM EMPLOYEES e WHERE LOWER(JOB_ID) LIKE '%r';

/*
	# 문자열 길이 반환
1. length(데이터/컬럼) : 해당 데이터나 컬럼의 문자열 길이를 반환하는 함수
2. lengthb(데이터/컬럼) : 입력되는 문자열의 바이트를 변환하는 함수
	1) 영문은 글자 수와 byte는 같다
	2) 한글은 한 글자에 3byte
	cf) dual: 오라클에서 지원되는 임시 가상테이블로 데이터를 간단하게 확인할 때 사용
	
 */

SELECT '홍길동' name, LENGTHB('홍길동') "이름(byte)", LENGTH ('홍길동') "이름(글자수)" FROM dual; 
SELECT ename, LENGTH(ename) "글자수",LENGTHB(ename) "byte크기", job, LENGTH(job) "직책길이",LENGTHB(ename) "byte크기" from emp02;

-- ex) 사원테이블에서 사원명과 직책의 글자수를 표현하되, 직책의 글자갯수가 6이상인 데이터만 출력하세요
SELECT ename, LENGTH(ename) "글자 수", job, LENGTH(job) "글자수" FROM emp
WHERE LENGTH(job) >= 6;
/*
 	# 기타 문자열 조작함수
 1. concat(문자열1,문자열2) : 두 문자열을 결합처리한다
 	문자열1 || 문자열2 와 동일한 기능
 	문자열1 || 문자열2 || 문자열3 => concat(concat(문자열1,문자열2), 문자열3)
 2. substr(문자열데이터, 시작위치(0부터),갯수(시작위치부터의))  
 	문자열 데이터를 시작위치와 마지막 위치를 기준으로 절삭처리하여 사용하는 것을 말함.
 	ex) substr('sql*plus',5,4) => plus 출력
 			// 다섯번째부터 4개의 문자 출력처리
 */
SELECT empno, ename, job, concat(ename,job) "이름과 직책" FROM emp02;
SELECT SUBSTR('sql*plus',5,4) "데이터 추출" FROM dual; 

-- ex) 사원명과 사원번호를 이어서 표현하고, 직책은 2번째부터 3글자를 추출해서 출력하세요
SELECT ename, empno, concat(ename,empno) "이름+사원번호", job, SUBSTR(job,2,3) "직책명 추출" FROM emp;
