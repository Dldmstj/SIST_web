/*
 	# Select sql의 명령문의 표준 형식
 	1. 주로 서버에 데이터를 가져올 때, 활용된다.
 		client <==> server
 					초기 접근 권한/테이블 생성
 		요청/가져오기 select
 		전달만		입력/수정/삭제(insert, update, delete)
 	2. 기본 형식
 		select * |컬럼명: 열단위로 나타날 데이터를 선택
 		from 테이블명 테이블별칭: 대상 테이블명, 테이블alias명
 		where 조건문: 행 단위로 나타날 데이터를 filtering 처리
 		group by 그룹할 컬럼지정: 특정 컬럼 기준으로 합산 갯수, 최소/최대값 산정
 		having: 그룹의 조건을 지정
 		order by 컬럼명 zsc/desc: 정렬한 우선순위 컬럼 지정
 		
 */
SELECT * FROM emp;
SELECT deptno, ename, sal	-- [열단위 선택] 컬럼 단위로 열을 선택
FROM emp
WHERE sal >= 3000; 	--[행단위 필터링] sal이 3000이상인 경우만 검색

-- group 함수 처리
SELECT deptno, sal
FROM EMP
ORDER BY DEPTNO;	-- ORDER BY 컬럼명 특정 컬럼 기준으로 정렬

SELECT DEPTNO, max(sal) msal	-- 그룹할 컬럼, 함수명(컬럼명)
FROM EMP
GROUP BY DEPTNO ;
-- order by 컬럼명 desc|asc (정렬기준 처리)

SELECT ename, sal
FROM EMP
ORDER BY sal ASC;

/*
 	# column
 	1. select 컬럼명 as 별칭
	2. select 컬럼명 별칭
	3. select 컬럼명 "공백이나 특수문자포함"
 * */
SELECT ename AS name, sal salary, deptno 부서번호, empno "사원번호", job "직책번호"
FROM emp;

-- ex) empno => no, ename => 사원명, mgr => 관리자번호로 표현하여 컬럼 출력
SELECT empno AS NO, ename 사원명, mgr 관리자번호 FROM emp;
/*
  # 데이터의 산술 연산자와 문자연결 처리
  	1. 컬럼의 타입이 숫자이면 +,-,*,/ 4칙연산자가 처리된다.
  	2. 문자열과 문자열은 ||기호로 연결한다.
 */
SELECT SAL, SAL*2 "2배수", SAL/100 "100나누기" FROM emp;

SELECT ename 
||'/'|| job "이름과 직책"
FROM emp;

-- ex) 사원의 이름은 @@@입니다.
SELECT ename,'사원의 이름은'||ename||'입니다' msg FROM emp;

/*
	# 서브 쿼리
	SELECT a.*, sal+bonus
	from(
		SELECT ENAME , sal, sal*0.2 BONUS
		
	) a;
*/

SELECT ename, sal, sal*0.2 "보너스(급여의 20%)" FROM emp;

-- ex) 사원의 이름은 @@@이고 급여와 보너스(급여15%)의 합산은 @@@원 입니다.

SELECT '사원의 이름은'||ename||'이고, 급여와 보너스의 합산은'|| (sal+sal*0.15)||'만원 입니다.' msg FROM emp;
-- 문자열 안에 연산을 처리할 때는 ()로 우선 연산

SELECT DISTINCT deptno FROM emp;	-- 중복되는 데이터를 제거하는 DISTINCT
SELECT * FROM emp;	
-- job과 mgr 각각 중복 데이터를 제거한 데이터내용을 리스트하세요
SELECT DISTINCT job FROM emp;
SELECT DISTINCT mgr FROM emp;
-- distinct 컬럼1, 컬럼2
-- 컬럼1과 컬럼2 두 개 모두를 비교해서 다른 데이터 로딩
SELECT DISTINCT  job, deptno
FROM emp;
