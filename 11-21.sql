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


-- ��ҹ��� �Լ�
-- INITCAP(CHAR) : �Ķ���ͷ� ���� ���ĺ� �ܾ��� ù���ڸ� �빮�ڷ� �Ͽ� ��ȯ�ϴ� �Լ�
-- UPFER(CHAR) : �Ķ���ͷ� ���� ���ĺ� ��θ� �빮�ڷ� �Ͽ� ��ȯ�ϴ� �Լ�
-- LOWER(CHAR) : �Ķ���ͷ� ���� ���ĺ� ��θ� �ҹ��ڷ� �Ͽ� ��ȯ�ϴ� �Լ�


-- LPAD, RPAD (CHAR1, )
-- LEFT RIGHT
-- PAD


-- �����ϰ����ϴ� ���� [, CHAR2] ������ �⺻������ ���鹮�� �Ѱ��� ���ȴ�.
-- LTRIM (CHAR1 [, CHAR2]) : ���ʿ���~ CHAR1���� CHAR2�� ������ ���ڸ� ������ ����� ��ȯ
-- RTRIM (CHAR [, CHAR2]) : �����ʿ��� CHAR1���� CHAR2�� ������ ���ڸ� ������ ����� ��ȯ
-- TRIM : �¿� �� �ʿ��� CHAR1���� CHAR2�� ������ ���ڸ� ������ ����� ��ȯ






-- 3.3 ��¥�Լ�
-- 3.4 ��ȯ�Լ�
-- 3.5 NULL ���� �Լ�
-- 3.6 desode�� case







