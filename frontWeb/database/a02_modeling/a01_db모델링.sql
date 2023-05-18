/*
  # 데이터베이스 설계
  1. 데이터베이스의 생명주기
  	- 데이터베이스의 생성과 운영에 관련된 특징
  		1) 요구사항 수집과 분석
  		2) 설계
  		3) 구현
  		4) 운영
  		5) 감시 및 개선
  		위 1)...5) 내용이 순차에 의해 반복되면서, 해당 DB시스템은 보다 최적화된 환경으로 만들어진다.
  2. 생명주기의 구체적인 내용
  	1) 요구사항 수집 및 분석
  		사용자들의 요구사항을 듣고 분석하여 데이터베이스 구축의 범위를 정하는 단계
  	2) 설계
  		분석된 요구사항을 기초로 주요 개념과 업무 프로세스 등을 식별하고(개념적 설계), 사용하는 DBMS의 종류에 맞게 변환(논리적 설계)
  		한 후, 데이터베이스 스키마를 도출(물리적 설계)한다.
  	3) 구현
  		설계 단계에서 생성된 스키마를 실제 DBMS에 적용하여 테이블 및 관련 객체(뷰, 인덱스 등)을 만든다.
  	4) 운영
  		구현된 데이터베이스를 기반으로 소프트웨어를 구축하여 서비스를 제공한다.
  	5) 감시 및 개선
  		데이터베이스 운영에 따른 시스템의 문제를 관찰하고 데이터베이스 자체의 문제점을 파악하여 개선한다. 
  		
  3.
  	1) 개념적 모델링
  		중요 개념을 구분
  		핵심 Entity(독립개체)도출(엔티티,
  		ERD작성
  	2) 논리적 모델링
  		각 개념을 구체화
  		ERD-RDB 모델 사상(각 엔티티와의 관계설정, 관계형 엔티티 도출)
  			ex) 교수, 학생 (수강)
  		상세 속성 정의
  		정규화 등(관계형 엔티티에서 시제 테이블 내용 도출을 통해 데이터의 무결성 확보를 위해 테이블 분리 단계)
  	3) 물리적 모델링
  		데이터베이스 생성 계획에 따라 개체, 인덱스 등을 새성
  		DB객체 정의
  		테이블 및 인덱스 등 설계
 */