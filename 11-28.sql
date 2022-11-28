5.6 ANSI JOIN (p.48)
-- ANSI : ����ǥ�� ��ȸ�� �̱����� ��ǰ, ����, ����, �ý���, �η°��� �о߿��� ǥ���� �����ϴ� ���� �����ϴ� �񿵸� �ΰ� �ⱸ
-- JOIN ���� : ���̺�� ���̺��� ���踦 �̿��ؼ� �ٸ� ���̺��� �����͸� ���� ���̺� �����ؼ� ��ȸ�ϴ� ���
-- WHY? �������� �ߺ��� ����(=����ȭ) ȿ�������� �����ϱ� ���� RDBMS�� Ư��
-- IF? ��� �����Ͱ� �ϳ��� ���̺� �����Ѵٸ�? JOIN �ʿ������~ DBMS ������ �̷��� ������� ����.

5.6.1 (Oracle JOIN) JOIN
-- Cartesian Product : ī�׽þ� ��(=JOIN�ϴ� ���̺��� ���� rows �� ��ŭ  ���� ����� , �߸���)
-- EQUI-JOIN  vs  NON-EQUI JOIN (���� ��� ����)
-- OUTER JOIN  (vs INNER JOIN-���� ����x �����)
5.6.2 (��� DBMS����) JOIN - ���� ǥ�� JOIN ����
�� ORACLE�� ������� ȸ�翡 ������ mariaDB ��� �ϸ� ���Ӱ� mariaDB�� ����� �ұ�? ��κ� ���������, �� DBMS ��������
������ Ư���� �ְ�..JOIN�� ǥ������
-- INNER JOIN : ����Ŭ�� EQUI-JOIN�� ���� ����� �ϴ� JOIN ���� 
-- 1) FROM ���� INNER JOIN�� ���
-- 2) JOIN ������ ON ���� ���

-- ����Ŭ ����
[����5-12] ����� ���, �̸�, �μ��ڵ�, �μ��� ������ ��ȸ�Ͻÿ�
SELECT  e.employee_id, e.first_name, e.department_id,
        d.department_name
FROM    employees e, departments d     
WHERE   e.department_id = d.department_id(+) -- OUTER
AND     e.manager_id IS NOT NULL
ORDER BY 1;

-- ANSI > INNER JOIN  vs  OUTER JOIN
-- ==================================================
-- WHERE ���� �Ϲ� ������ ON, USING�� ������ ǥ���Ѵ�
-- JOIN ���ǿ� ����ϴ� �÷����� ���� ��� ON ��� USING�� ����Ѵ�.
-- USING�� ����ϸ� �ĺ���(=Alias)�� ����� �� ����.
-- ==================================================

SELECT  e.employee_id, e.first_name, department_id,  -- USING(1)
        d.department_name
FROM    employees e INNER JOIN departments d     
--ON      e.department_id = d.department_id
USING   (department_id)                              -- USING(2)
WHERE   e.manager_id IS NOT NULL
ORDER BY 1;


-- ========================================================================================
-- JOIN�� ����ϴ� ���̺��� 3�� �̻��� ���, ù��° JOIN ����� �ι�° JOIN�� �߰��ϴ� ����
-- ========================================================================================
[���� 5-15] (���)����� ���, �̸�, �μ��ڵ�, �μ���, ��ġ�ڵ�, ������ �̸��� ��ȸ�Ͻÿ�
-- employees
-- departments
-- locations

SELECT  e.employee_id, e.first_name, e.department_id,
        d.department_name, l.location_id,
        l.city
FROM    employees e INNER JOIN departments d
ON   e.department_id = d.department_id
INNER JOIN locations l
ON     d.location_id = l.location_id
ORDER BY 1;

-- ON�� USING ����
SELECT  e.employee_id, e.first_name, department_id,
        d.department_name, location_id,
        l.city
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN locations l
USING    (location_id)
ORDER BY 1;





-- OUTER JOIN [LEFT | RIGHT | FULL��] : OUTER (�������� NULL �� �ִ°��� �ݴ�)
-- ����Ŭ ���� > OUTER JOIN�� (+)�� ���
-- ANSI ���� > OUTER JOIN�� ���ڷ� [����] OUTER JOIN
-- FROM ���� [LEFT|RIGHT|FULL]�� ����ϰ�, JOIN ������ ON���� ���

[����5-16] ����� ���, �̸�, �μ��ڵ�, �μ��� ������ ��ȸ�Ѵ�.
-- ����Ŭ ���� > OUTER JOIN
SELECT  e.employee_id, e.first_name, e.department_id,
        d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
AND     e.manager_id IS NOT NULL
ORDER BY 1;

-- ANSI ���� > OUTER JOIN
SELECT  e.employee_id, e.first_name, department_id,
        d.department_name
--FROM    employees e LEFT OUTER JOIN departments d
--FROM    departments d RIGHT OUTER JOIN employees e
FROM    employees e FULL OUTER JOIN departments d   -- ������ ���� �����ϰ� ������ ������ ���� ��ȸ
--ON      e.department_id = d.department_id
USING   (department_id)
WHERE   e.manager_id IS NOT NULL
ORDER BY 1;






