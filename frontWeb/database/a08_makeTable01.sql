/*
 # 테이블 생성
 1. 데이터베이스에서 핵심 객체인 테이블 생성 물리적 sql에 의해서 처리되는 것을 말한다.
 2. 테이블 생성 기초
 	1) 데이터 유형
 		number: 숫자형
 		varchar2(크기): 가변형문자열
 			한글 3byte(oracle)
 			varchar2(10)
 			=> 최대문자열 10byte
 				영문은 글자 10, 한글3
 				입력된 글자 크기만큼 메모리
 		char(byte) : 고정형 문자열
 			char(10)
 			=> 무조건 10byte
 			'a' => a
 			자리수가 정해진 코드성 데이터를 사용하고 활용할 때 사용한다.
 		Date: 날짜
 		==> 테이블 생성시 사용되는 가장 기초적인 데이터 유형을 분류한 것임
 	2) 테이블 생성 기본형식
 		create table 테이블명(
 			컬럼명1 데이터유형,
 			컬럼명2 데이터유형,
 		);
 		ps) 테이블 삭제 sql
 			drop table 테이블명;
 	3) 기본 데이터 입력 형식 
 		insert into 테이블 values(데이터1, 데이터2, ...);
 */
/*
 # 복사테이블
 1. 기본에 있는 테이블의 구조만 데이터 복사하고 다른 테이블명으로 설정하는 것을 말한다.
 2. 데이터 + 테이블 구조 모두 복사
  	create table 만들어질 테이블명
  	as select * from 기존테이블;
 3. 테이블 구조만 복사
 */
-- 학생테이블1 학생명과 점수

CREATE TABLE student01(
	name varchar2(50),
	point number
);
select * from dept01;
INSERT INTO student01 values('짱구',70);
INSERT INTO student01 values('맹구',80);
INSERT INTO student01 values('훈이',50);
INSERT INTO student01 values('철수',100);
INSERT INTO student01 values('유리',75);
SELECT * FROM STUDENT01;

-- ex) 구매물건 정보 테이블(물건일련번호, 물건명, 판매가격)
CREATE TABLE product01(
	pnum varchar2(30),
	pname varchar(50),
	price number
);

INSERT INTO product01 values('potA01','감자',10000);
SELECT * FROM product01;

-- ex) 회원 정보 테이블(아이디, 패스워드, 회원명, 포인트, 권한)
CREATE TABLE member01(
	memId varchar2(50),
	memPw varchar2(50),
	memName varchar2(50),
	memPoint number,
	mgr varchar2(50)
);

INSERT INTO member01 values('sh1n','jjan900','짱구',10000,'admin');
SELECT * FROM member01;

-- ex) 학생정보2  테이블(학생번호, 학생명, 국,영,수)
CREATE TABLE student02(
	stdNum number,
	name varchar2(50),
	korPoint number,
	engPoint number,
	mathPoint number
);

INSERT INTO student02 values(2,'짱구',70,80,65);
INSERT INTO student02 values(3,'훈이',80,80,70);
INSERT INTO student02 values(4,'유리',100,80,65);
SELECT * FROM student02;

/*
 # 데이터의 수정 
 1. 기본형식
 	update 테이블
 		set 컬럼명1 = 수정데이터,
 			컬럼명2 = 수정데이터,
 			...
 			컬럼명3 = 수정데이터
 		where 비교/논리연산식 조건
 */
SELECT * FROM STUDENT02 s ;

-- sno 기준으로 1인 학생, 이름과 국어 영어 수정
UPDATE STUDENT02 SET NAME = '맹구', KORPOINT = 80, MATHPOINT =90 WHERE STDNUM =1;
/*
 # 트랜잭션 관련 옵션
 1. 데이터 처리에서 안정성/보안성 확보를 위해서 서버에 등록/수정/삭제 시 commit/rollback기능을 가짐
 2. DB서버에 접속한 사용자는 데이터의 등록/수정/삭제 시 변경되는 데이터를 commit하기 전까지는 이 접속자 화면에서만
 	등록/수정/삭제 명령 후 처리된 데이터가 보이고- 다른 사용자(접속자2)는 해당 처리된 내용으로 보이지 않는다.
 	이 때, 접속자1이 commit하는 순간 다른 접속자에게서도 데이터가 등록/수정/삭제된 데이터가 보인다.
 3. 접속자1은 commit하기 전에 rollback을 통해 원래 데이터로 원복할 수 있고, commit하지 않고 접속을 끊으면
 	등록/수정/삭제된 데이터가 반영되지 않는다.  
 4. 클라이언트 설정 옵션에 autocommit을 하면 위 내용이 처리되지 않고 따로 반영된다.

 */
UPDATE STUDENT02 SET KORPOINT = 100 WHERE STDNUM=1;
-- ex) 이름 기준으로 김길동인 경우에 국어80 영어80 수학 90;
SELECT * FROM STUDENT02 ORDER BY STDNUM asc;
SELECT * FROM STUDENT02 ORDER BY STDNUM asc;
UPDATE STUDENT02 SET KORPOINT = 70, ENGPOINT = 60, MATHPOINT = 50 WHERE NAME ='훈이';
SELECT * FROM STUDENT02 ORDER BY STDNUM asc;

/*
 # 삭제처리
 1. 데이터는 행단위로 선택해서 삭제를 처리할 수 있다.
 	주의) 특정한 데이터를 null로 비우는 것은 삭제가 아니라, 수정구문에 의해서 null로 수정하면 된다.
 2. 삭제 기본 형식
 	delete : 행단위 삭제이기 때문에 컬럼을 지정할 필요 x
 	from table where 조건문(비교|논리연산)
 * */
SELECT * FROM emp01;
SELECT * FROM emp;
-- ex) 직책(job)이 saleman인 데이터를 삭제
DELETE FROM emp01 WHERE job='SALESMAN';

-- ex) 부서번호(deptno)가 2000~3000인 데이터를 삭제
DELETE FROM emp01 WHERE DEPTNO BETWEEN 20 and 30;
DELETE FROM emp01 WHERE sal BETWEEN 2000 and 3000;
