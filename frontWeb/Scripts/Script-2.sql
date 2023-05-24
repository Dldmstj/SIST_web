SELECT * FROM EMP02;

DELETE FROM emp02 WHERE ENAME = '맹구';

INSERT INTO EMP02(empno, ENAME, HIREDATE, SAL)
		values(1003,'마길동', to_date('2023-05-23','YYYY-MM-DD'),3450);

-- ex) 1003 사원번호로 전체 데이터 입력
-- ex) 1004, 2026-06-01, 오길동

INSERT INTO EMP02 
values(1003,'짱구','떡잎마을방범대',7800, to_date('1999-08-30','YYYY-MM-DD'), 3500, 1000, 30);

INSERT INTO EMP02(empno, HIREDATE, ENAME) values(1004,to_date('1999-09-02','YYYY-MM-DD'),'성재똥');

SELECT * FROM emp02 ORDER BY EMPNO;
-- department를 입력처리 하세요
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPARTMENTS01;
CREATE TABLE departments01 AS SELECT * from departments;

-- 수정 처리 구문, 수정할 생성자만 추가
UPDATE emp02 SET ENAME ='마길동(upt)', JOB = '사원', HIREDATE = TO_DATE('2023/05/01','YYYY/MM/DD'), sal = 4000 WHERE empno = 7369;
SELECT * FROM EMP02;

CREATE TABLE locations01 AS SELECT * FROM LOCATIONS;
SELECT * FROM LOCATIONS01;
DELETE FROM LOCATIONS01 WHERE location_id = 1000;
UPDATE LOCATIONS01 SET street_address ='종로1가', postal_code='343122', city ='서울', state_province='서울', country_id='SE'
WHERE location_id=1000;
-- 종로 1가, 343122, 서울, 서울, SE,1000

