-- DESC ���̺��

-- SELECT �÷�1, �÷�2 FROM ���̺�












 
/* -----------------------------------
    �������� �����ϴ� �׹��� �з�    
--------------------------------------*/ 

1) �÷�, ����, ����
2) ��������� : +, -, *, /, �񱳿����� : =, <, >, <=, >=, !=, <>, (����)���� ������ : 
3) AND, OR, NOT : �� ������
4) LIKE, IN, BETWEEN, EXISTS, NOT
5) IS NULL, IS NOT NULL
6) ANY, SOME, ALL
7) �Լ�(� �۾��� �����ϴ� ��ɾ��� ����) (VS ���ν���)


2.3 ������
2.3.1 ��������� : +, -, *, /
SELECT 2+2. 2-1, 2*3, 4/2
FROM dual -- dual : ��¥ ���̺� (���� �������� �ʴ� ������ ���̺��� dual�� ����ó��)

[���� 2-4] 80�� �μ� ����� �� �� ���� ���� �޿�(����)�� ��ȸ�Ͻÿ�
-- ����� ������ EMPLOYEES��� ���̺� ����Ǿ� ����
-- ����� �ٹ��ϴ� �μ��� ������ DEPARTMENTS��� ���̺� ����Ǿ� ����
SELECT employee_id, LAST_NAME, salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

SELECT DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 80;

[���� 2-5] (��ü ����� ��) �� �� ���� ���� �޿��� 12000�� ����� ��ȸ�Ͻÿ�

SELECT *
FROM EMPLOYEES
WHERE 





















