-- P.9 논리 조간 연산자
-- 1. 현재 NLS 세팅 확인

SELECT *
FROM v$nls_parameters;


-- AND, OR 혼합하여 문장을 작성
[예제 2-16] 30번 부서의 급여가 10000 미만인 사원과 60번 부서의 급여가 5000 이상인 사원 정보를 조회하시오

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 AND SALARY < 10000
OR    DEPARTMENT_ID = 60 AND SALARY >= 5000;

-- 60번 부서의 정보를 조회
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 60;


2.3.5 BETWEEN (범위 조건 연산자)
-- BETWEEN 초기값 AND 마지막값 : 초기값 이상, 마지막 값 이하(= 값이 포함됨)
-- WHERE 조건 >= 값 OR 조건 <= 값

[예제 2-18] 사번이 110부터 120번까지의 사원 정보를 조회하시오
-- 사번이 110, 111, 112... 120에 해당하는 사원드르이 정보를 조회한다. 

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 110
AND EMPLOYEE_ID <= 120

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 110 AND 120


[예제 2-19] 사번이 110부터 120번까지의 사원 중 급여가 5000에서 10000 사이의 사원 정보를 조회하시오

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 110 AND 120
AND SALARY BETWEEN 5000 AND 10000


[예제 2-21] 사번이 110미만 120번 초과인 사원의 사원 정보를 조회하시오

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 110
OR EMPLOYEE_ID > 120;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT BETWEEN 110 AND 120


-- BETWEEN 이나 관계 연산자로 비교할 수 잇는 값은 1) 숫자 데이터 2) 문자 데이터 3) 날짜 데이터

[예제 2-23] 입사일이 2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원의 정보를 조회

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005.1.1' AND '2007.12.31'


-- 기본 NLS 파라미터 설명
SELECT *
FROM v$nls_parameters; --DATABASE 설정값 조회 (뷰)

SELECT *
FROM nls_database_parameters; --DATABASE 설정값 조회 (테이블)

SELECT *
FROM epm_datails_view; --DATABASE 설정값 조회 (테이블)

-- ===== 형변환(casting) 함수 =====
-- TO_DATE() : 어떤(=문자) 데이터를 날짜 포멧으로 변환하는 함수
-- JAN : January, 1월을 나타내는 문자 --> 01(월)로 바꾸는 함수
-- TO_CHAR() 어떤 숫자를 문자로 포멧 변환하는 함수
-- 그밖의 내장 함수들이 많이 있지만 자주 쓰이는 것은 3가지
-- ==============================

SELECT TO_DATE ('RR-MM-DD')
FROM dual

2.3.5 IN 연산자
-- 여러개의 값 중 일치하는 값이 존재하는 지를 비교하는 연산자

[예제 2-25] 30번 부서원, 60번 부서원, 90번 부서원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
OR DEPARTMENT_ID = 60
OR DEPARTMENT_ID = 90

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 60, 90)


[예제 2-25] 30번, 60번, 90번 이외의 부서에 소속된 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30, 60, 90)


2.3.6 LIKE 조건 연산자 (=문자열의 패터을 찾는 연산자)
-- Regular Expression : REGEXP (정규식, 정규표현식)
-- 컬럼 값들 중에서 특정 문자열 패턴에 속하는 값을 찾는 연산자
-- % : 여러개의 문자열을 가진다
-- _ : 하나의 문자를 나타낸다


[예제 2-28] 이름이 K(문자는 대소문자를 가림)로 시작하는 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'K%' -- 소문자 'k%'는 안 됨

[예제 2-30] 이름에 b가 들어가는 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%b%'

[예제 2-31] 이메일의 세번째 문자가 B인 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE EMAIL LIKE '__B%'

[예제 2-31 응용] 이메일의 뒤에서 세번째 문자가 B인 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE EMAIL LIKE '%B__'


[예제 2-33] 전화번호가 6으로 시작하지 않는 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE PHONE_NUMBER NOT LIKE '6%'

[예제 2-34] EMPLOYEES 테이블에서 JOB_ID 컬럼에 _A가 포함된 사원의 정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE '%_A%'














