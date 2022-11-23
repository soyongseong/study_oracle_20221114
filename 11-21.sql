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


-- 대,소문자 함수
-- INITCAP(char) : 파라미터로 받은 알파벳 단어 단위로 첫 글자를 대문자로 하여 결과를 반환하는 함수
-- UPPER(char) : 파라미터로 받은 알파벳 모두를 대문자화하여 반환하는 함수
-- LOWER(char) :                  "        소문자화하여 반환하는 함수

[예제3-10] 
SELECT  INITCAP('i|am|a|boy') INIT1,
        UPPER('i am a boy') UPPER2,
        LOWER('I AM A BODY') LOWER3
FROM    dual;        


-- LPAD(char1, n [,char2]) : 전체 문자열의 길이 n에서 char1 문자의 길이를 뺀 만큼 char2 문자표현으로 왼쪽에서 채워서 반환하는 함수
-- RPAD(char1, n [,char2]) :                         "                                 "     오른쪽에서   "      
-- Left, Right
-- PAD


SELECT  LPAD('Page 1',15,'*.') "LPAD example",
        RPAD('Page 1',15,'*.') "RPAD example"
FROM DUAL;
/*
LPAD example
---------------
*.*.*.*.*Page 1
*/

-- 제거하고자하는 문자 [,char2] 생략시 기본값으로 공백문자 한 개가 사용된다.
-- LTRIM(char1 [,char2]) : 왼쪽에서~ char1에서 char2로 지정한 문자를 제거한 결과를 반환
[예제3-12]
SELECT  '[' || LTRIM('   ABCDEFG   ') || ']' LTRIM1,
        '[' || LTRIM('   ABCDEFG   ',' ') || ']' LTRIM2,
        LTRIM('ABCDEFG', 'AB') LTRIM3,
        LTRIM('ABCDEFG', 'BA') LTRIM4,
        LTRIM('ABCDEFG', 'BC') LTRIM5
FROM    dual;


-- RTRIM(char1 [,char2]) : 오른쪽에서 char1에서 char2로 지정한 문자를 제거한 결과를 반환
[예제3-12]
SELECT  '[' || RTRIM('   ABCDEFG   ') || ']' RTRIM1,
        '[' || RTRIM('   ABCDEFG   ',' ') || ']' RTRIM2,
        RTRIM('ABCDEFG', 'FG') RTRIM3,
        RTRIM('ABCDEFG', 'GF') RTRIM4,
        RTRIM('ABCDEFG', 'BC') RTRIM5
FROM    dual;

-- TRIM() : 방향을 좌,우,양쪽에서~ char1에서 char2로 지정한 문자를 제거한 결과를 반환
-- 왼쪽에서 제거할때는 LEADING
-- 오른쪽에서 제거할때는 TRAILING
-- 양쪽에서 제거할때는 BOTH , 디폴트값(=생략가능)
-- 제거할 문자의 디폴트값도 공백 한 개가 사용된다.

[예제3-14]
SELECT '[' || TRIM('   ABCDEFG   ') || ']' T1, -- BOTH : 왼쪽/오른쪽(=양쪽)에서 (디폴트)공백제거
        TRIM(LEADING 'A' FROM 'ABCDEFG') T2, -- LEADING: 왼쪽에서 (오른쪽방향으로)
        TRIM(TRAILING 'G' FROM 'ABCDEFG') T3, -- TRAILING : 오른족에서 (왼쪽으로)
        TRIM(BOTH 'A' FROM 'ABCDAEFAGA') T4, -- BOTH 명시 
        TRIM('A' FROM 'ABCDEFG') T5 -- 생략시 DEFAULT
FROM    dual;        


-- SUBSTR(char, position [,length]) : 문자열의 일부를 분리(=추출)해서 반환한다. ★★
-- char 문자열의 position 으로 지정된 위치로부터 length개의 문자를 떼어내어 그 결과를 반환한다.
-- length 생략시 : position 부터 문자열의 끝까지 반환
-- position 값을 0으로 명시할 경우, 디폴트로 1이 적용되어 첫번째 자리부터 length 만큼의 문자열을 반환한다.
[예제3-15]
SELECT  SUBSTR('You are not alone', 9, 3) STR1,
        SUBSTR('You are not alone', 5) STR2,
        SUBSTR('You are not alone', 0, 5) STR3,
        SUBSTR('You are not alone', 1, 5) STR4,        
FROM    dual;        

