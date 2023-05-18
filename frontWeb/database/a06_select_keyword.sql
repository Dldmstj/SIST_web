/*
 	# keyword를 이용한 조건문의 호ㅓ라용
 	1. nvl() 함수: null을 효과적으로 처리
 	2. in: or을 줄이기 위한 조건 검색
 	3. like: 키워드 검색 - 비슷한 글자가 있으면 검색
 */
SELECT mgr, COMM FROM emp;

-- 사원정보에서 급여,보너스 합산하여 출력
SELECT ename, sal, comm, sal+COMM 합산 FROM emp;
-- null이 포함되어있으면 합산의 결과값이 null

-- nvl(컬럼, 대체데이터): 해당 컬럼이 null값일 때, 해당 컬럼 유형과 같은 유형의 데이터를 지정하면
-- null대신 처리됨
SELECT comm, nvl(comm,0) 보너스 FROM emp;		-- null이 0으로 변환
SELECT comm, nvl(comm,"") 보너스 FROM emp;	-- 같은 유형이 아니기 때문에 에러

CREATE TABLE emp01
AS SELECT * FROM emp;
INSERT INTO emp01(empno) values(8000);
INSERT INTO emp01(empno) values(8001);
INSERT INTO emp01(empno) values(8002);
SELECT * FROM emp01;

SELECT empno, nvl(ename,'noname') 이름, nvl(job,'0')직책 FROM emp01 WHERE ename IS NULL;
-- 숫자는 자동으로 casting되어 '0'처리

SELECT * FROM emp01 WHERE ename IS NULL;

SELECT * FROM EMPLOYEES;

-- ex) EMPLOYEES기준으로 last_name과 salary, commission_pct를 기준으로 보너스를 출력하되,
		-- 급여와 보너스의 합산을 처리하세요. nvl활용
SELECT last_name 사원명, salary 급여, nvl(COMMISSION_PCT,0)*100 "보너스(%)", 
nvl(SALARY*COMMISSION_PCT,0) 보너스, nvl(SALARY+SALARY*COMMISSION_PCT,0) "급여+보너스" FROM EMPLOYEES;

-- 사원의 보너스
SELECT * FROM emp;
-- 보너스가 null이거나 0인 데이터를 제외하고 사원정보에서 급여와 보너스를 확인할 때
SELECT ename, sal, COMM FROM emp WHERE nvl(comm,0) != 0;

-- 사원번호를 7499, 7521, 7566에 대한 데이터를 가져올 때
SELECT * FROM emp WHERE empno=7499 OR empno=7566;	-- 무한 OR 도르마므..
-- 지정한 데이터가 or조건으로 연결될때 사용
SELECT * FROM emp WHERE empno IN (7499, 7521,7566);

SELECT * FROM emp WHERE ENAME in('SMITH','ALLEN','JONES');

-- ex) deptno가 20이거나 30인 경우 급여가 2000미만인 데이터를 출력
SELECT * FROM emp WHERE DEPTNO in(20,30) AND sal<2000;

SELECT ename FROM EMP
WHERE ENAME LIKE '%S%';

-- 키워드 검색 형식
-- 컬럼명 LIKE '키워드%'
-- 컬럼명 LIKE '%키워드%'
-- 컬럼명 LIKE '%키워드'

SELECT * FROM EMPLOYEES;

-- ex) first_name, last_name을 검색할 때
-- 	1) 특정한 키워드가 포함되는 경우 처리
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%S%'AND LAST_NAME LIKE '%S%';
-- 	2) fname lname 특정한 키워드로 시작하는 데이터 검색
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S%'AND LAST_NAME LIKE 'A%';
-- 	3) fname에 er로 끝나는 데이터 검색
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%er';