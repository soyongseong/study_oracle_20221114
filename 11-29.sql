-- 6�� ��������
-- ���������� sql ���� �ȿ� �ִ� �Ǵٸ� sql������ ����
-- 1) ���������� ��ȣ�� ��� ���
-- 2) �������� : �������� : ()�� ���� ����


-- 6.1 ���� �� �������� : �������� ���� ����� �ϳ��� ��� ���� ��ȯ�ϴ� ��������
-- 6.2 ���� �� �������� :          "       ��������        "
-- 6.3 ���� �÷� �������� :         "       �� �̻���        "
-- 6.4 ��ȣ ���� �������� : ���� ���� �÷��� ���������� �������� ���Ǵ� ��������
-- 6.5 ��Į�� �������� : select ���� ���
-- 6.6 �ζ��� �������� : from ���� ���

-- �� ���������� ���� �� �� ����, (���� WHERE ���� �ۼ�)
-- �� ���������� ��� �۾� ó���� ����! �������) ó���ӵ� ������ ȿ����, �ǹ����� ���������� ���!

[����6-1] ��� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, ���� ��ȸ�Ͻÿ�

-- 1) ���������� �ۼ��Ѵٸ�?
-- 1-1) ��� �޿��� �˾ƺ���
SELECT  ROUND(AVG(salary)) avg_sal
FROM    employees; -- 6,462$

-- 1-2) ��� �޿����� ���� �޿��� �޴� ������� ������ �˾ƺ���
SELECT employee_id, first_name, last_name
FROM    employees
WHERE   salary <= 6462
ORDER BY 1; -- 56 rows

-- 2) ���������� �ۼ��Ѵٸ�? [SQL �ȿ� ��� ��ġ�� �ü� �ִ� �Ǵٸ� () ���� SQL]
SELECT employee_id, first_name, last_name
FROM    employees
WHERE   salary <= ( SELECT  ROUND(AVG(salary))
                    FROM    employees )
ORDER BY 1; -- 56 rows

-- �Ϲ������� ����� ���ϰ� ���������� ����!!


-- 6.1 ���� �� �������� 
-- ���� �� ������(=, >, >=, <, <=, <>, != ) �� �Բ� ����Ѵ�.
-- ������� �ϳ��̹Ƿ� �׷� �Լ� COUNT(), SUM(), AVG(), MAX(), MIN() �� ����ϴ� ��찡 ����
[����6-2] �� �޿��� ���� ���� ����� ���, �̸�, �� ������ ��ȸ�Ͻÿ�

-- 1) ���޿� �ְ�ݾ��� ���غ��� <---> ���޿� �����ݾ�
SELECT MAX(salary)                 -- MIN(salary)
FROM    employees; -- 24000$

-- 2) ���޿� �ִ�ġ�� ���� �޿��� �޴� ����� ������ ��ȸ
SELECT  employee_id, first_name, last_name, salary
FROM    employees
WHERE   salary = 24000;

-- ���������� �ٲپ� ǥ���Ѵٸ�?
SELECT  employee_id, first_name, last_name, salary
FROM    employees
WHERE   salary = ( SELECT MAX(salary)
                   FROM    employees )
ORDER BY 1;                   


-- ���޿��� ���� ���� ����� ���, �̸�, �� ������ ��ȸ�Ͻÿ�
-- I. �Ϲ�����
SELECT  MIN(salary)
FROM    employees; -- 2100$

SELECT employee_id, first_name, last_name
FROM    employees
WHERE   salary = 2100;

-- II. ��������
SELECT employee_id, first_name, last_name
FROM    employees
WHERE   salary = ( SELECT  MIN(salary)
                   FROM    employees );
                   
[����6-3] ����� 108�� ����� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ��ȸ�Ͻÿ�
-- 108�� ����� �޿��� ��ȸ
SELECT  salary
FROM    employees
WHERE   employee_id = 108; -- 12,008$

-- �޿��� 12,008$ �� �ʰ��ϴ� ����� ������ ��ȸ
SELECT  employee_id, first_name, TO_CHAR(salary,'$99,999') salary
FROM    employees
WHERE   salary > 12008; -- 6 rows

-- ���������� ǥ���ϸ�
SELECT  employee_id, first_name, TO_CHAR(salary,'$99,999') salary
FROM    employees
WHERE   salary > ( SELECT  salary
                   FROM    employees
                   WHERE   employee_id = 108 ); -- 6 rows


[���� 6-4] �� �޿��� ���� ���� ����� ���, �̸�, ��, ���� ���� ������ ��ȸ�Ͻÿ�

-- ���޿� �ְ�ݾ�
SELECT MAX(salary)
FROM    employees; -- 24,000$

-- ���~�������� ���� : JOIN ���� + ��������
-- �� ���������� JOB_TITLE (JOBS ���̺� ����)
SELECT  e.employee_id, e.last_name, e.salary, 
        j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id -- ���� ������
AND     e.salary = ( SELECT MAX(salary)
                     FROM    employees );--�Ϲ� ������










