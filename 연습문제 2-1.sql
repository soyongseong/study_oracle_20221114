-- 연습문제 2-1
-- hr 스카마를 이용해 문제를 해결하시오

-- 1. 사번이 200인 사원의 이름과 부서와 번호를 조회하시오
-- 조건 칼럼






-- 2. 급여가 3000에서 15000 사이에 포함되자 않는 사원의 사번, 이름, 급여 정보를 조회하시오
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY < 3000
OR    SALARY < 15000


-- 3. 부서 번호가 30과 60에 소속된 사원의 사번, 이름, 부서번호, 급여를 조회하시오
-- 단 이름은 알파벳 순으로 정렬하영 조회
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 60
ORDER BY FIRST_NAME




-- 4. 급여가 3000에서 15000이면서 부서 번호가 30과 60에 소속된 사원의 사번, 이름, 부서번호, 급여를 조회하시오
-- 단 이름과 성으로 합쳐서 NAME으로, 월급여는 MOUTHLY SALARY로 조회하게 한다
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME NAME, SALARY "MOUTHLY SALARY", DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 15000
AND DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 60


-- 5. 소속된 부서번호가 없는 사원의 사번, 이름, 업무 ID를 조회하시오
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL



-- 6. 커미션을 받는 사원의 사번, 이름, 급여, 커미션을 조회 + 커미션이 높은 사람부터 낮은 사람 순으로 정렬
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY 4 DESC


-- 7. 이름에 문자 z가 포함된 사원의 사번과 사번을 조회하시오
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%'