SELECT 'seonyeonghun@kakao.com' EMAIL_ADDR,
        SUBSTR('seonyeonghun@kakao.com', 1, 12) EMAIL_ID,
        SUBSTR('seonyeonghun@kakao.com', 14) EMAIL_DOMAIN
FROM    dual;        

-- =========================================================
-- position의 값의 음수로 작성하면, 그 위치가 오른쪽부터 시작된다.
-- =========================================================
SELECT  SUBSTR('You are not alone', -9, 3) STR1,
        SUBSTR('You are not alone', -5) STR2,
        SUBSTR('You are not alone', 0, 5) STR3,
        SUBSTR('You are not alone', -1, 5) || ']' STR4        
FROM    dual;        


-- REPLACE(char, search_string [,replace_string])
-- 문자열중 일부를 다른 문자열로 변경하여, 그 결과를 반환한다.
-- XSS(Cross site script) 해킹 공격 --> 검색하는 서비스, 여러 사용자의 입력을 받는 서비스를 제공할때 무력화하는 목적으로
-- 사용할수도 있고, 말 그대로 문자열 일부를 다른 문자로 치환할 수 있음
-- 문자열은 대,소문자를 구분  vs  SQL 자체는 대소문자를 구분하지 않는다.

SELECT  REPLACE('You are not alone', 'You', 'We') REP1,
        REPLACE('You are not alone', 'not') || ']' REP2,
        REPLACE('You are not alone', 'not', null)  || ']' REP3
FROM    dual;

-- TRANSLATE(char, from_string, to_string)
-- char 문자열에서 해당문자를 찾아 1:1로 변환한 결과를 반환한다.
[예제3-18]
SELECT TRANSLATE('u! You are not alone', 'You', 'We') TRANS
FROM    dual;


-- Quiz. '너는 나를 모르는데 나는 너를 알겠느냐' 을 REPLACE와 TRANSLATE로 변환하여 다음과 같이 변경해보세요
-- 1.REPLACE 함수를 사용 --> 나는 나를 모르는데 나는 나를 알겠느냐
SELECT  REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나') REP -- '너'를 '나'로 변경
FROM    dual;

-- 2.TRANSLATE 함수를 사용 --> 나는 너를 모르는데 너는 나를 알겠는냐
SELECT  TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐', '너나', '나너') TRANS
FROM    dual;

-- 종합
SELECT  REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나') REP,
        TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐', '너나', '나너') TRANS
FROM    dual;



-- INSTR(char, search_string [,position] [,_th]) ★★
-- 문자열에서 특정 문자열의 시작 위치를 반환하는 함수
-- char 는 대상 문자열, search_string은 찾는 문자열
-- position은 문자열의 찾는 시작위치, _th는 몇번째 인지를 명시 (단, 생략시 디폴트값은 1)
-- 찾는 문자열이 발견되지 않으면 0을 반환한다.

[예제3-19]
SELECT  INSTR('Every Sha-la-la-la', 'la') INSTR1,
        INSTR('Every Sha-la-la-la', 'la', 7) INSTR2,
        INSTR('Every Sha-la-la-la', 'la', 1, 2) INSTR3,
        INSTR('Every Sha-la-la-la', 'la', 12, 2) INSTR4,
        INSTR('Every Sha-la-la-la', 'la', 15, 2) INSTR5
FROM    dual;


SELECT 'seonyeong@kakao.com' EMAIL_ADDR,
        SUBSTR('seonyeong@kakao.com', 1, 12) EMAIL_ID,
        SUBSTR('seonyeong@kakao.com', 14) EMAIL_DOMAIN
FROM    dual; 

-- 자신의 이메일 주소를 이용해서 @의 위치를 INSTR() 으로 찾고, SUBSTR() 으로
-- EMAIL ID, EMAIL DOMAIN을 분리해 보세요!
-- ※ EXMPLOYEES 테이블에도 EMAIL 이 있지만, @domain.com이 없으므로, 이메일 아이디 라고 보면 됨!
-- email || '@naver.com' EMAIL_ADDR 조회할 수 있음

SELECT  'oracle21c12312312312@kakao.com' EMAIL_ADDR,
        SUBSTR('oracle21c12312312312@kakao.com', 1, INSTR('oracle21c12312312312@kakao.com','@')-1) EAMIL_ID,
        '@' DIVIDER,
        SUBSTR('oracle21c12312312312@kakao.com', INSTR('oracle21c12312312312@kakao.com','@')+1) EAMIL_DOMAIN
FROM    dual;        

SELECT employee_id, first_name, LOWER(TRANSLATE(email, 'akn','*!')) || '@oracle.com' email
FROM    employees;

