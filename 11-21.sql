-- NULL ó��
-- ���� ���� ����, ������ ��(������ ǥ��)
-- �� �׷��ٰ� ���� 0�̶�� ���� �ƴ�


-- 1. location ���̺��� ����
DESC location;
/*

*/




-- 2. location ������ ��ȸ
SELECT *
FROM  locations; -- STATE_PROVINCE, POSTAL_CODE�� null ����

-- 3. employees ������ ��ȸ
SELECT *
FROM  employees; -- COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID�� null ����

[���� 2-37] LOCATIONS ���̺��� ��ġ�ڵ�, �����ּ�, �ָ� ��ȸ�Ͻÿ�
SELECT LOCATION_ID, STREET_ADDRESS, STATE_PROVINCE
FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL

SELECT LOCATION_ID, STREET_ADDRESS, STATE_PROVINCE
FROM LOCATIONS
WHERE STATE_PROVINCE IS NOT NULL

-- ��� ���̺� employees ��ȸ
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NULL

SELECT *
FROM employees
WHERE MANAGER_ID IS NULL -- BOSS

SELECT *
FROM employees
WHERE DEPARTMENT_ID IS NULL 


-- 2.4 ������ ����
-- ORDER BY �÷� [ASC | DESC] : Ư�� �÷��� ��������(ASC) �Ǵ� ������������(DESC) ����
-- �⺻ ���� ASC(���� �� -> ū �� ����)
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
ORDER BY EMPLOYEE_ID -- ����ڵ带 ASC�� ����

SELECT *
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID DESC -- ����ڵ带 DESC�� ����

[���� 2-40] 80�� �μ��� ��� ���� �� �̸��� �������� ������������ �����Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
ORDER BY FIRST_NAME

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
ORDER BY FIRST_NAME DESC

[���� 2-40] 60�� �μ��� ��� ������ ���� �޿�(=����)�� ������������ �����Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID, SALARY *12 ANNUAL_SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY ANNUAL_SALARY


[���� 2-43] ������̺��� �μ��� ������������, �� �޿��� ������������ �����Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY 4, 3 DESC


-- F10 : ���� ���̺��� �̿��� JOIN ������ �� �ð��ҿ�, ���⵵ ���� ����Ŭ ������ ���



-- 3�� �⺻�Լ�
-- ����Ŭ�� �����ϴ� �Լ� VS ����ڰ� ����ϴ� �Լ�
-- �����Լ�
-- �Լ� : ��� ��� ó�� �ڵ尡 ���Ե� ��ü VS ���� : �޸𸮿� �����͸� �����ϱ� ���� � ����
-- �޼ҵ� : ��ü�� ���ǵ� �Լ� (= ������ ����) / API
-- syso + [ctrl + space] : �ڵ��ϼ� -> System ��ü�� �ִ� outpintln()
-- ������ VS ������ �Լ�
-- �Լ��� ����ϴ� �Ķ���Ϳ� ��ȯ�Ǵ� ���� ������ ���� �Լ��� �����Ѵ�.
-- DUAL :  ��¥ ���̺�, DUMMY ���̺�� ǥ������ ������� �˾ƺ����� �� �� �����ϴ�

-- 3.1 �����Լ�
-- ABS(n) : �Լ� ���ο� �����ϴ� �� n�� �Ķ���Ͷ�� �н��ϴ�. 
[���� 3-1]
SELECT ABS(32) ABS1,
       ABS(-32) ABS2
FROM DUAL

-- SIGN(n) : �Լ� ���ο� �����ϴ� �� n�� ������� �������� ���θ� �Ǵ��ϰ� �� ����� ��ȯ�ϴ� �Լ�
-- n�� ����� 1��, n�� ������ -1��, 0�̸� 0�� ��ȯ�Ѵ�
SELECT SIGN(32), SIGN(-32), SIGN(0)
FROM DUAL

-- ������ �������� �������� �ʴ� �������� �Լ���
-- COS(n)
-- TAN(n)
-- ���� ���� �Լ����� �� ���� ����


-- ROUND(n [,i]) : n�� �Ҽ��� i��° �ڸ��� �ݿø��� ����� ��ȯ�ϴ� �Լ�
-- i�� ǥ���� �Ҽ��� �Ʒ� �ڸ���
-- i�� �����ϸ� i���� 0���� �ν��Ͽ� �ݿø��Ѵ�. �� ROUND(n, 0)�� ROUND(n)�� ���� ����� ��Ÿ����
[���� 3-3]
SELECT ROUND (123.45678) R1
       ROUND (123.45678, 2) R2
       ROUND (123.45678, 0) R3
FROM DUAL

-- i�� ������ ��� ������ i��° �ڸ����� �ݿø��Ѵ�

[���� 3-4]
SELECT ROUND (123.45678, 2) R1 --�Ҽ��� 2��° �ڸ����� �ݿø�
       ROUND (123.45678, -2) R2 -- ������ 2��° �ڸ����� �ݿø�
FROM DUAL


-- TRUNC(n [,i]) : ROUND�� ���� ��������� ������ ����� ��ȯ�ϴ� �Լ�
-- ROUND (�ݿø�) vs TRUNC (����)
-- TRUNCATE TABLE ���̺�� : ���̺��� �����͸� ��� ���� (=����) ��, ����/�÷��� ����
[���� 3-5]
SELECT TRUNC (123.456789) T1 -- �ڸ��� i ������ 0����
       TRUNC (123.456789, 2) T2 -- �Ҽ��� ���� ��° �ڸ��� ǥ�� (��° �ڸ����� ����)
       TRUNC (123.456789, -2) T3 -- ������ 2��°
       TRUNC (123456.789, -2) T4
FROM DUAL


-- CEILL(n) : n�� ���ų� ū ���� ���� ���� ��ȯ�ϴ� �Լ�
-- ������ �ø��� ����� ��ȯ�ϴ� �Լ�
[���� 3-6]
SELECT CEILL (0.12345) C1
       CEILL (123.25) C2
FROM DUAL


-- FLOOR(n) : n�� ���ų� ���� ���� ū ������ ��ȯ�ϴ� �Լ�
-- ������ ������ ����� ��ȯ�ϴ� �Լ�
SELECT FLOOR (0.12345) F1
       FLOOR (123.25) F2
FROM DUAL


-- MOD(m, n) : m�� n���� ���� ������ ���� ��ȯ�ϴ� �Լ�
-- n�� 0�� ����, m�� ���� �״�� ��ȯ�Ѵ�
-- ���α׷��� ��� : 0���� ������  -> zero divide error �߻�
SELECT MOD (2, 0) M1
       MOD (4, 2) M2
FROM DUAL

SELECT MOD (17, 4) M1 -- 17 = 4 X 4 + 1
       MOD (17, -4) M2 -- 17 = -4 X -4 + 1
       MOD (-17, -4) M3 -- -17 = -4 X 4 - 1
       MOD (17, 0) M4 -- 17 = 0 X + 17
FROM DUAL

-- [�������� 3-1]
-- 1. ������̺��� 100�� �μ��� 110�� �μ��� ����� ����, ���, �̸�, �޿��� 15% �λ�� �޿��� ��ȸ
-- ��, 15% �λ�� �޿��� ������ ǥ���ϰ� �÷����� Increased Salary��� �Ѵ�

select EMPLOYEE_ID, LAST_NAME, SALARY,
       ROUND (SALARY + SALARY * 0.15) "Increased Salary"
from EMPLOYEES
where DEPARTMENT_ID in (100, 110)
order by 1;




-- 3.2 �����Լ�

--CONCAT(CHAR1, CHAR2) : �Ķ���ͷ� ���� �� ���ڿ��� �����Ͽ� ����� ��ȯ�ϴ� �Լ�
-- || : ���ڿ� ���� ������


-- ��,�ҹ��� �Լ�
-- INITCAP(char) : �Ķ���ͷ� ���� ���ĺ� �ܾ� ������ ù ���ڸ� �빮�ڷ� �Ͽ� ����� ��ȯ�ϴ� �Լ�
-- UPPER(char) : �Ķ���ͷ� ���� ���ĺ� ��θ� �빮��ȭ�Ͽ� ��ȯ�ϴ� �Լ�
-- LOWER(char) :                  "        �ҹ���ȭ�Ͽ� ��ȯ�ϴ� �Լ�

[����3-10] 
SELECT  INITCAP('i|am|a|boy') INIT1,
        UPPER('i am a boy') UPPER2,
        LOWER('I AM A BODY') LOWER3
