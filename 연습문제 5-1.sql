[�������� 5-1]

1. �̸��� �ҹ��� v�� ���Ե� ��� ����� ���, �̸�, �μ����� ��ȸ
-- ��ҹ��� ����
-- EQUI-JOIN : ���� �����ڸ� �̿��� ����Ŭ ����(=���� ����)

SELECT e.employee_id, e.first_name, d.department_name
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  e.department_id = d.department_id
AND e.first_name LIKE '%v%'
ORDER BY 1


2. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼� �ݾ�, �μ����� ��ȸ
-- ��, Ŀ�̼� �ݾ��� ���޿��� ���� Ŀ�̼��� ��Ÿ����.  ->  SALARY * COMMISSION_PCT = COMMISSION

SELECT e.employee_id, e.first_name, e.salary, e.salary * E.COMMISSION_PCT BONUS,
       d.department_name
FROM EMPLOYEES E, DEPARTMENTS D
WHERE  e.department_id = d.department_id (+)
AND COMMISSION_PCT IS NOT NULL
ORDER BY 1


3. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, �������� ��ȸ�Ͻÿ�

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY,
       C.COUNTRY_ID, C.COUNTRY_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE d.location_id= L.LOCATION_ID
AND   L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY 1;


4. ����� ���, �̸�, �����ڵ�, �Ŵ����� ���, �Ŵ����� �̸�, �Ŵ����� �����ڵ带 ��ȸ
-- ����� ��� ������ ����

SELECT e.employee_id, e.first_name, E.JOB_ID,
       M.employee_id, M.first_name, M.JOB_ID
FROM   EMPLOYEES E, EMPLOYEES M
WHERE  e.MANAGER_ID = M.employee_id
AND    e.MANAGER_ID IS NOT NULL
ORDER BY 1


5. ��� ����� ���, �̸�, �μ���, ����, �ּ� ������ ��ȸ�Ͽ� ��� ������ ����

SELECT  e.employee_id, e.first_name, 
        d.department_name,
        l.city, l.street_address
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+)
AND     e.manager_id IS NOT NULL
ORDER BY 1