-- LENGTH(char) vs LENGTHB(char)
-- 문자열의 길이를 반환합니다. vs 문자열의 BYTE 값을 반환합니다.
-- 영문 1자는 1BYTE, 동아시아(한,중,일) 지역의 1글자는 3~4BYTE로 설정되므로 실제 DB 설계시 저장공간, 컬럼의 정의시
-- 데이터에 따른 길이등을 설계할때 참조


-- 3.3 날짜함수
-- 날짜와 시간을 연산의 대상으로 하는 함수

SELECT  SYSDATE 
FROM    dual;
-- SYSDATE()가 함수 아닌가? 그만큼 자주 사용하는 함수라서 간단하게 표기

-- 날짜의 형태를 확인하는 명령
SELECT *
FROM v$nls_parameters; 

-- RR/MM/DD HH:MI:SS로 형태를 바꾸어야 시간정보가 보임
ALTER SESSION SET nls_date_format = 'RR/MM/DD HH:MI:SS'; -- 현재 로그인한 hr 스키마에서 일시적으로 바꾸는것이지 영구적인 설정 변경은 아님,

-- 매번 시간/날짜 정보를 출력하기 위해 설정을 바꾸는 것 보다는,
-- 시간/날짜 함수 또는 변환함수를 사용하는 것이 좋다!!


-- ADD_MONTHS(date, n)
-- 특정 날짜에 지정한 개월의 수를 더해서 그 결과를 날짜로 반환하는 함수
-- ADD : 추가, MONTH : 월/개월

SELECT  ADD_MONTHS(SYSDATE, 1) MONTH1,
        ADD_MONTHS(SYSDATE, 2) MONTH2,
        ADD_MONTHS(SYSDATE, -3) MONTH3
FROM    dual;        


-- MONTHS_BETWEEN(date1, date2)
-- 두 날짜 사이의 개월 수 (=차이)를 반환하는 함수
-- date1 - date2 (이후 날짜 - 이전 날짜)

[예제3-22]
-- 날짜 데이터, 문자 데이터는 '' 로 묶어서 표현
-- RR/MM/DD
-- YYYY-MM-DD
SELECT  TRUNC(MONTHS_BETWEEN(SYSDATE, '2013-03-20')) || '개월' PASSED,
        TRUNC(MONTHS_BETWEEN('2013-08-28', SYSDATE)) || '개월' REMAINED
FROM    dual;

-- LAST_DAY(date)
-- date에 해당하는 마지막 날짜를 반환한다.
-- ex> 날짜가 3월에 해당하면, 31을 반환하고 4월이면 30일을 반환한다.
[예제3-23]
SELECT  LAST_DAY(SYSDATE) LAST1,
        LAST_DAY('2013-02-01') LAST2
FROM    dual;        

-- NEXT_DAY(date, char)
-- date 이후의 날짜에서 char로 명시된 첫번째 일자를 반환
-- char에 요일에 해당하는 문자 SUNDAY, MONDAY,...와 약어인 SUN, MON,..
-- 또는 요일에 해당하는 숫자 1:일요일, 2:월요일, ..7:토요일
-- v$nls_parameter 설정에서 NLS_LANGUAGE, NLS_TERRIORY 설정(기본값이 KOREAN이라서 SUNDAY를 일요일 등으로 표시)
select *
from v$nls_parameters;

[예제3-24]
SELECT  NEXT_DAY(SYSDATE, '월요일') NEXT1,
        NEXT_DAY(SYSDATE, '금요일') NEXT2,
        NEXT_DAY(SYSDATE, '일') NEXT3,
        NEXT_DAY(SYSDATE, 4) NEXT4 -- 1:일요일, 2,3,4:수요일
FROM    dual;

-- ROUND(n [,i]) : -i면 정수부, i는 소수부에서 반올림하여 반환 <숫자함수>
-- ROUND(date, fmt) : 반올림 된 날짜를 fmt에 맞게 그 결과를 반환  <날짜함수>
[예제3-25]

-- ※ Java 형변환(Casting) 함수처럼 사용, ORACLE에서는 한번에 숫자 --> 날짜로 변환 불가, 단계적으로 변환은 가능!!