FROM    dual;        


-- LPAD(char1, n [,char2]) : ��ü ���ڿ��� ���� n���� char1 ������ ���̸� �� ��ŭ char2 ����ǥ������ ���ʿ��� ä���� ��ȯ�ϴ� �Լ�
-- RPAD(char1, n [,char2]) :                         "                                 "     �����ʿ���   "      
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

-- �����ϰ����ϴ� ���� [,char2] ������ �⺻������ ���鹮�� �� ���� ���ȴ�.
-- LTRIM(char1 [,char2]) : ���ʿ���~ char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ
[����3-12]
SELECT  '[' || LTRIM('   ABCDEFG   ') || ']' LTRIM1,
        '[' || LTRIM('   ABCDEFG   ',' ') || ']' LTRIM2,
        LTRIM('ABCDEFG', 'AB') LTRIM3,
        LTRIM('ABCDEFG', 'BA') LTRIM4,
        LTRIM('ABCDEFG', 'BC') LTRIM5
FROM    dual;


-- RTRIM(char1 [,char2]) : �����ʿ��� char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ
[����3-12]
SELECT  '[' || RTRIM('   ABCDEFG   ') || ']' RTRIM1,
        '[' || RTRIM('   ABCDEFG   ',' ') || ']' RTRIM2,
        RTRIM('ABCDEFG', 'FG') RTRIM3,
        RTRIM('ABCDEFG', 'GF') RTRIM4,
        RTRIM('ABCDEFG', 'BC') RTRIM5
FROM    dual;

-- TRIM() : ������ ��,��,���ʿ���~ char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ
-- ���ʿ��� �����Ҷ��� LEADING
-- �����ʿ��� �����Ҷ��� TRAILING
-- ���ʿ��� �����Ҷ��� BOTH , ����Ʈ��(=��������)
-- ������ ������ ����Ʈ���� ���� �� ���� ���ȴ�.

[����3-14]
SELECT '[' || TRIM('   ABCDEFG   ') || ']' T1, -- BOTH : ����/������(=����)���� (����Ʈ)��������
        TRIM(LEADING 'A' FROM 'ABCDEFG') T2, -- LEADING: ���ʿ��� (�����ʹ�������)
        TRIM(TRAILING 'G' FROM 'ABCDEFG') T3, -- TRAILING : ���������� (��������)
        TRIM(BOTH 'A' FROM 'ABCDAEFAGA') T4, -- BOTH ��� 
        TRIM('A' FROM 'ABCDEFG') T5 -- ������ DEFAULT
FROM    dual;        


-- SUBSTR(char, position [,length]) : ���ڿ��� �Ϻθ� �и�(=����)�ؼ� ��ȯ�Ѵ�. �ڡ�
-- char ���ڿ��� position ���� ������ ��ġ�κ��� length���� ���ڸ� ����� �� ����� ��ȯ�Ѵ�.
-- length ������ : position ���� ���ڿ��� ������ ��ȯ
-- position ���� 0���� ����� ���, ����Ʈ�� 1�� ����Ǿ� ù��° �ڸ����� length ��ŭ�� ���ڿ��� ��ȯ�Ѵ�.
[����3-15]
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
-- position�� ���� ������ �ۼ��ϸ�, �� ��ġ�� �����ʺ��� ���۵ȴ�.
-- =========================================================
SELECT  SUBSTR('You are not alone', -9, 3) STR1,
        SUBSTR('You are not alone', -5) STR2,
        SUBSTR('You are not alone', 0, 5) STR3,
        SUBSTR('You are not alone', -1, 5) || ']' STR4        
FROM    dual;        


-- REPLACE(char, search_string [,replace_string])
-- ���ڿ��� �Ϻθ� �ٸ� ���ڿ��� �����Ͽ�, �� ����� ��ȯ�Ѵ�.
-- XSS(Cross site script) ��ŷ ���� --> �˻��ϴ� ����, ���� ������� �Է��� �޴� ���񽺸� �����Ҷ� ����ȭ�ϴ� ��������
-- ����Ҽ��� �ְ�, �� �״�� ���ڿ� �Ϻθ� �ٸ� ���ڷ� ġȯ�� �� ����
-- ���ڿ��� ��,�ҹ��ڸ� ����  vs  SQL ��ü�� ��ҹ��ڸ� �������� �ʴ´�.

