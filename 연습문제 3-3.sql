[연습문제 3-3]
-- 1. 사원 테이블에서 30번 부서원의 사번, 성명, 급여, 근무 개월수를 조회하시오
-- 단, 근무 개월수를 오늘 날짜를 기준으로 날짜함수를 사용하여 계산
-- ADD_MONTHS (DATE, n) : n개월 수를 더하거나 뺀 날짜를 알려주는 함수
-- MONTHS_BETWEEN(DATE1, DATE2) : DATE1에서 DATE2를 뺀 개월수를 반환하는 함수
-- 사원들의 근무 관련 데이터 : HIRE_DATE 
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무 개월수",
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) "근속 년수"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
ORDER BY 1;


-- 2. 급여가 12000 달러 이상인 사원의 사번, 성명, 급여를 조회하여 급여 순으로 결과를 정렬하시오
-- 단, 급여는 천단위 구분기호를 사용하여 표시
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE SALARY >= 12000
ORDER BY 3;

-- 3. 2005년 이전에 입사한 사원들의 사번, 성명, 입사일, 업무 시작 요일을 조회하시오
-- 단, 업무 시작 요일이란 입사일에 해당하는 요일을 지칭한다
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE,
       TO_CHAR(HIRE_DATE, 'DAY') 업무시작요일
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2005'

















































