-- 2�� ������ ��ȸ ����
/*
DML : SELECT, INSERT, 


*/

-- SELECT ���� (�⺻ : )
SELECT �÷�1, �÷�2;
FROM ���̺��;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES;

-- SELECT ���� + ������ (=���͸�) : Ư�� ���ǿ� �´� �����͸� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID  -- SELECT ��
FROM EMPLOYEES                                 -- FROM ��
WHERE DEPARTMENT_ID = 100;                     -- WHERE (����)��

-- �ڵ� ���� ���� :
-- TAB ���� ���!

[���� 2-11] ���� King�� ����� ������ ��ȸ�Ͻÿ�
-- ����� ���� : ���, �̸�, ��, ��ȭ��ȣ, �μ�... ��
-- LAST_NAME�� King���� ��

SELECT EMPLOYEE_ID ���, LAST_NAME ��, DEPARTMENT_ID �μ�
FROM EMPLOYEES
WHERE LAST_NAME = 'King';  
-- SQL�� (��ɾ�)��ҹ��ڸ� �������� ������, (���ڰ�)���ڵ����ʹ� ������ (���� ã�����Ͽ� King�� �����ϳ� king�̳� KING�� �� ��)




[���� 2-12] �Ի����� 2004�� 1�� 1�� ������ ����� ����(=���, �̸�, �Ի���.. ��)

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < '2004.1.1'

-- �����ͺ��̽� ���� ����
-- NLS : ����, �� ���� ����
-- 1. NLS ���� Ȯ��
SELECT *
FROM v$nls_parameters;
-- 2. sqlDeveloper > ���� > ȯ�漳�� > �����ͺ��̽� > NLS�� Ȯ��

2.3.4 AND, OR, NOT ������ ������
-- �������� ������ ���� ��� �ʿ��� ������
-- 1) AND ������ ������ ��� TRUE�� �� ���� TRUE�� ��ȯ

[���� 2-13] 30�� �μ� �� ����� �޿��� 10000 �����̸鼭 2005�� ������ �Ի��� ����� ������ ��ȸ�Ͻÿ�
(���⼭ ������ ���, �̸�, �޿�, �μ��ڵ�)
--SQL(����ȭ�� ���� ��� <-----> ����)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 30  -- ù��° ����
AND SALARY <= 10000     -- ù��° ����
AND HIRE_DATE < '05/1/1';

-- DEN�̶�� ����� ������ �߰� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 114

-- 2) OR ������ ������ �ϳ��� TRUE�� �� ���� TRUE�� ��ȯ
[���� 2-15] 30�� �λ糪 60�� �μ��� ���� ����� ������ ��ȸ�Ͻÿ�

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
OR DEPARTMENT_ID =60