SELECT  REPLACE('You are not alone', 'You', 'We') REP1,
        REPLACE('You are not alone', 'not') || ']' REP2,
        REPLACE('You are not alone', 'not', null)  || ']' REP3
FROM    dual;

-- TRANSLATE(char, from_string, to_string)
-- char ���ڿ����� �ش繮�ڸ� ã�� 1:1�� ��ȯ�� ����� ��ȯ�Ѵ�.
[����3-18]
SELECT TRANSLATE('u! You are not alone', 'You', 'We') TRANS
FROM    dual;


-- Quiz. '�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���' �� REPLACE�� TRANSLATE�� ��ȯ�Ͽ� ������ ���� �����غ�����
-- 1.REPLACE �Լ��� ��� --> ���� ���� �𸣴µ� ���� ���� �˰ڴ���
SELECT  REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��') REP -- '��'�� '��'�� ����
FROM    dual;

-- 2.TRANSLATE �Լ��� ��� --> ���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ³�
SELECT  TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '�ʳ�', '����') TRANS
FROM    dual;

-- ����
SELECT  REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��') REP,
        TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '�ʳ�', '����') TRANS
FROM    dual;



-- INSTR(char, search_string [,position] [,_th]) �ڡ�
-- ���ڿ����� Ư�� ���ڿ��� ���� ��ġ�� ��ȯ�ϴ� �Լ�
-- char �� ��� ���ڿ�, search_string�� ã�� ���ڿ�
-- position�� ���ڿ��� ã�� ������ġ, _th�� ���° ������ ��� (��, ������ ����Ʈ���� 1)
-- ã�� ���ڿ��� �߰ߵ��� ������ 0�� ��ȯ�Ѵ�.

[����3-19]
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

-- �ڽ��� �̸��� �ּҸ� �̿��ؼ� @�� ��ġ�� INSTR() ���� ã��, SUBSTR() ����
-- EMAIL ID, EMAIL DOMAIN�� �и��� ������!
-- �� EXMPLOYEES ���̺��� EMAIL �� ������, @domain.com�� �����Ƿ�, �̸��� ���̵� ��� ���� ��!
-- email || '@naver.com' EMAIL_ADDR ��ȸ�� �� ����

SELECT  'oracle21c12312312312@kakao.com' EMAIL_ADDR,
        SUBSTR('oracle21c12312312312@kakao.com', 1, INSTR('oracle21c12312312312@kakao.com','@')-1) EAMIL_ID,
        '@' DIVIDER,
        SUBSTR('oracle21c12312312312@kakao.com', INSTR('oracle21c12312312312@kakao.com','@')+1) EAMIL_DOMAIN
FROM    dual;        

SELECT employee_id, first_name, LOWER(TRANSLATE(email, 'akn','*!')) || '@oracle.com' email
FROM    employees;

-- LENGTH(char) vs LENGTHB(char)
-- ���ڿ��� ���̸� ��ȯ�մϴ�. vs ���ڿ��� BYTE ���� ��ȯ�մϴ�.
-- ���� 1�ڴ� 1BYTE, ���ƽþ�(��,��,��) ������ 1���ڴ� 3~4BYTE�� �����ǹǷ� ���� DB ����� �������, �÷��� ���ǽ�
-- �����Ϳ� ���� ���̵��� �����Ҷ� ����


-- 3.3 ��¥�Լ�
-- ��¥�� �ð��� ������ ������� �ϴ� �Լ�

SELECT  SYSDATE 
FROM    dual;
-- SYSDATE()�� �Լ� �ƴѰ�? �׸�ŭ ���� ����ϴ� �Լ��� �����ϰ� ǥ��

-- ��¥�� ���¸� Ȯ���ϴ� ���
SELECT *
FROM v$nls_parameters; 

-- RR/MM/DD HH:MI:SS�� ���¸� �ٲپ�� �ð������� ����
ALTER SESSION SET nls_date_format = 'RR/MM/DD HH:MI:SS'; -- ���� �α����� hr ��Ű������ �Ͻ������� �ٲٴ°����� �������� ���� ������ �ƴ�,

