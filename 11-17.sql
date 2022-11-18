-- 2장 데이터 조회 구문
/*
DML : SELECT, INSERT, 


*/

-- SELECT 구문 (기본 : )
SELECT 컬럼1, 컬럼2;
FROM 테이블명;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES;

-- SELECT 구문 + 조건절 (=필터링) : 특정 조건에 맞는 데이터만 조회
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID  -- SELECT 절
FROM EMPLOYEES                                 -- FROM 절
WHERE DEPARTMENT_ID = 100;                     -- WHERE (조건)절

-- 자동 서식 적용 :
-- TAB 자주 사용!

[예제 2-11] 성이 King인 사원의 정보를 조회하시오
-- 사원의 정보 : 사번, 이름, 성, 전화번호, 부서... 등
-- LAST_NAME이 King인지 비교

SELECT EMPLOYEE_ID 사번, LAST_NAME 성, DEPARTMENT_ID 부서
FROM EMPLOYEES
WHERE LAST_NAME = 'King';  
-- SQL은 (명령어)대소문자를 구분하지 않으나, (문자값)문자데이터는 구분함 (성을 찾기위하여 King은 가능하나 king이나 KING은 못 함)




[예제 2-12] 입사일이 2004년 1월 1일 이전인 사원의 정보(=사번, 이름, 입사일.. 등)

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < '2004.1.1'

-- 데이터베이스 설정 보기
-- NLS : 나라별, 언어별 설정 지원
-- 1. NLS 세팅 확인
SELECT *
FROM v$nls_parameters;
-- 2. sqlDeveloper > 도구 > 환경설정 > 데이터베이스 > NLS를 확인

2.3.4 AND, OR, NOT 논리조건 연산자
-- 여러개의 조건이 오는 경우 필요한 연산자
-- 1) AND 연산은 조간이 모두 TRUE일 때 최종 TRUE를 반환

[예제 2-13] 30번 부서 중 사원이 급여가 10000 이하이면서 2005년 이전에 입사한 사원의 정보를 조회하시오
(여기서 정보는 사번, 이름, 급여, 부서코드)
--SQL(구조화된 질의 언어 <-----> 패턴)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 30  -- 첫번째 조건
AND SALARY <= 10000     -- 첫번째 조건
AND HIRE_DATE < '05/1/1';

-- DEN이라는 사람의 정보를 추가 조회
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 114

-- 2) OR 연산은 조건이 하나라도 TRUE일 때 최종 TRUE를 반환
[예제 2-15] 30번 부사나 60번 부서에 속한 사원의 정보를 조회하시오

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
OR DEPARTMENT_ID =60















