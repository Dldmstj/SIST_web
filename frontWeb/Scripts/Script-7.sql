--1. 'MANAGER' 직책을 검색하되, 해당 직책이 포함된 사원의 이름, 직책, 검색 위치를 출력하세요.
SELECT ename,job, instr(job,'MANAGER') "검색위치" FROM emp WHERE job='MANAGER';

--2. 'SALESMAN' 직책을 검색하되, 해당 직책이 포함된 사원의 이름, 직책, 검색 위치를 출력하세요.
SELECT ename, job, instr(job,'SALESMAN') "검색위치" FROM emp WHERE job = 'SALESMAN';

--3. 사원명을 10자리로 맞추고, 왼쪽에 '#'를 추가하여 출력하세요.
SELECT ename, LPAD(ename,10,'#') FROM emp;

--4. 직책을 10자리로 맞추고, 오른쪽에 '@'를 추가하여 출력하세요.
SELECT job, RPAD(job,10,'@') FROM emp;

--5. ' Hello' 문자열에서 왼쪽에 있는 공백을 제거하여 출력하세요.
SELECT LTRIM(' HELLO',' ') str FROM dual; 

--6. 'Java Programming ' 문자열에서 오른쪽에 있는 공백을 제거하여 출력하세요.
SELECT RTRIM('Java Programming ',' ') str FROM dual;

--7. ' Hello World ' 문자열에서 양쪽에 있는 공백을 제거하여 출력하세요.
SELECT TRIM(' ' FROM ' Hello World ') str FROM dual; 

--8. 'SALESMAN' 직책에서 'ALE'을 추출하여 출력하세요.
SELECT job, TRIM( TRIM('ALE' FROM job) FROM 'job') str FROM emp;