-- �Ź� �ð�/��¥ ������ ����ϱ� ���� ������ �ٲٴ� �� ���ٴ�,
-- �ð�/��¥ �Լ� �Ǵ� ��ȯ�Լ��� ����ϴ� ���� ����!!


-- ADD_MONTHS(date, n)
-- Ư�� ��¥�� ������ ������ ���� ���ؼ� �� ����� ��¥�� ��ȯ�ϴ� �Լ�
-- ADD : �߰�, MONTH : ��/����

SELECT  ADD_MONTHS(SYSDATE, 1) MONTH1,
        ADD_MONTHS(SYSDATE, 2) MONTH2,
        ADD_MONTHS(SYSDATE, -3) MONTH3
FROM    dual;        


-- MONTHS_BETWEEN(date1, date2)
-- �� ��¥ ������ ���� �� (=����)�� ��ȯ�ϴ� �Լ�
-- date1 - date2 (���� ��¥ - ���� ��¥)

[����3-22]
-- ��¥ ������, ���� �����ʹ� '' �� ��� ǥ��
-- RR/MM/DD
-- YYYY-MM-DD
SELECT  TRUNC(MONTHS_BETWEEN(SYSDATE, '2013-03-20')) || '����' PASSED,
        TRUNC(MONTHS_BETWEEN('2013-08-28', SYSDATE)) || '����' REMAINED
FROM    dual;

-- LAST_DAY(date)
-- date�� �ش��ϴ� ������ ��¥�� ��ȯ�Ѵ�.
-- ex> ��¥�� 3���� �ش��ϸ�, 31�� ��ȯ�ϰ� 4���̸� 30���� ��ȯ�Ѵ�.
[����3-23]
SELECT  LAST_DAY(SYSDATE) LAST1,
        LAST_DAY('2013-02-01') LAST2
FROM    dual;        

-- NEXT_DAY(date, char)
-- date ������ ��¥���� char�� ��õ� ù��° ���ڸ� ��ȯ
-- char�� ���Ͽ� �ش��ϴ� ���� SUNDAY, MONDAY,...�� ����� SUN, MON,..
-- �Ǵ� ���Ͽ� �ش��ϴ� ���� 1:�Ͽ���, 2:������, ..7:�����
-- v$nls_parameter �������� NLS_LANGUAGE, NLS_TERRIORY ����(�⺻���� KOREAN�̶� SUNDAY�� �Ͽ��� ������ ǥ��)
select *
from v$nls_parameters;

[����3-24]
SELECT  NEXT_DAY(SYSDATE, '������') NEXT1,
        NEXT_DAY(SYSDATE, '�ݿ���') NEXT2,
        NEXT_DAY(SYSDATE, '��') NEXT3,
        NEXT_DAY(SYSDATE, 4) NEXT4 -- 1:�Ͽ���, 2,3,4:������
FROM    dual;

-- ROUND(n [,i]) : -i�� ������, i�� �Ҽ��ο��� �ݿø��Ͽ� ��ȯ <�����Լ�>
-- ROUND(date, fmt) : �ݿø� �� ��¥�� fmt�� �°� �� ����� ��ȯ  <��¥�Լ�>
[����3-25]

-- �� Java ����ȯ(Casting) �Լ�ó�� ���, ORACLE������ �ѹ��� ���� --> ��¥�� ��ȯ �Ұ�, �ܰ������� ��ȯ�� ����!!

SELECT  ROUND(TO_DATE('2013-06-30'), 'YYYY') R1, -- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
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
from v$nls_parameters; -- ���ƽþ�(=�ѱ�)���� ��ġ�� �����ͺ��̽��� ������

select *
from nls_database_parameters; -- ���� ����Ŭ �����ͺ��̽� �⺻ ����

-- �� �������� (�ӽ�) ����
alter session set nls_language = 'KOREA'; -- ENGLISH 
alter session set nls_territory = 'KOREA'; -- AMERICA, ORA-12705
-- ENGLISH, AMIERICA ������ �����ϳ� ORA-01861 ���� �߻�
*/
select *
from employees
where department_id = :no;



-- 3.4 ��ȯ�Լ�(p.30)
-- TO_DATE() : ���ڸ� ��¥�� ��
-- TO_CHAR() : ���ڸ� ���ڷ� ��
-- TO_NUMBER() : ���ڸ� ���ڷ�
/*
            ���� --------->  ����  ---------> ��¥
TO_NUMBER() <---->      TO_CHAR()  <------>     TO_DATE()
            ����  <---------- ����  <-------- ��¥
*/


