[��������6-1]

--1. �޿��� ���� ���� ����� ���, �̸�, �μ��ڵ�, �޿��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
--��, �Ϲ������� ���������� ����� �ۼ��غ��ÿ�

SELECT MIN(salary)
FROM    employees; -- 2100$

SELECT employee_id, first_name, department_id, salary
FROM    employees
WHERE   salary = 2100; -- �Ϲ� ����, 1 rows

SELECT employee_id, first_name, department_id, salary
FROM    employees
WHERE   salary = ( SELECT MIN(salary)
                   FROM    employees ); -- �Ϲ� ����, 1 rows

2. �μ����� Marketing �� �μ��� ���� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�Ͻÿ�
SELECT  employee_id, first_name, department_id, job_id
FROM    employees
WHERE   department_id = ( SELECT department_id
                          FROM    departments
                          WHERE   department_name LIKE 'Marketing' );

desc employees;
desc departments; -- department_name : �μ���

SELECT department_id
FROM    departments
WHERE   department_name LIKE 'Marketing';


--3. ȸ���� ���庸�� �� ���� �Ի��� ������� ���, �̸�, �Ի����� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�
--(��, ������ �׸� �����ϴ� �Ŵ����� ���� ����̴�)
SELECT employee_id, first_name, hire_date
FROM    employees
WHERE   hire_date < ( SELECT hire_date
                      FROM    employees
                      WHERE manager_id IS NULL )
ORDER BY 1;                      




SELECT hire_date
FROM    employees
--WHERE manager_id IS NULL -- 03/06/17
ORDER BY 1;









