--[��������5-2]
--
--1. ����� 110, 130, 150�� �ش��ϴ� ����� ���, �̸�, �μ����� ��ȸ�Ͻÿ�
--     [�Ϲ�����]                               [����]

-- 1-1. ����Ŭ ����
SELECT  e.employee_id, e.first_name, 
        d.department_name
FROM    employees e, departments d        
WHERE   e.department_id = d.department_id
AND     e.employee_id IN (110, 130, 150)
ORDER BY 1;

-- 1-2. ANSI ����
SELECT  e.employee_id, e.first_name, 
        d.department_name
--FROM    employees e JOIN departments d        
FROM    employees e INNER JOIN departments d        
ON      e.department_id = d.department_id
AND     e.employee_id IN (110, 130, 150)
ORDER BY 1;

2. ��� ����� ���, �̸�, �μ���, �����ڵ�, ���������� ��ȸ�Ͻÿ�
-- 2-1. ����Ŭ ����
SELECT  e.employee_id, e.first_name, 
        d.department_name,
        j.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)
AND     e.job_id = j.job_id(+)
AND     e.manager_id IS NOT NULL
ORDER BY 1;

-- 2-2. ANSI ���� 
SELECT  e.employee_id, e.first_name, 
        d.department_name,
        j.job_id, j.job_title
FROM    employees e LEFT OUTER JOIN departments d
ON      e.department_id = d.department_id
LEFT OUTER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   e.manager_id IS NOT NULL
ORDER BY 1;



















