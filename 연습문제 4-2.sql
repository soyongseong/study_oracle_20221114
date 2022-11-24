--[��������4-2]
--
--1. ��� ���̺��� Ŀ�̼��� �޴� ����� ��� �� ������ �� ���� ��ȸ�Ͻÿ�
-- COUNT() : �÷��� �����Ͱ� �ִ� ����, NULL ����
SELECT COUNT(commission_pct) cnt
FROM    employees; -- 35(��)
--
--
--2. ���� �ֱٿ� ���� ������ �Ի��Ű ��¥�� �������� �ֱ� �Ի����ڸ� ��ȸ�Ͻÿ�
-- MAX(hire_date) : ���� �ֱ� �Ի����� �Ի��� (=����)
-- MIN(hire_date) : ���� ������ �Ի����� �Ի��� (=����)
-- ��MAX(), MIN() : ��� ������ ������ ��밡���� �׷��Լ�
SELECT MAX(hire_date)
FROM    employees
WHERE   manager_id IS NOT NULL; -- 08/04/21

--
--3. 90�� �μ��� ��� �޿����� ��ȸ�Ͻÿ� (��, ��ձ޿����� �Ҽ� ��°�ڸ����� ǥ���Ͻÿ�)
SELECT  ROUND(AVG(salary), 2) avg_sal1,
        ROUND(SUM(salary) / COUNT(employee_id), 2) avg_sal2
FROM    employees
WHERE   department_id = 90; -- 19333.33
