SELECT * FROM emp02;
SELECT * FROM DEPT01;
SELECT * FROM JOBS01;
SELECT * FROM LOCATIONS;

SELECT * FROM LOCATIONS WHERE STREET_ADDRESS LIKE '%'||'u'||'%' AND CITY LIKE '%'||'o'||'%'; 

select * from jobs01 where job_id like '%'||'ad_vp'||'%';

CREATE TABLE emp02 AS SELECT * FROM emp;
CREATE TABLE DEPT01 AS SELECT * FROM dept;
CREATE TABLE JOBS01 AS SELECT * FROM jobs;

SELECT * FROM emp02 WHERE ename LIKE '%'||'B'||'%';

SELECT COUNT(*) cnt FROM emp02; 

SELECT * FROM emp01;

SELECT * FROM emp WHERE EMPNO = 7499;
-- first_name과 last_name을 합쳐서 키워드 검색
-- salary를 범위를 정해서 검색처리

select * from Employees
WHERE FIRST_NAME || LAST_NAME LIKE '%'||'A'||'%' AND SALARY BETWEEN 0 AND 12000;

select * from Employees
WHERE FIRST_NAME || LAST_NAME LIKE '%'||?||'%' AND SALARY BETWEEN ? AND ?;

SELECT * FROM JOB_HISTORY;
SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%'||'IT_PROG'||'%' AND DEPARTMENT_ID BETWEEN 10 AND 120;

