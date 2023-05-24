CREATE TABLE member02(
	id varchar2(50),
	pw varchar2(50),
	name varchar2(50),
	point number,
	auth varchar2(20),
	regdate DATE
);

SELECT * FROM member02;

INSERT INTO member02 values('himan','7777','홍길동',1000,'관리자',sysdate);
SELECT id, name FROM member02 WHERE id = 'himan' AND pw = '7777';

/*
 	select * from member02 where id= ? and pw =?
 	
 	class ShMember
 	private String id;
 	private String pw;
 	private String name;
 	private int point;
 	private String auth;
 	private Date regdate;
 * */