SELECT  ROUND(TO_DATE('2013-06-30'), 'YYYY') R1, -- TO_DATE() : 문자 데이터를 날짜 데이터로 변환하는 함수
        ROUND(TO_DATE('2013-07-01'), 'YYYY') R2,
        ROUND(TO_DATE('2013-12-15'), 'MONTH') R3,
        ROUND(TO_DATE('2013-12-16'), 'MM') R4,
        ROUND(TO_DATE('2013-05-27 11:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'DD') R5,
        ROUND(TO_DATE('2013-05-27 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DD') R6,
        ROUND(TO_DATE('2013-05-29'), 'DAY') R7,
        ROUND(TO_DATE('2013-05-30'), 'DAY') R8
FROM    dual;        
/*
select *
from v$nls_parameters; -- 동아시아(=한국)에서 설치된 데이터베이스의 설정값

select *
from nls_database_parameters; -- 실제 오라클 데이터베이스 기본 세팅

-- 언어를 영문으로 (임시) 변경
alter session set nls_language = 'KOREA'; -- ENGLISH 
alter session set nls_territory = 'KOREA'; -- AMERICA, ORA-12705
-- ENGLISH, AMIERICA 변경은 가능하나 ORA-01861 오류 발생
*/
select *
from employees
where department_id = :no;



-- 3.4 변환함수(p.30)
-- TO_DATE() : 문자를 날짜로 ★
-- TO_CHAR() : 숫자를 문자로 ★
-- TO_NUMBER() : 문자를 숫자로
/*
            숫자 --------->  문자  ---------> 날짜
TO_NUMBER() <---->      TO_CHAR()  <------>     TO_DATE()
            숫자  <---------- 문자  <-------- 날짜
*/


-- 3.4.1 TO_CHAR(date/n [,fmt]) : 숫자/날짜를 문자로 변환하는 함수
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') CHAR1,
        TO_CHAR(SYSDATE, 'YYYY') CHAR2,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD') CHAR3
FROM dual; -- 시간정보 출력x

SELECT TO_CHAR(TO_DATE('0630', 'MM/DD'), 'RRRR/MM/DD') CHAR --ROUND : 반올림
FROM dual;

SELECT TO_CHAR (TO_DATE('022017','MM/YYYY'), 'MM/YYYY')
FROM dual;



[예제 3-27]
-- 기본 데이터베이스 환경설정 : RR/MM/DD

SELECT TO_CHAR (SYSDATE, 'YYYY-MM-DD') FMT1,
       TO_CHAR (SYSDATE, 'RR-MM-DD HH:MI:SS') FMT2,
       TO_CHAR (SYSDATE, 'YY-MM-DD DAY') FMT3
FROM dual;


[예제 3-28]
SELECT TO_CHAR (12345, '9999999') NUM_FMT1,
       TO_CHAR (12345, '0999999') NUM_FMT2,
       TO_CHAR (123.45, '$99999.99') NUM_FMT3,
       TO_CHAR (12345, 'L9,999,999') NUM_FMT4
FROM dual;

SELECT EMPLOYEE_ID, LAST_NAME, TO_CHAR(SALARY * 12, '$9,999,999') "ANNUAL SALARY"
FROM EMPLOYEES
ORDER BY "ANNUAL SALARY" DESC;



--ALTER SESSION SET NLS_DATEFORMAT = 'RR/MM/DD HH24:MI:SS'; -- 매번 설정을 변경해가면서? NO!


-- 3.5 NULL 관련 함수
-- NULL : 값이 0이 아니라, 데이터가 NULL인 (=빈, 입력되지 않은 상태)

-- EX> 보너스를 계산한다고 했을 때
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT,
       TO_CHAR(SALARY + SALARY * COMMISSION_PCT, '$9,999,999') BONUS
FROM EMPLOYEES

-- 3.5.1 NVL(expr1, expr2)
-- 첫번째 expr1이 NULL이면 expr2를 반환하고
--     "        NULL이 아니면 expr1을 반환하는 함수

-- 커미션 금액이 1000달러 미만인 사원들에게 보너스를 지급하고자 할 때, 이들의 명단을 조회
[예제 3-31] 사번, 이름, 급여, 켜미션율, 커미션 금액을 조회
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT,
       COMMISSION_PCT * SALARY INCENTIVE
FROM EMPLOYEES
WHERE COMMISSION_PCT * SALARY < 1000


-- 3.5.1 NVL(expr1, expr2, expr3)


[예제 3-33] COMMISSION_PCT와 SALARY를 곱해서 인센티브를 제공한다고 헸을 때,
 COMMISSION_PCT가 NULL이면 총 급여는 SALARY만, NULL이 아니면 SALARY + 인센티브가 총 급여가 된다.

SELECT EMPLOYEE_ID, LAST_NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       TO_CHAR (SALARY * NVL(COMMISSION_PCT, 0) '$9,999,999'), COMMISSION_PCT,
       NVL2 (COMMISSION_PCT,
       TO_CHAR(SALARY * (1 + COMMISSION_PCT), '$9,999,999'),
       TO_CHAR(SALARY, '$9,999,999')) TOTAL_SALARY
FROM EMPLOYEES


-- 3.5.3 COALESCE(exp1,exp2,exp3...)
-- 함수의 파라미터 목록에서 처음으로 NULL이 아닌값을 반환하는 함수
-- 따라서 파라미터 목록에는 반드시 NULL 아닌 값이 있어야 함
-- 만약 모두 NULL이라면 NULL 반환하는 함수

[예제 3-35]
SELECT COALESCE ('A', 'B', 'C', NULL) FIRST,
       COALESCE (NULL, 'B', 'C') SECOND,
       COALESCE (NULL, NULL, 'C') THIRD
FROM DUAL


-- COALESCE 실습용 테이블을 생성
CREATE TABLE CONTACT (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    HOME_NUM CHAR(11),
    PHONE_NUM CHAR(11),
    OFFICE_NUM CHAR(11)
);

-- 실습용 샘플 데이터 삽입
INSERT INTO CONTACT
VALUES (1, '홍길동', '0623456789', NULL, NULL);
INSERT INTO CONTACT
VALUES (2, '이순신', NULL, '0103456789', NULL);
INSERT INTO CONTACT
VALUES (3, '홍두깨', NULL, NULL, '0612223333');
INSERT INTO CONTACT
VALUES (4, '하니', '0107778888', NULL, '0612223333');

--조회
SELECT *
FROM CONTACT

-- COALESCE 사용
SELECT ID, NAME, COALESCE(HOME_NUM, PHONE_NUM, OFFICE_NUM) TEL
FROM CONTACT



-- [연습문제 3-4]
-- 1. 사원의 사번, 이름, 부서, 매니저 번호를 조회
-- 단, 매니저가 있는 사람은 MANAGER로 표시, 매니저가 없는 사람은 NO MANAGER라고 표시
-- 매니저도 사원 중 하나, 사장만 매니저가 없다.
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, DEPARTMENT_ID,
       NVL2(MANAGER_ID, 'MANAGER', 'NO MANAGER') MANAGER
FROM EMPLOYEES
--WHERE MANAGER_ID IS NOT NULL
ORDER BY EMPLOYEE_ID




-- 3.6 DECODE와 CASE
-- SQL / 구조화 된 질의어  VS 프로그래밍 언어 / 절차적인 언어
-- 프로그래밍 언어에서는 조건을 따라 명령을 실행하는 IF문 사용. 오라클에서는 DECODE와 CASE가 같은 역할

-- IF ~ ELSE IF 구문과 유사

[예제 3-36] 보너스 지급에 있어서 20번 부서는 급여의 20%를 보너스로 지급,
           30번 부서는 급여의 30%를, 40번 부서는 급여의 40%를 보너스로 지급
           그외의 부서는 보너스를 지급하지 않는다고 할 때, 각 부서별 보너스를 지급받는 사원들의 정보를 조회
           
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY,
       DECODE(DEPARTMENT_ID, 20, SALARY *0.2,
                             30, SALARY *0.3,
                             40, SALARY *0.4,
                             0) BONUS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID


-- 3.6.2 CASE
-- 함수보다 더 큰 개념을 가진 표현식
-- DECODE는 등등 비교만 가능한데, CASE는 더 다양한 연산(동등비교, 범위비교,...)을 할 수 있다
-- 1) DECODE와 같은 동등비교
CASE exp WHEN search1 THEN result1
         WHEN search2 THEN result2
         ... 계속 ...
         [ELSE default]
END

-- 2)DECODE와 다르게 조건비교
CASE WHEN condition1(exp, operater) THEN result1
     WHEN condition2(exp, operater) THEN result2
     ... 계속 ...
     [ELSE default]
END

-- 30번 미만 부서는 급여의 10%를 보너스로 지급하고 30번 부터 50번 까지는 급여의 20%를, 60반 부터 80번 까지는 급여의 30%를
-- 그 외의 부서는 급여의 40%를 보너스로 지급하고자 할 때

SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY,
       case WHEN DEPARTMENT_ID < 30 THEN SALARY *0.1
            WHEN DEPARTMENT_ID BETWEEN 30 AND 50 THEN SALARY *0.2
            WHEN DEPARTMENT_ID BETWEEN 60 AND 80 THEN SALARY *0.3
            ELSE SALARY *0.3 
            END BONUS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID














