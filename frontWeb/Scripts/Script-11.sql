--문제 1:
--사원들의 보너스를 계산하려 합니다. 보너스는 comm 값에 10%를 더한 값입니다. 만약 comm이 null인 경우에는 sal의 20%로 보너스를 설정하고, 이 보너스의 합산 금액을 출력하시오.
--(문제에서는 nvl 함수를 활용해야 합니다.)
SELECT ename, sal, comm, nvl2(comm, comm+comm*0.1,sal*0.2)bonus, sal+nvl2(comm, comm+comm*0.1,sal*0.2)"합산" FROM emp;

--문제 2:
--각 사원의 보너스를 계산하되, 만약 comm 값이 null이면 sal의 15%로, null이 아니라면 comm 값에 sal의 5%를 더하여 보너스를 계산하려 합니다. 10단위로 절삭한 보너스 금액을 출력하시오.
--(문제에서는 nvl2 함수를 활용해야 합니다.)
SELECT ename, TRUNC(nvl2(comm, comm+sal*0.05,sal*0.15),-1)bonus FROM emp;

--문제 3:
--모든 사원의 보너스를 계산하려 합니다. 만약 comm이 0인 경우에는 null을 반환하고, 그렇지 않으면 comm을 그대로 출력하시오. 각 사원의 사원명, 급여, 보너스를 출력하시오.
--(문제에서는 nullif 함수를 활용해야 합니다.)
SELECT ename, comm, nullif(comm,0) "comm 검사" FROM emp;

--문제 4:
--각 사원에 대한 급여 등급을 부여하려 합니다. 5000 이상의 급여를 받는 사원은 'A' 등급, 3000 ~ 4999는 'B' 등급, 2000 ~ 2999는 'C' 등급, 그 외는 'D' 등급을 부여하려 합니다. 각 사원의 이름과 급여 등급을 출력하시오.
--(문제에서는 CASE WHEN 구문을 활용해야 합니다.)
SELECT ename, sal, 
		CASE WHEN sal >=5000 THEN 'A'
			 WHEN sal between 4000 AND 5000 THEN 'B'
			 WHEN sal between 3000 AND 4000 THEN 'C'
			 WHEN sal between 2000 AND 3000 THEN 'D'
			 ELSE 'E'
		END grade
FROM emp;

--문제 5:
--사원들의 입사일이 1982년 이후인지 여부를 확인하려 합니다. 1982년 이후에 입사한 사원의 경우 'Y', 그렇지 않은 경우 'N'으로 출력하시오.
--(문제에서는 extract와 decode 함수를 활용해야 합니다.)
SELECT ename, HIREDATE, 
		decode(sign(EXTRACT(YEAR FROM hiredate)-1982),-1,'1982년 이전입사','1982년 이후 입사') "입사시기"
FROM emp;