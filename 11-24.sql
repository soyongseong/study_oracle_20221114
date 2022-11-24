-- 4��. �׷��Լ�
-- �����Լ� : SUM, MIN, ...
-- �׷��Լ� : Group by 

-- 4.1 DISTINCT
-- �Լ��� �Լ��� () ����  VS  SYSDATE
-- hr ��Ű�� : ���� ���̺� �� EMPLOYEES ���̺��� ���� �� EMPLOYEE_ID�� �� �ĺ���
DESC EMPLOYEES;

-- ���̺��� ������� : �ĺ��� ��...
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEES'


-- PK (= Primary Key) : �� �ĺ���, �� Ű
-- FK (= Foreign Key, �ٸ� �̺����� PK�� �����ϴ� ���̺��� ����) : �ַ�Ű
-- NN (= NOT NULL) : ���� ������� ����
-- UK (=Unique Key) : �ߺ��� ������� ������ NULL �� ���
-- # PK = NN + UK (PK�� �ߺ��� NULL�� ������� ����)


[���� 4-1] ������� �Ҽӵ� �μ��� ��ȸ
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES

[���� 4-1] ������� �Ҽӵ� �μ��� ����� �Բ� ��ȸ
SELECT DISTINCT DEPARTMENT_ID, EMPLOYEE_ID
FROM EMPLOYEES

-- DISTINCT�� SELECT����� ��� �÷��� ����ȴ�
-- DISTINCT�� DEPARTMENT_ID�� EMPLOYEE_ID�� ��ȸ�ϸ� DEPARTMENT_ID�� EMPLOYEE_ID�� ������ ����� �ߺ����� �ʴ� �����͵��� ��ȸ���ش�

[���� 4-1] ������̺��� �� ȸ����� �Ŵ������� ��ȸ
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES
ORDER BY MANAGER_ID

-- �Ŵ��� ����
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (100, 101, 102, 103, 108, 114)



-- 4.2 �����Լ�
-- �Լ��� ���� : �ϳ��� ������� ��ȯ(COUNT, SUM �� ...)  VS  �������� ������� ��ȯ(DISTINCT)

-- 4.2.1 COUNT()
-- �������� ���� �� ���� �����ϴ��� ������ ��ȯ�ϴ� �Լ�
-- �������� ���� NULL�� ���� ���ܵȴ�
[����4-3]
SELECT  COUNT(*) cnt1, COUNT(employee_id) cnt2, COUNT(department_id) cnt3, 
        COUNT(DISTINCT department_id) cnt3
FROM    employees;


-- 4.2.2 SUM ()
-- ���� ������ �÷��� ��ü �հ踦 ����� ����� ��ȯ�ϴ� �Լ�
-- ����Ŭ ���� ������ ���� : NUMBER
-- # ����Ŭ���� INT�� DOUBLE, LONG ... ���� �ٸ� ���α׷��� �� ����ϸ�
-- ���������� �� NUMBER ���



[����4-4] ������� �޿� ��踦 ��ȸ�Ͻÿ�
SELECT COUNT(*) "�� �����", TO_CHAR(SUM(salary), '9,999,999') "�޿� �Ѱ�",
        TO_CHAR(ROUND(SUM(salary) / 107), '9,999,999') "1�δ� �޿� ���"
FROM    employees;

-- 4.2.3 MAX() �� MIN()
-- ������ �÷����� ���� ū ���� ��ȯ�ϴ� �Լ� : MAX()
--                "  ����       "        : MIN()
SELECT employee_id, last_name, MAX(salary), MIN(salary)
FROM    employees;
/* ���� : �����Լ��� �Բ� ����� �Ϲ� �÷��� group by ���� ����ؾ� ��
ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
00937. 00000 -  "not a single-group group function"
*/


SELECT MAX(salary), MIN(salary)
FROM    employees;

-- 4.2.4 AVG()
-- �÷��� ��հ��� ����ϴ� �Լ�
-- ���� ��� = �Ѱ� /  ���� ��

SELECT ROUND(AVG(salary)) ���, SUM(salary) �հ�, COUNT(employee_id) "�� �����"
FROM    employees;
















