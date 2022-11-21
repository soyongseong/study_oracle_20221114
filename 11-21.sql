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
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC









