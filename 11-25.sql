-- 5��. JOIN (����)
-- ���� ���̺��� �����Ͽ� �����͸� ��ȸ�ϴ� ����� JOIN
-- I. ����Ŭ ����(<--> OLD JOIN)

-- 5.1 Cartesian Product (ī�׽þ� ���δ�Ʈ)
-- [JOIN ������ �ۼ����� �ʾ�����] �߸��� ����� �߻��ϴ� ����

SELECT  employee_id, first_name, last_name, salary, department_id
FROM    employees; -- 107 rows

SELECT  *
FROM    departments; -- 27 rows

SELECT 107 * 27
FROM    dual; -- 2889 = 107 x 27 rows

-- ������� ���� + �μ��̸� �Բ� ��ȸ
--    (��)         (��)
--  ���̺� ���� ����� �÷�

SELECT  employee_id, last_name, 
        department_name
FROM    employees, departments -- ���̺� 2�� �̻��� ����ؼ� �����͸� ��ȸ�Ҷ�, JOIN
WHERE   employees.department_id = departments.department_id;

-- JOIN ������ ������, �������̺��� �����ؼ� � �����͸� ��ȸ�Ҽ� �ִ��� �̸� ������� �並 Ȯ���غ��ô�.
SELECT *
FROM    emp_details_view;


-- ���̺� ALIAS�� ����Ͽ�, �������� �ܼ�ȭ���� �������� ���δ�.
SELECT  e.employee_id, e.last_name, 
        d.department_name
FROM    employees e, departments d -- ���̺� 2�� �̻��� ����ؼ� �����͸� ��ȸ�Ҷ�, JOIN
WHERE   e.department_id = d.department_id;



5.2 EQUI-JOIN  (  vs   NON-EQUI JOIN)
-- ���� �����ڸ� ����ϴ� JOIN ���� <--> ���� JOIN
-- JOIN ������ ���� ���� ���� �÷��� ����  ���̺��.�÷��� = ���̺��.�÷���  ������ ����Ѵ�.
-- ��������   vs   �ܺ�����

[����5.3] employees, departments ���̺��� �̿��Ͽ� ���, �̸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�
SELECT  e.employee_id, e.first_name, 
        d.department_name,
        j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
ORDER BY 1;

-- =====================================================
--  JOIN �ϴ� ��� ���̺��� �߰��Ǹ�, JOIN ������ �߰��Ѵ�.
--  ex> JOIN �ϴ� ���̺��� 2�� ==> JOIN ������ 1��
--                "      3�� ==> JOIN ������ 2��
-- =====================================================

[����5-6] ����� 101���� ����� ���, �̸�, �޿��� �μ���, ���������� ��ȸ�Ͻÿ�
-- employees, departments : department_id
-- employees, jobs : job_id
SELECT  e.employee_id, e.first_name, e.salary, 
        d.department_name, 
        j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id -- ���� ����1
AND     e.job_id = j.job_id -- ���� ����2
AND     employee_id = 101; -- �Ϲ� ����

-- ������ �ִ� �����͸� ��ġ ���� �ϳ��� ������ ������ ó�� ��ȸ�ϴ� ��

ex> ����� 101���� ����� ���, �̸�, �޿��� �μ���, ��������, �μ��� ��ġ�� ���ø��� ��ȸ�Ͻÿ�
-- employees, departments, jobs + locations ���̺��� city_name �÷��� �߰��ؼ� ��ȸ
DESC locations;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
LOCATION_ID    NOT NULL NUMBER(4)    : ��ġ �ڵ�
STREET_ADDRESS          VARCHAR2(40) : �����ּ�
POSTAL_CODE             VARCHAR2(12) : �����ȣ
CITY           NOT NULL VARCHAR2(30) : ����(=�μ��� ��ġ�ϰ� �ִ� ������ �̸�)
STATE_PROVINCE          VARCHAR2(25) : ��(ex.����/����/�ϱ�..)
COUNTRY_ID              CHAR(2)      : ����/���� �ڵ�
*/


SELECT  e.employee_id, e.first_name, e.salary, 
        d.department_name, 
        j.job_title,
        l.city
FROM    employees e, departments d, jobs j, locations l, countries c, regions r
WHERE   e.department_id = d.department_id -- ���� ����1
AND     e.job_id = j.job_id -- ���� ����2
AND     d.location_id = l.location_id -- ���� ����3
AND     employee_id = 101; -- �Ϲ� ����



-- 5.3 NON-EQUI JOIN   vs  EQUI-JOIN
-- NON-EQUI JOIN: �񱳿�����, ����������, IN �����ڵ��� ����ϴ� JOIN�� ����
-- EQUI-JOIN : ���� ������(=)

DESC jobs;

[����5-7] ����� �޿��� �������̺��� �޿�(����) ������ ���� ���� �ִ� 10�� �μ����� ���, �̸�, �޿�, ���������� ��ȸ�ϴ� ������
�ۼ��Ͻÿ�
SELECT  e.employee_id, e.first_name, e.salary,
        j.job_title
FROM    employees e, jobs j
--WHERE   ���̺��(�Ǵ� ALIAS��).�÷��� = ���̺��(�Ǵ� ALIAS��).�÷��� -- EQUI-JOIN
WHERE   e.salary BETWEEN j.min_salary AND j.max_salary
AND     e.department_id = 10;

-- �μ��� ��� �� : �׷��Լ�, GROUP BY
SELECT department_id, COUNT(*) cnt
FROM    employees
GROUP BY department_id
ORDER BY 1;

-- ====================================================================
-- JOIN �ϴ� �÷��� ��ġ���� �ʰ� ����ϴ� JOIN ��������, ���� ������� �ʴ´�.
-- ====================================================================

-- JOIN : EQUI JOIN            vs  NON-EQUI JOIN (=���� ���x)
--        INNER JOIN(=��������) vs  OUTER JOIN(=�ܺ�����) ��
--        �÷��� �����Ͱ� NULL�϶� ���ڵ� ���� �޶���!! ==> ������ �����ͱ��� ���Խ�Ű�� ���~
-- ex> �����ڰ� ȸ���� �����ϴ� ���(=ȸ������ �޴� :  ���� ������ ȸ������ + Ż���� ȸ��)

-- 5.4 OUTER JOIN
-- EQUI-JOIN�� ���̺� ���� �÷��� �������� �����͸� ��ȸ�ϴµ�,
-- OUTER JOIN�� �����Ǵ� ���� ���� ���(=NULL ��) ������� ��ȯ�Ѵ�.
-- ex> ������̺�,�μ����̺��� ����ؼ� ����� ������ �μ��̸��� ����Ҷ�.
-- EQUI-JOIN�� ����Ҷ� : 106
-- �� �����Ǵ� ���� ���� (=NULL) ���̺� �÷��� (+) ��ȣ�� ǥ���Ѵ�. 
-- �������̺��� �ݴ��ʿ� (+)��ȣ�� ǥ���Ѵ�.
SELECT  e.employee_id, e.first_name, e.department_id, -- ����� ����
        d.department_name,
        j.job_title
FROM    employees e, departments d, jobs j, locations, cotur
WHERE   e.department_id = d.department_id(+)
AND     e.job_id = j.job_id(+)

ORDER BY 1; -- 106�� ���� �����Ͱ� ��ȸ��

SELECT *
FROM    employees
WHERE   department_id IS NULL; -- ������ ������ 1�� : Kimberely
      
SELECT COUNT(*) �����
FROM    employees; -- �� 107��


-- OUTER JOIN�� ����Ҷ� : 107

[����5-7] ��� ����� ���, �̸�, �޿�, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���������� ��ȸ�Ͻÿ�
-- �� ����� : 107��
SELECT  e.employee_id, e.first_name, e.salary, 
        d.department_name, 
        j.job_title,
        l.city
FROM    employees e, departments d, jobs j, locations l
WHERE   e.department_id = d.department_id(+) -- ���� ����1
AND     e.job_id = j.job_id(+) -- ���� ����2
AND     d.location_id = l.location_id(+) -- ���� ����3


-- ��������, OUTER-JOIN, ī�׽þ� ���δ�Ʈ... : �ĺ�����

-- 5.5 SELF JOIN : �ڱ����� ����
DESC employees;

-- ====================================================
-- �Ŵ����� '���'�̴�. �Ŵ��� ������ ��� ���̺� �ִ�.
-- ===================================================
-- ERP : ������ �ڿ� ���� �ý��� (�λ�, ����, ...)
-- id : identify (�ĺ��ϴ�) 
[����5-10] ��� ����� ���, ����� �̸�, �Ŵ����� ���, �Ŵ����� �̸��� ��ȸ�Ͻÿ�
--        e.employee_id, e.first_name, m.employee_id manager_id, m.first_name manger_name
SELECT  e.employee_id, e.first_name,
        m.employee_id manager_id, m.first_name manager_name
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id
AND     e.manager_id IS NOT NULL
ORDER BY    1;



SELECT employee_id, first_name, salary, manager_id
FROM    employees;



