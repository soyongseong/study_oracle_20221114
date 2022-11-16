-- DESC 테이블명

-- SELECT 컬럼1, 컬럼2 FROM 테이블












 
/* -----------------------------------
    조건절을 구성하는 항묵의 분류    
--------------------------------------*/ 

1) 컬럼, 숫자, 문자
2) 산술연산자 : +, -, *, /, 비교연산자 : =, <, >, <=, >=, !=, <>, (문자)연결 연선자 : 
3) AND, OR, NOT : 논리 연산자
4) LIKE, IN, BETWEEN, EXISTS, NOT
5) IS NULL, IS NOT NULL
6) ANY, SOME, ALL
7) 함수(어떤 작업을 수행하는 명령어의 단위) (VS 프로시저)


2.3 연산자
2.3.1 산술연산자 : +, -, *, /
SELECT 2+2. 2-1, 2*3, 4/2
FROM dual -- dual : 가짜 테이블 (실제 존재하지 않는 가상의 테이블인 dual로 연산처리)

[예제 2-4] 80번 부서 사원의 한 해 동안 받은 급여(연봉)을 조회하시오
-- 사원의 정보는 EMPLOYEES라는 테이블에 저장되어 있음
-- 사원이 근무하는 부서의 정보는 DEPARTMENTS라는 테이블에 저장되어 있음
SELECT employee_id, LAST_NAME, salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

SELECT DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 80;

[예제 2-5] (전체 사원들 중) 한 해 동안 받은 급여가 12000인 사원을 조회하시오

SELECT *
FROM EMPLOYEES
WHERE 





