-- 3.4.1 TO_CHAR(date/n [,fmt]) : ����/��¥�� ���ڷ� ��ȯ�ϴ� �Լ�
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') CHAR1,
        TO_CHAR(SYSDATE, 'YYYY') CHAR2,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD') CHAR3
FROM dual; -- �ð����� ���x

SELECT TO_CHAR(TO_DATE('0630', 'MM/DD'), 'RRRR/MM/DD') CHAR --ROUND : �ݿø�
FROM dual;

SELECT TO_CHAR (TO_DATE('022017','MM/YYYY'), 'MM/YYYY')
FROM dual;



[���� 3-27]
-- �⺻ �����ͺ��̽� ȯ�漳�� : RR/MM/DD

SELECT TO_CHAR (SYSDATE, 'YYYY-MM-DD') FMT1,
       TO_CHAR (SYSDATE, 'RR-MM-DD HH:MI:SS') FMT2,
       TO_CHAR (SYSDATE, 'YY-MM-DD DAY') FMT3
FROM dual;


[���� 3-28]
SELECT TO_CHAR (12345, '9999999') NUM_FMT1,
       TO_CHAR (12345, '0999999') NUM_FMT2,
       TO_CHAR (123.45, '$99999.99') NUM_FMT3,
       TO_CHAR (12345, 'L9,999,999') NUM_FMT4
FROM dual;

SELECT EMPLOYEE_ID, LAST_NAME, TO_CHAR(SALARY * 12, '$9,999,999') "ANNUAL SALARY"
FROM EMPLOYEES
ORDER BY "ANNUAL SALARY" DESC;



--ALTER SESSION SET NLS_DATEFORMAT = 'RR/MM/DD HH24:MI:SS'; -- �Ź� ������ �����ذ��鼭? NO!


-- 3.5 NULL ���� �Լ�
-- NULL : ���� 0�� �ƴ϶�, �����Ͱ� NULL�� (=��, �Էµ��� ���� ����)

-- EX> ���ʽ��� ����Ѵٰ� ���� ��
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT,
       TO_CHAR(SALARY + SALARY * COMMISSION_PCT, '$9,999,999') BONUS
FROM EMPLOYEES

-- 3.5.1 NVL(expr1, expr2)
-- ù��° expr1�� NULL�̸� expr2�� ��ȯ�ϰ�
--     "        NULL�� �ƴϸ� expr1�� ��ȯ�ϴ� �Լ�

-- Ŀ�̼� �ݾ��� 1000�޷� �̸��� ����鿡�� ���ʽ��� �����ϰ��� �� ��, �̵��� ����� ��ȸ
[���� 3-31] ���, �̸�, �޿�, �ѹ̼���, Ŀ�̼� �ݾ��� ��ȸ
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT,
       COMMISSION_PCT * SALARY INCENTIVE
FROM EMPLOYEES
WHERE COMMISSION_PCT * SALARY < 1000


-- 3.5.1 NVL(expr1, expr2, expr3)


[���� 3-33] COMMISSION_PCT�� SALARY�� ���ؼ� �μ�Ƽ�긦 �����Ѵٰ� �g�� ��,
 COMMISSION_PCT�� NULL�̸� �� �޿��� SALARY��, NULL�� �ƴϸ� SALARY + �μ�Ƽ�갡 �� �޿��� �ȴ�.

SELECT EMPLOYEE_ID, LAST_NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       TO_CHAR (SALARY * NVL(COMMISSION_PCT, 0) '$9,999,999'), COMMISSION_PCT,
       NVL2 (COMMISSION_PCT,
       TO_CHAR(SALARY * (1 + COMMISSION_PCT), '$9,999,999'),
       TO_CHAR(SALARY, '$9,999,999')) TOTAL_SALARY
FROM EMPLOYEES


-- 3.5.3 COALESCE(exp1,exp2,exp3...)
-- �Լ��� �Ķ���� ��Ͽ��� ó������ NULL�� �ƴѰ��� ��ȯ�ϴ� �Լ�
-- ���� �Ķ���� ��Ͽ��� �ݵ�� NULL �ƴ� ���� �־�� ��
-- ���� ��� NULL�̶�� NULL ��ȯ�ϴ� �Լ�

