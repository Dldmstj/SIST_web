--1. EMP 테이블에서 사원명(ename)을 대문자로 출력하세요.
SELECT ename, UPPER(ename) FROM emp;

--2. EMPLOYEES 테이블에서 사원번호(empno)가 100인 데이터의 이메일(email)을 소문자로 출력하세요.
SELECT EMPLOYEE_ID , email, LOWER(email) FROM EMPLOYEES WHERE EMPLOYEE_ID=100;

SELECT * FROM emp;
--3. EMP 테이블에서 사원명(ename)과 부서명(department_name)을 연결한 결과를 출력하세요. 결과 컬럼 이름은 "이름/부서"로 지정하세요.
SELECT ename, DEPTNO, CONCAT(ENAME,DEPTNO)  "이름/부서" FROM emp;

--4. EMP 테이블에서 직원명(ename)과 입사일(hire_date)을 연결한 결과를 출력하세요. 결과 컬럼 이름은 "이름/입사일"로 지정하세요.
SELECT ename, hiredate, CONCAT(ename, hiredate) "이름/입사일" FROM emp; 

--5. EMP 테이블에서 입사일(hire_date)이 1981년인 데이터의 사원명(ename)과 입사일(hire_date)을 출력하세요.
SELECT ename, hiredate FROM emp WHERE HIREDATE = to_date('1981','YYYY');

--6. EMPLOYEES 테이블에서 사원번호(empno)가 200 또는 300인 데이터의 이메일(email)과 직무(job_id)를 출력하세요.
SELECT email, job_id FROM EMPLOYEES WHERE EMPLOYEE_ID = 200 OR EMPLOYEE_ID = 300;

--7. EMP 테이블에서 직원명(ename)을 출력하되, 이름의 앞뒤에 있는 공백을 제거한 결과를 출력하세요.
SELECT ename, TRIM(' ' FROM ename) FROM emp;

SELECT * FROM EMPLOYEES;
--8. EMPLOYEES 테이블에서 이메일(email)에 "J"가 포함된 데이터의 사원명(ename)과 이메일(email)을 출력하세요.
SELECT FIRST_NAME, email FROM EMPLOYEES WHERE EMAIL LIKE '%J%';