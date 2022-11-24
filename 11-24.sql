-- 4장. 그룹함수
-- 집계함수 : SUM, MIN, ...
-- 그룹함수 : Group by 

-- 4.1 DISTINCT
-- 함수는 함수명 () 형태  VS  SYSDATE
-- hr 스키마 : 여러 테이블 중 EMPLOYEES 테이블의 정보 중 EMPLOYEE_ID가 주 식별자
DESC EMPLOYEES;

-- 테이블의 계약조건 : 식별자 등...
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEES'


-- PK (= Primary Key) : 주 식별자, 주 키
-- FK (= Foreign Key, 다른 이블에서의 PK가 참조하는 테이블의 관계) : 왜래키
-- NN (= NOT NULL) : 널을 허용하지 않음
-- UK (=Unique Key) : 중복을 허용하지 않지만 NULL 을 허용
-- # PK = NN + UK (PK는 중복과 NULL을 허용하지 않음)


[예제 4-1] 사원들이 소속된 부서를 조회
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES

[예제 4-1] 사원들이 소속된 부서를 사번과 함께 조회
SELECT DISTINCT DEPARTMENT_ID, EMPLOYEE_ID
FROM EMPLOYEES

-- DISTINCT는 SELECT목록의 모든 컬럼에 적용된다
-- DISTINCT로 DEPARTMENT_ID와 EMPLOYEE_ID를 조회하면 DEPARTMENT_ID와 EMPLOYEE_ID를 조합한 결과가 중복되지 않는 데이터들을 조회해준다

[예제 4-1] 사원테이블에서 이 회사들의 매니저들을 조회
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES
ORDER BY MANAGER_ID

-- 매니저 정보
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (100, 101, 102, 103, 108, 114)



-- 4.2 집계함수
-- 함수의 형태 : 하나의 결과행을 반환(COUNT, SUM 등 ...)  VS  여러개의 결과행을 반환(DISTINCT)

-- 4.2.1 COUNT()
-- 데이터의 행이 몇 건이 존재하는지 개수를 반환하는 함수
-- 데이터의 값이 NULL인 경우는 제외된다
[예제4-3]
SELECT  COUNT(*) cnt1, COUNT(employee_id) cnt2, COUNT(department_id) cnt3, 
        COUNT(DISTINCT department_id) cnt3
FROM    employees;


-- 4.2.2 SUM ()
-- 숫자 데이터 컬럼의 전체 합계를 계산한 결과를 반환하는 함수
-- 오라클 숫자 데이터 삽입 : NUMBER
-- # 오라클에서 INT나 DOUBLE, LONG ... 등의 다른 프로그래밍 언어를 사용하면
-- 내부적으로 다 NUMBER 취급



[예제4-4] 사원들의 급여 통계를 조회하시오
SELECT COUNT(*) "총 사원수", TO_CHAR(SUM(salary), '9,999,999') "급여 총계",
        TO_CHAR(ROUND(SUM(salary) / 107), '9,999,999') "1인당 급여 평균"
FROM    employees;

-- 4.2.3 MAX() 와 MIN()
-- 데이터 컬럼에서 가장 큰 값을 반환하는 함수 : MAX()
--                "  작은       "        : MIN()
SELECT employee_id, last_name, MAX(salary), MIN(salary)
FROM    employees;
/* 원인 : 집계함수와 함께 사용한 일반 컬럼은 group by 절에 명시해야 함
ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
00937. 00000 -  "not a single-group group function"
*/


SELECT MAX(salary), MIN(salary)
FROM    employees;

-- 4.2.4 AVG()
-- 컬럼의 평균값을 계산하는 함수
-- 성적 평균 = 총계 /  과목 수

SELECT ROUND(AVG(salary)) 평균, SUM(salary) 합계, COUNT(employee_id) "총 사원수"
FROM    employees;
















