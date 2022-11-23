[�������� 3-3]
-- 1. ��� ���̺��� 30�� �μ����� ���, ����, �޿�, �ٹ� �������� ��ȸ�Ͻÿ�
-- ��, �ٹ� �������� ���� ��¥�� �������� ��¥�Լ��� ����Ͽ� ���
-- ADD_MONTHS (DATE, n) : n���� ���� ���ϰų� �� ��¥�� �˷��ִ� �Լ�
-- MONTHS_BETWEEN(DATE1, DATE2) : DATE1���� DATE2�� �� �������� ��ȯ�ϴ� �Լ�
-- ������� �ٹ� ���� ������ : HIRE_DATE 
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "�ٹ� ������",
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) "�ټ� ���"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
ORDER BY 1;


-- 2. �޿��� 12000 �޷� �̻��� ����� ���, ����, �޿��� ��ȸ�Ͽ� �޿� ������ ����� �����Ͻÿ�
-- ��, �޿��� õ���� ���б�ȣ�� ����Ͽ� ǥ��
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME,
       TO_CHAR(SALARY, '$9,999,999') SALARY,
       DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE SALARY >= 12000
ORDER BY 3;

-- 3. 2005�� ������ �Ի��� ������� ���, ����, �Ի���, ���� ���� ������ ��ȸ�Ͻÿ�
-- ��, ���� ���� �����̶� �Ի��Ͽ� �ش��ϴ� ������ ��Ī�Ѵ�
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE,
       TO_CHAR(HIRE_DATE, 'DAY') �������ۿ���
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2005'

















