[���� 3-35]
SELECT COALESCE ('A', 'B', 'C', NULL) FIRST,
       COALESCE (NULL, 'B', 'C') SECOND,
       COALESCE (NULL, NULL, 'C') THIRD
FROM DUAL


-- COALESCE �ǽ��� ���̺��� ����
CREATE TABLE CONTACT (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    HOME_NUM CHAR(11),
    PHONE_NUM CHAR(11),
    OFFICE_NUM CHAR(11)
);

-- �ǽ��� ���� ������ ����
INSERT INTO CONTACT
VALUES (1, 'ȫ�浿', '0623456789', NULL, NULL);
INSERT INTO CONTACT
VALUES (2, '�̼���', NULL, '0103456789', NULL);
INSERT INTO CONTACT
VALUES (3, 'ȫ�α�', NULL, NULL, '0612223333');
INSERT INTO CONTACT
VALUES (4, '�ϴ�', '0107778888', NULL, '0612223333');

--��ȸ
SELECT *
FROM CONTACT

-- COALESCE ���
SELECT ID, NAME, COALESCE(HOME_NUM, PHONE_NUM, OFFICE_NUM) TEL
FROM CONTACT



-- [�������� 3-4]
-- 1. ����� ���, �̸�, �μ�, �Ŵ��� ��ȣ�� ��ȸ
-- ��, �Ŵ����� �ִ� ����� MANAGER�� ǥ��, �Ŵ����� ���� ����� NO MANAGER��� ǥ��
-- �Ŵ����� ��� �� �ϳ�, ���常 �Ŵ����� ����.
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, DEPARTMENT_ID,
       NVL2(MANAGER_ID, 'MANAGER', 'NO MANAGER') MANAGER
FROM EMPLOYEES
--WHERE MANAGER_ID IS NOT NULL
ORDER BY EMPLOYEE_ID




-- 3.6 DECODE�� CASE
-- SQL / ����ȭ �� ���Ǿ�  VS ���α׷��� ��� / �������� ���
-- ���α׷��� ������ ������ ���� ����� �����ϴ� IF�� ���. ����Ŭ������ DECODE�� CASE�� ���� ����

-- IF ~ ELSE IF ������ ����

[���� 3-36] ���ʽ� ���޿� �־ 20�� �μ��� �޿��� 20%�� ���ʽ��� ����,
           30�� �μ��� �޿��� 30%��, 40�� �μ��� �޿��� 40%�� ���ʽ��� ����
           �׿��� �μ��� ���ʽ��� �������� �ʴ´ٰ� �� ��, �� �μ��� ���ʽ��� ���޹޴� ������� ������ ��ȸ
           
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY,
       DECODE(DEPARTMENT_ID, 20, SALARY *0.2,
                             30, SALARY *0.3,
                             40, SALARY *0.4,
                             0) BONUS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID


-- 3.6.2 CASE
-- �Լ����� �� ū ������ ���� ǥ����
-- DECODE�� ��� �񱳸� �����ѵ�, CASE�� �� �پ��� ����(�����, ������,...)�� �� �� �ִ�
-- 1) DECODE�� ���� �����
CASE exp WHEN search1 THEN result1
         WHEN search2 THEN result2
         ... ��� ...
         [ELSE default]
END

-- 2)DECODE�� �ٸ��� ���Ǻ�
CASE WHEN condition1(exp, operater) THEN result1
     WHEN condition2(exp, operater) THEN result2
     ... ��� ...
     [ELSE default]
END

-- 30�� �̸� �μ��� �޿��� 10%�� ���ʽ��� �����ϰ� 30�� ���� 50�� ������ �޿��� 20%��, 60�� ���� 80�� ������ �޿��� 30%��
-- �� ���� �μ��� �޿��� 40%�� ���ʽ��� �����ϰ��� �� ��

SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY,
       case WHEN DEPARTMENT_ID < 30 THEN SALARY *0.1
            WHEN DEPARTMENT_ID BETWEEN 30 AND 50 THEN SALARY *0.2
            WHEN DEPARTMENT_ID BETWEEN 60 AND 80 THEN SALARY *0.3
            ELSE SALARY *0.3 
            END BONUS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID














