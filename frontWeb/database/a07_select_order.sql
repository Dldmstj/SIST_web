/*
 # keywored 검색(계속)
 1. 자릿수에 맞추어서 검색하기
 	ex) 3번째 자리에 A를 포함하는 검색
 		컬럼명 like '--A%
 * */
SELECT * FROM emp WHERE ENAME LIKE '__A%';
SELECT * FROM emp WHERE job LIKE '%A_';
SELECT * FROM emp WHERE job LIKE '__R___';

SELECT * FROM emp WHERE job LIKE '___ES%';
SELECT * FROM emp WHERE job LIKE '%M__';
SELECT * FROM emp WHERE ENAME LIKE '__I__';

/*
  # 정렬 처리
  1. sql 명령분에서 검색된 결과는 일반적으로 테이블에 데이터가 입력된 순서로 호출된다.
  2. 데이터의 출력 순서를 특정 칼럼을 기준으로 오름/내림차순으로 정렬하는 경우 발생
  3. 여러 개의 컬럼에 대해 정렬 순서를 지정해서 처리해야 할 경우가 발생하는데
  		입사일을 오름차순으로, 급여기준으로 내림차순으로 라고 할 수 있다.
  4. 기본적인 정렬 방법
  	1) 문자값을 알파벳 순으로 출력하고, 한글은 가나다라 순으로 출력된다.
  	2) 숫자값을 가장 작은 값으로부터 출력
  	3) 날짜는 최신 날짜 순으로 출력할 수 있다.
  5. 기본 형식
  	select * from 테이블명 where 조건 order by 컬럼명1[asc/desc], 컬럼명2[asc/desc]
  	asc: default로 오름차순 정렬(생략 가능)
  	desc: 역순/내림차순 정렬 
 */

SELECT * FROM emp ORDER BY HIREDATE DESC;

SELECT DEPTNO, sal, ENAME FROM emp ORDER BY DEPTNO ASC, SAL DESC; 