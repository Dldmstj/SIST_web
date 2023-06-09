/*
  # ER모델
  1. 세상의 사물을 개체(entity)와 개체 간의 관계(relationship)로 표현한다.
  2. 개체
  	독립적인 의미를 지니고 있는 유무형의 사람 또는 사물
  	객체의 특성을 나타내는 속성(attribute)에 의해 식별
  	개체끼리는 서로 관계를 가짐	
  	개체 => 속성 => 개체 타입 => 테이블	
  					속성 => 컬럼 => 관계형 구조 설정
  	ex) 
  	사람(개체)		사람(개체)
  	남편(역할)		부인(역할)
  			결혼(관계)
  	
  3. ER다이어그램: ER모델은 개체와 개체간의 관계를 표준된 그림으로 나타낸다.
  	1) 개체/관계
  		직원(개체)	작업(관계)	프로젝트(개체)
  	2) 속성
  		직원의 속성: 직원번호 이름 직위 전화번호
  		프로젝트의 속성: 과제번호 예산
  		
  4. 개체
  	1)
  	2) 데이터베이스에서 주로 다루는 객체 (낱개로 구성된 것, 낱개가 각각 데이터값을 가지는 것, 데이터 값이 변하는 것)
  	3) 비슷한 속성의 객체 타입(entity type)을 구성하며, 객체 집합(entity set)으로 묶음
  		도서: 개체 타입(테이블)
  		축구 아는 여자 => 개체(데이터)
  		축구의 이해 => 개체(데이터)	=> 개체 집합(실 데이터리스트)
  		축구의 역사 => 개체(데이터)
  	
  5. 속성(attribute)
  	1) 개체가 가진 성질
  		개체 타입: 도서
  		속성: 도서이름, 출판사, 도서 단가
  	2) 속성의 ER 다이어그램 표현
  		속성은 기본적으로 타원으로 표현, 개체 타입을 나타내는 직사각형과 실선으로 연결됨
  		속성의 이름은 타원의 중앙에 표기함
  		속성이 개체를 유일하게 식별할 수 있는 키일 경우 속성 이름에 밑줄을 그음
  		도서
  		속성 키속성	도서이름	출판사	도서단가(일반 속성)
 * */

/*
 	ex) 학사관리 시스템에서 
 	- entity가 무엇이 있는지
 		학생,학과,교수,강의,수강신청, 성적..
 		
 	- 이것을 속성으로 구분하여질 내용
 		학생(학번, 이름, 주민번호, 주소, 전화번호, 이메일, 성적,...)
 		학과(학과코드, 학과명,...)
 		교수(교수번호, 이름, 주민번호, 전공, 연구실위치,...)
 		강의(학수번호, 담당교수,강의실, ...)
 		수강신청(수강신청일, 상태, ...)
 		성적(학번, 학점, 성적,...)
 		cf) 비식별 관계 : 연관관계 키가 해당 테이블에 key로 사용되지 않게 설정할 때 사용 (데쉬점선)
 			식별 관계 : 연관관계 키가 해당 테이블의 key로 사용될 때 사용(실선)
 		ex) 수강신청에서 수강번호(key)를 따로 두면 학번과 강의 번호는 비식별관계로 설정
 			수강 번호가 없으면 학번과 강의 번호 두 개를 조합해서 키를 설정할 때, 이 학번과 강의번호는 식별관계로 설정
 			식별관계와 비식별관계의 결정 기준은 해당 식별관계를 했을 때, 이 테이블을 또 참조해서 호출하는 테이블의 연관관계의
 			복잡성을 확인해서 진행한다.
 	- entity type의 이름 정하기
 		
 	- exerd모델링으로 테이블명 컬럼명 정하기 
  
 */