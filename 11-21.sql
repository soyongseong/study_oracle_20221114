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
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY 4, 3 DESC


-- F10 : 여러 테이블을 이용해 JOIN 연산할 때 시간소용, 복잡도 등을 오라클 엔진이 어떻게



-- 3장 기본함수
-- 오라클이 제공하는 함수 VS 사용자가 사용하는 함수
-- 내장함수
-- 함수 : 어떠한 명령 처리 코드가 포함된 객체 VS 변수 : 메모리에 데이터를 저장하기 위한 어떤 공간
-- 메소드 : 객체에 정의된 함수 (= 재사용을 위한) / API
-- syso + [ctrl + space] : 자동완성 -> System 객체에 있는 outpintln()
-- 단일행 VS 다중행 함수
-- 함수에 사용하는 파라미터와 반환되는 값의 유형에 따라 함수를 구분한다.
-- DUAL :  기짜 테이블, DUMMY 테이블로 표현식의 결과값을 알아보고자 할 때 유용하다

-- 3.1 숫자함수
-- ABS(n) : 함수 내부에 전달하는 값 n은 파라미터라고 읽습니다. 
[예제 3-1]
SELECT ABS(32) ABS1,
       ABS(-32) ABS2
FROM DUAL

-- SIGN(n) : 함수 내부에 전달하는 값 n이 양수인지 음수인지 여부를 판단하고 그 결과를 반환하는 함수
-- n이 양수면 1을, n이 음수면 -1을, 0이면 0을 반환한다
SELECT SIGN(32), SIGN(-32), SIGN(0)
FROM DUAL

-- 개발자 과정에서 쓰이지는 않는 수학적인 함수들
-- COS(n)
-- TAN(n)
-- 수학 관련 함수들은 더 많이 있음


-- ROUND(n [,i]) : n을 소수점 i번째 자리로 반올림한 결과를 반환하는 함수
-- i는 표현할 소수점 아래 자리수
-- i를 생략하면 i값을 0으로 인식하여 반올림한다. 즉 ROUND(n, 0)은 ROUND(n)과 같은 결과를 나타낸다
[예제 3-3]
SELECT ROUND (123.45678) R1
       ROUND (123.45678, 2) R2
       ROUND (123.45678, 0) R3
FROM DUAL

-- i가 음수인 경우 정수부 i번째 자리에서 반올림한다

[예제 3-4]
SELECT ROUND (123.45678, 2) R1 --소수부 2번째 자리에서 반올림
       ROUND (123.45678, -2) R2 -- 정수부 2반째 자리에서 반올림
FROM DUAL


-- TRUNC(n [,i]) : ROUND와 같은 방식이지만 버림한 결과를 반환하는 함수
-- ROUND (반올림) vs TRUNC (버림)
-- TRUNCATE TABLE 테이블명 : 테이블의 데이터를 모두 버림 (=삭제) 단, 구조/컬럼은 남김
[예제 3-5]
SELECT TRUNC (123.456789) T1 -- 자릿수 i 생략시 0으로
       TRUNC (123.456789, 2) T2 -- 소수점 이하 둘째 자리로 표현 (셋째 자리에서 버림)
       TRUNC (123.456789, -2) T3 -- 정수부 2번째
       TRUNC (123456.789, -2) T4
FROM DUAL


-- CEILL(n) : n과 같거나 큰 가장 작은 정수 반환하는 함수
-- 무조건 올림된 결과를 반환하는 함수
[예제 3-6]
SELECT CEILL (0.12345) C1
       CEILL (123.25) C2
FROM DUAL


-- FLOOR(n) : n과 같거나 작은 가장 큰 정수를 반환하는 함수
-- 무조건 내림된 결과를 반환하는 함수
SELECT FLOOR (0.12345) F1
       FLOOR (123.25) F2
FROM DUAL


-- MOD(m, n) : m을 n으로 나눈 나머지 값을 반환하는 함수
-- n에 0이 오면, m의 값을 그대로 반환한다
-- 프로그래밍 언어 : 0으로 나누면  -> zero divide error 발생
SELECT MOD (2, 0) M1
       MOD (4, 2) M2
FROM DUAL

SELECT MOD (17, 4) M1 -- 17 = 4 X 4 + 1
       MOD (17, -4) M2 -- 17 = -4 X -4 + 1
       MOD (-17, -4) M3 -- -17 = -4 X 4 - 1
       MOD (17, 0) M4 -- 17 = 0 X + 17
FROM DUAL

-- [연습문제 3-1]
-- 1. 사원테이블에서 100번 부서와 110번 부서의 사원에 대해, 사번, 이름, 급여와 15% 인상된 급여를 조회
-- 단, 15% 인상된 급여는 정수로 표시하고 컬럼명은 Increased Salary라고 한다

select EMPLOYEE_ID, LAST_NAME, SALARY,
       ROUND (SALARY + SALARY * 0.15) "Increased Salary"
from EMPLOYEES
where DEPARTMENT_ID in (100, 110)
order by 1;




-- 3.2 문자함수

--CONCAT(CHAR1, CHAR2) : 파라미터로 받은 두 문자열을 연결하여 결과를 반환하는 함수
-- || : 문자열 연결 연산자


-- 대소문자 함수
-- INITCAP(CHAR) : 파라미터로 받은 알파벳 단어의 첫글자를 대문자로 하여 반환하는 함수
-- UPFER(CHAR) : 파라미터로 받은 알파벳 모두를 대문자로 하여 반환하는 함수
-- LOWER(CHAR) : 파라미터로 받은 알파벳 모두를 소문자로 하여 반환하는 함수


-- LPAD, RPAD (CHAR1, )
-- LEFT RIGHT
-- PAD


-- 제거하고자하는 문자 [, CHAR2] 생략시 기본값으로 공백문자 한개가 사용된다.
-- LTRIM (CHAR1 [, CHAR2]) : 왼쪽에서~ CHAR1에서 CHAR2로 지정한 문자를 제거한 결과를 반환
-- RTRIM (CHAR [, CHAR2]) : 오른쪽에서 CHAR1에서 CHAR2로 지정한 문자를 제거한 결과를 반환
-- TRIM : 좌우 양 쪽에서 CHAR1에서 CHAR2로 지정한 문자를 제거한 결과를 반환






-- 3.3 날짜함수
-- 3.4 변환함수
-- 3.5 NULL 관련 함수
-- 3.6 desode와 case







