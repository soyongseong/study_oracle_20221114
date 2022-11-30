[��������6-2]

1. �μ� ��ġ�ڵ尡 1700�� �ش��ϴ� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� ��������
������ ���������� �ۼ��Ͻÿ�
-- �þ�Ʋ�� �ٹ��ϴ� ����� ����
SELECT department_id, department_name
FROM    departments
WHERE   location_id = 1700; --

SELECT  city
FROM    locations
WHERE   location_id = 1700; -- Seattle


SELECT employee_id, first_name, department_id, job_id
FROM   employees
WHERE  department_id IN ( SELECT department_id
                          FROM  departments
                          WHERE location_id = 1700 )
ORDER BY 1; -- 18 rows



2. �μ����� ���� �޿��� ���� �޴� ����� ���, �̸�, �μ���ȣ, �޿�, �����ڵ带 ��ȸ�ϴ� 
�������� �����÷� ���������� �ۼ��Ͻÿ�
SELECT employee_id, first_name, department_id, salary, job_id
FROM   employees
WHERE   (department_id, salary) IN ( SELECT department_id, MAX(salary)
                                     FROM    employees
                                     GROUP BY department_id ); -- 11 rows


SELECT department_id, MAX(salary)
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;




