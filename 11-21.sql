-- NULL 처리
-- 값이 없는 상태, 미지의 값(수학적 표현)
-- ㄴ 그렇다고 값이 0이라는 것은 아님


-- 1. location 테이블의 구조
DESC location;
/*

*/




-- 2. location 데이터 조회
SELECT *
FROM  locations; -- STATE_PROVINCE, POSTAL_CODE에 null 존재

-- 3. employees 데이터 조회
SELECT *
FROM  employees; -- COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID에 null 존재

[예제 2-37] LOCATIONS 테이블에서 위치코드, 도로주소, 주를 조회하시오
SELECT LOCATION_ID, STREET_ADDRESS, STATE_PROVINCE
FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL

SELECT LOCATION_ID, STREET_ADDRESS, STATE_PROVINCE
FROM LOCATIONS
WHERE STATE_PROVINCE IS NOT NULL

-- 사원 테이블 employees 조회
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NULL

SELECT *
FROM employees
WHERE MANAGER_ID IS NULL -- BOSS

SELECT *
FROM employees
WHERE DEPARTMENT_ID IS NULL 


-- 2.4 데이터 정렬
-- ORDER BY 컬럼 [ASC | DESC] : 특정 컬럼을 오름차순(ASC) 또는 내림차순으로(DESC) 정렬
-- 기본 값은 ASC(작은 수 -> 큰 수 방향)
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
ORDER BY EMPLOYEE_ID -- 사원코드를 ASC로 정렬

SELECT *
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID DESC -- 사원코드를 DESC로 정렬

[예제 2-40] 80번 부서의 사원 정보 중 이름을 기준으로 오름차순으로 정렬하시오
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
ORDER BY FIRST_NAME

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
ORDER BY FIRST_NAME DESC

[예제 2-40] 60번 부서의 사원 정보에 대해 급여(=연봉)을 오름차순으로 정렬하시오
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID, SALARY *12 ANNUAL_SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY ANNUAL_SALARY


[예제 2-43] 사원테이블에서 부서는 오름차순으로, 월 급여는 내림차순으로 정렬하시오
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC









