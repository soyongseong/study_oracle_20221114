[연습문제 5-1]

1. 이름에 소문자 v가 포함된 모든 사원의 사번, 이름, 부서명을 조회
-- 대소문자 구분
-- EQUI-JOIN : 동등 연산자를 이용한 오라클 조인(=내부 조인)

SELECT e.employee_id, e.first_name, d.department_name
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  e.department_id = d.department_id
AND e.first_name LIKE '%v%'
ORDER BY 1


2. 커미션을 받는 사원의 사번, 이름, 급여, 커미션 금액, 부서명을 조회
-- 단, 커미션 금액은 월급여에 대한 커미션을 나타낸다.  ->  SALARY * COMMISSION_PCT = COMMISSION

SELECT e.employee_id, e.first_name, e.salary, e.salary * E.COMMISSION_PCT BONUS,
       d.department_name
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  e.department_id = d.department_id (+)
AND COMMISSION_PCT IS NOT NULL
ORDER BY 1


3. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명을 조회하시오

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY,
       C.COUNTRY_ID, C.COUNTRY_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE d.location_id= L.LOCATION_ID
AND   L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY 1;


4. 사원의 사번, 이름, 업무코드, 매니저의 사번, 매니저의 이름, 매니저의 업무코드를 조회
-- 사원의 사번 순서로 정렬

SELECT e.employee_id, e.first_name, E.JOB_ID,
       M.employee_id, M.first_name, M.JOB_ID
FROM   EMPLOYEES E, EMPLOYEES M
WHERE  e.MANAGER_ID = M.employee_id
AND    e.MANAGER_ID IS NOT NULL
ORDER BY 1


5. 모든 사원의 사번, 이름, 부서명, 도시, 주소 정보를 조회하여 사번 순으로 정렬

SELECT  e.employee_id, e.first_name, 
        d.department_name,
        l.city, l.street_address
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+)
AND     e.manager_id IS NOT NULL
ORDER BY 1














