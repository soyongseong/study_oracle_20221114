-- P.9 �� ���� ������
-- 1. ���� NLS ���� Ȯ��

SELECT *
FROM v$nls_parameters;


-- AND, OR ȥ���Ͽ� ������ �ۼ�
[���� 2-16] 30�� �μ��� �޿��� 10000 �̸��� ����� 60�� �μ��� �޿��� 5000 �̻��� ��� ������ ��ȸ�Ͻÿ�

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 AND SALARY < 10000
OR    DEPARTMENT_ID = 60 AND SALARY >= 5000;

-- 60�� �μ��� ������ ��ȸ
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 60;


2.3.5 BETWEEN (���� ���� ������)
-- BETWEEN �ʱⰪ AND �������� : �ʱⰪ �̻�, ������ �� ����(= ���� ���Ե�)
-- WHERE ���� >= �� OR ���� <= ��

[���� 2-18] ����� 110���� 120�������� ��� ������ ��ȸ�Ͻÿ�
-- ����� 110, 111, 112... 120�� �ش��ϴ� ����帣�� ������ ��ȸ�Ѵ�. 

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 110
AND EMPLOYEE_ID <= 120

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 110 AND 120


[���� 2-19] ����� 110���� 120�������� ��� �� �޿��� 5000���� 10000 ������ ��� ������ ��ȸ�Ͻÿ�

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 110 AND 120
AND SALARY BETWEEN 5000 AND 10000


[���� 2-21] ����� 110�̸� 120�� �ʰ��� ����� ��� ������ ��ȸ�Ͻÿ�

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 110
OR EMPLOYEE_ID > 120;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT BETWEEN 110 AND 120


-- BETWEEN �̳� ���� �����ڷ� ���� �� �մ� ���� 1) ���� ������ 2) ���� ������ 3) ��¥ ������

[���� 2-23] �Ի����� 2005�� 1�� 1�� ���ĺ��� 2007�� 12�� 31�� ���̿� �Ի��� ����� ������ ��ȸ

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005.1.1' AND '2007.12.31'


-- �⺻ NLS �Ķ���� ����
SELECT *
FROM v$nls_parameters; --DATABASE ������ ��ȸ (��)

SELECT *
FROM nls_database_parameters; --DATABASE ������ ��ȸ (���̺�)

SELECT *
FROM epm_datails_view; --DATABASE ������ ��ȸ (���̺�)

-- ===== ����ȯ(casting) �Լ� =====
-- TO_DATE() : �(=����) �����͸� ��¥ �������� ��ȯ�ϴ� �Լ�
-- JAN : January, 1���� ��Ÿ���� ���� --> 01(��)�� �ٲٴ� �Լ�
-- TO_CHAR() � ���ڸ� ���ڷ� ���� ��ȯ�ϴ� �Լ�
-- �׹��� ���� �Լ����� ���� ������ ���� ���̴� ���� 3����
-- ==============================

SELECT TO_DATE ('RR-MM-DD')
FROM dual

2.3.5 IN ������
-- �������� �� �� ��ġ�ϴ� ���� �����ϴ� ���� ���ϴ� ������

[���� 2-25] 30�� �μ���, 60�� �μ���, 90�� �μ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
OR DEPARTMENT_ID = 60
OR DEPARTMENT_ID = 90

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 60, 90)


[���� 2-25] 30��, 60��, 90�� �̿��� �μ��� �Ҽӵ� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30, 60, 90)


2.3.6 LIKE ���� ������ (=���ڿ��� ������ ã�� ������)
-- Regular Expression : REGEXP (���Խ�, ����ǥ����)
-- �÷� ���� �߿��� Ư�� ���ڿ� ���Ͽ� ���ϴ� ���� ã�� ������
-- % : �������� ���ڿ��� ������
-- _ : �ϳ��� ���ڸ� ��Ÿ����


[���� 2-28] �̸��� K(���ڴ� ��ҹ��ڸ� ����)�� �����ϴ� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'K%' -- �ҹ��� 'k%'�� �� ��

[���� 2-30] �̸��� b�� ���� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%b%'

[���� 2-31] �̸����� ����° ���ڰ� B�� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE EMAIL LIKE '__B%'

[���� 2-31 ����] �̸����� �ڿ��� ����° ���ڰ� B�� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE EMAIL LIKE '%B__'


[���� 2-33] ��ȭ��ȣ�� 6���� �������� �ʴ� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE PHONE_NUMBER NOT LIKE '6%'

[���� 2-34] EMPLOYEES ���̺��� JOB_ID �÷��� _A�� ���Ե� ����� ������ ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE '%_A%'














