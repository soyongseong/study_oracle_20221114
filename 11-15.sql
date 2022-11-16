-- 데이터 조회(p.4)
-- SQL은 대소문자를 구분하지 않지만 Java는 대소문자를 엄격히 구분함
-- 테이블의 구조를 살펴보는 명령 : desc, describe

desc countries;              -- countries라는 테이블의 구조는 아래와 같음

/*
이름           널?       유형           
------------ -------- ------------ 
COUNTRY_ID   NOT NULL CHAR(2)       : 국가의 코드
COUNTRY_NAME          VARCHAR2(40)  : 국가의 이름
REGION_ID             NUMBER        : 국가가 포함된(=소속된) 대륙 코드
*/
-- countries 테이블로부터 *(=all) (열)을 조회하는 명령
SELECT * FROM countries;

SELECT country_id, country_name, region_id     -- select 절
FROM countries;             -- from 절

SELECT *                    -- select 절
FROM countries;             -- from 절




[예제 2-1] EMPLOYEES 테이블의 구조를 조회하시오
desc EMPLOYEES;

[예제 2-1] EMPLOYEES 테이블의 데이터를 모두 조회하시오
SELECT *
FROM EMPLOYEES; 

SELECT employee_id, FIRST_NAME
FROM EMPLOYEES; 



















2.2 조건절
전체데이터에서 특정 행 데이터를 제한하여 조회하기 위해 조전절을 사용한다.
/*
SELECT 컬럼1, 컬럼2, ...        (3) 원하는 칼럼만 조회
FROM 테이블 이름                 (1) 실행
WHERE 조건을 나열;               (2) 실행(=필터링)
*/

[예제 2-3] 80번 부사원의 사원정보를 조회하시오
SELECT *
FROM EMPLOYEES
WHERE department_ID = 80;



-- 전체 부서는 몇개? 아딴 부서코드를 갖고있는지 조회
DESC departments;

SELECT *
FROM departments; -- 27ROWS




















































