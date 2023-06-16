/*
4. 무결성 제약조건의 종류
	1) not null
	2) unique key
	3) primary key
	4) foreign key
		ex) 사원 테이블의 부서번호는 반드시 부서테이블에 있는 부서번호여야 함
	5) check: 해당 컬럼에 저장 가능한 데이터 범위나 조건을 지정처리
		ex) student테이블의 학년읜 1,2,3,4만 데이터로 넣을 수 있다
5. 설정 형식
	1) 컬럼명 데이터타입 constraints 제약조건명 제약조건
		제약조건명: 테이블명_컬럼명_제약조건 종류
	2) primary key 지정
		ex) create tabel student(
			stuno number constraint student_stunno_pk primary key
		);
	제약조건 이름: 테이블명_컬럼명_제약조건종류
		제약조건 종류: pk, uq, nn, fk
	이런 제약
	
 */
-- 사원 정보의 제약조건 테이블에서 확인해보기
SELECT * 
FROM sys.all_CONSTRAINTS
WHERE table_name LIKE 'EMP';

CREATE TABLE student03(
	name varchar2(30) CONSTRAINT student03_name_nn NOT NULL
);
INSERT INTO STUDENT03 values('짱구');
INSERT INTO STUDENT03 values('훈이');
INSERT INTO STUDENT03 values('맹구');
INSERT INTO STUDENT03 values('철수');
INSERT INTO STUDENT03 values('유리');
--INSERT INTO STUDENT03 values(null);
SELECT * FROM STUDENT03;

-- ex) studnet04테이블로 학생번호(숫자), 이름, 국어, 영어, 수학 테이블을 만들면서 학생번호와 이름을 not null로 제약조건 설정
-- 등록/조회 해보기
CREATE TABLE student04(
	stdno NUMBER constraint student04_name_nn NOT NULL,
	stdname varchar2(30) constraint student04_stdname_nn NOT NULL,
	kor NUMBER,
	eng NUMBER,
	math NUMBER
);

INSERT INTO STUDENT04 values('1','짱구',70,80,60);
INSERT INTO STUDENT04 values('2','맹구',70,80,60);
INSERT INTO STUDENT04 values('3','훈이',70,80,60);
--INSERT INTO STUDENT04(kor, eng, math) values(70,80,60);

SELECT * FROM STUDENT04;

-- # unique: 중복되지 않는 유일키만 입력가능. 단, null 중복 허용
CREATE TABLE employee01(
	empno number(5) constraint employee01_empno_uq UNIQUE,
	ename varchar2(30) CONSTRAINT employee01_ename_nn NOT NULL,
	sal number(5)
);
INSERT INTO EMPLOYEE01 values(1,'짱구',1000);
--INSERT INTO EMPLOYEE01 values(1,'맹구',1000);
INSERT INTO EMPLOYEE01 values(2,'훈이',2000);
INSERT INTO EMPLOYEE01 values(null,'철수',2000);
INSERT INTO EMPLOYEE01 values(null,'유리',2000); 	-- UNIQUE KEY : NULL 중복가능
SELECT * FROM EMPLOYEE01;

