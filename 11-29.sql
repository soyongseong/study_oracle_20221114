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




-- 6.2 ���� �� (���� �÷�)�������� (p.53)
-- IN, NOT IN, ANY, ALL, EXISTS �� �Բ� ����Ѵ�.

-- 6.2.1 IN ������
-- �������� ���� �����Ҷ� ���
SELECT  employee_id, first_name, job_id
FROM    employees
--WHERE   department_id IN (10, 30, 50); -- �Ϲ��������� IN ������
WHERE   department_id = 10
OR  department_id = 30
OR  department_id = 50;

[����6-5] �ٹ���(=��ġ�ڵ�)�� ����(=UK) �μ��ڵ�, ��ġ�ڵ�, �μ��� ������ ��ȸ�Ͻÿ�
-- ���� �� ���������� �ذ�
SELECT  department_id, location_id, department_name
FROM    departments
WHERE   location_id IN ( SELECT location_id
                         FROM   locations
                         WHERE  country_id = 'UK' ); -- 40, 80�� �μ�

SELECT  *
FROM    departments
WHERE   location_id IN (2400, 2500, 2600);

SELECT  *
FROM    locations
WHERE   country_id = 'UK'; -- 2400, 2500, 2600�� location_id Ȯ��


-- �̱��� ��ġ�� �μ��� ����(�μ��ڵ�, �μ���, ��ġ�ڵ�)
SELECT *
FROM    locations
WHERE   country_id = 'US';

SELECT  department_id, location_id, department_name
FROM    departments
WHERE   location_id IN ( SELECT location_id
                         FROM   locations
                         WHERE  country_id = 'JP' ); -- 23 rows



-- 6.2.2 ANY ������
-- �������� ����� �� ��� �ϳ��� ���� �����ϸ� �Ǵ� ���� ��ȯ�Ѵ�.
[����6-6] 70�� �μ��� �ٹ��ϴ� �μ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�Ͻÿ�

SELECT  salary
FROM    employees
WHERE   department_id = 80 -- 34���̰�, (MIN)6100~14000(MAX) ���� ����
ORDER BY 1;

SELECT  employee_id, first_name, department_id, salary
FROM    employees
WHERE   salary > ANY ( SELECT  salary
                       FROM    employees
                       WHERE   department_id = 80 ) -- 54 rows
ORDER BY salary;                       
/* ���� : �������� ������� ���� ���� ��ȯ�Ҷ�
ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
01427. 00000 -  "single-row subquery returns more than one row"
--> > ANY �� �������� ������� �� ���� ó��
*/

-- =========================================
-- > ANY ��   > �ּҰ�(MIN) ���� ��ü����
-- =========================================

SELECT  employee_id, first_name, department_id, salary
FROM    employees
WHERE   salary >  ( SELECT  MIN(salary)
                    FROM    employees
                    WHERE   department_id = 80 ) -- 15 rows
ORDER BY salary;

[����6-8] 10�� �μ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�Ͻÿ�
-- �μ��� �ο� ����
SELECT department_id, COUNT(*)
FROM    employees
GROUP BY department_id
ORDER BY    1;


SELECT salary
FROM    employees
WHERE   department_id = 10; -- 4,400$

SELECT MIN(salary)
FROM    employees;

-- ��������
-- > ANY : MIN
-- < ANY : MAX
SELECT  employee_id, last_name, department_id, salary
FROM    employees
WHERE   salary < ANY ( SELECT salary
                       FROM    employees
                       WHERE   department_id = 80 )
ORDER BY 4;                  

-- =========================================
-- < ANY ��   < �ִ밪(MAX) ���� ��ü����
-- =========================================

SELECT  employee_id, last_name, department_id, salary
FROM    employees
WHERE   salary <  ( SELECT MAX(salary) -- ���������� �׷��Լ� : ������ ����� ��ȯ (count,sum,max,min,avg...)
                    FROM    employees
                    WHERE   department_id = 80 )
ORDER BY 4 DESC;             


-- 6.2.3 ALL ������
-- ANY : �ϳ��� ��ġ�ϸ�
-- ALL : ��� ��ġ�ϸ�
-- ���������� ��� �� ��ο� �����ϴ� ������� ��ȯ�Ѵ�.
[����6-10] 100�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� 
�޿��� ������������ �����Ͽ� ��ȸ�Ͻÿ�

SELECT salary
FROM    employees
WHERE   department_id = 100;

SELECT employee_id, last_name, department_id, salary
FROM    employees
WHERE   salary > ALL (SELECT salary
                  FROM    employees
                  WHERE   department_id = 100 ) -- 6900 ~ 12008
ORDER BY 4;

-- ================================
-- > ALL�� > �ִ밪(MAX)�� ��ü����
-- ================================

[����6-12] 30�� �μ��� ����� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �޿� ������ ��ȸ�Ͻÿ�
SELECT  salary
FROM    employees
WHERE   department_id = 30; -- 2500 ~ 11000


SELECT  employee_id, last_name, department_id, salary
FROM    employees
WHERE   salary < ALL ( SELECT  salary
                       FROM    employees
                       WHERE   department_id = 30 ); --5rows

/* �� �����ڷ� ������ ����� ���Ϸ��� �߻��ϴ� ����!
ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
01427. 00000 -  "single-row subquery returns more than one row"
--> ANY�� ALL �� ���δ�.
*/ 

-- ================================
-- < ALL�� < ������(MIN)�� ��ü����
-- ================================

SELECT  employee_id, last_name, department_id, salary
FROM    employees
WHERE   salary < ( SELECT  MIN(salary)
                   FROM    employees
                   WHERE   department_id = 30 ); -- 5rows

--------------------------------------------
-- �������� ������     |    ��ü����
--------------------------------------------
--   > ANY           |    MIN()
--   < ANY           |    MAX()
--   > ALL           |    MAX()
--   < ALL           |    MIN()
--------------------------------------------


-- p.56
-- = ANY : IN �����ڿ� ������ ����� �Ѵ�.
SELECT employee_id, last_name, department_id
FROM    employees
--WHERE   department_id IN (10, 20, 30); -- 9rows
--WHERE   department_id = ANY (10, 20, 30); -- 10�� �μ��� �̰ų� 20�� �μ��� �̰ų� 30�� �μ����̸� (=OR)
WHERE   department_id = ALL (10, 20, 30); -- 10�� �μ��� �̸鼭 20�� �μ��� �̸鼭 30�� �μ����̸�(=AND)
                                          -- ������ �߻����� ������, 10,20,30�� �μ��� ���ÿ� �Ҽӵ� ����� ����(���� �ȵǴ� ����)
/*
ORA-01797: �������� �ڿ� ANY �Ǵ� ALL�� ������ �ֽʽÿ�
01797. 00000 -  "this operator must be followed by ANY or ALL"
*/

[����6-14] 20�� �μ����� �޿��� ���� �޿��� �޴� ����� ���, �̸�, �μ���ȣ, �޿��� �μ��ڵ� �� / �޿� ������ ��ȸ�Ͻÿ�
SELECT  employee_id, last_name, department_id, salary
FROM    employees
--WHERE   salary = ANY (13000, 6000);
--WHERE   salary IN (13000, 6000);
WHERE   salary = 13000
OR      salary = 6000;


SELECT salary
FROM    employees
WHERE   department_id = 20; -- Marketing

SELECT  department_name
FROM    departments
WHERE   department_id = 20;


-- ===============================
-- = ANY �� IN ���� ��ü ����
-- ===============================

-- NOT IN <> ANY != ANY�� ��ü �Ұ���

-- NOT IN �����ڴ� <> ALL ��ü ����
SELECT  employee_id, last_name, department_id, salary
FROM    employees
WHERE   department_id <> ANY (10, 20)
ORDER BY 3; -- 103 rows

-- =============================================================================
-- NOT IN �����ڸ� <> ANY �� �����ϸ� <---> ��� �μ��� ��ȸ�� �Ͱ� ���� ����� ����
-- =============================================================================


-- 6.3 ���� �÷� ��������
-- ���������� ���� ����� ���� ���� �÷��� ��ȯ�ϴ� ��
-- �� UPDATE, DELETE, INSERT �� �ѹ��� ���� ���� �÷� �����͸� �����ϰ��� �Ҷ�

[����6-18] �Ŵ����� ���� ����� �Ŵ����� �ִ� �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�
-- manager_id IS NULL : �����  (��� : 100, �μ��ڵ� : 90, �޿� : 24000)
-- II.���������� �ذ�
SELECT  department_id, department_name
FROM    departments
WHERE   (department_id, manager_id) IN ( SELECT department_id, employee_id
                                         FROM   employees
                                         WHERE  manager_id IS NULL );

-- I.�Ϲ����� 3~4 �ܰ�
SELECT  employee_id
FROM    employees
WHERE   manager_id IS NULL; -- ��� 100�� manager_id�� NULL ��, �����

SELECT  department_id
FROM    employees -- ������̺��� ��ȸ�ϸ�~
WHERE   manager_id = 100; -- 14rows : ������� ���� �����ϴ� ��� ��

SELECT  department_id
FROM    departments -- �μ����̺��� ��ȸ�ϸ�~
WHERE   manager_id = 100; -- 1 rows : ������� �Ҽӵ� �μ��ڵ�� �̸�

SELECT department_name
FROM    departments
WHERE   department_id = 90; -- Executive : �濵��, �濵��, ���, ������,...

/* 
    �����÷� �������� ����  : ���� �����ϱ� ����~    
    EMPLOYEES ���̺� : �������, �޿�����, �μ�, ...
    
    �Ŵ� �� �μ�����/������� ���޵Ǵ� �޿��� ���� ���踦 �ϰ��� �Ҷ� ==> ���̺��� ����, �����ؼ� �߰�/������Ʈ!
    --> �����ٷ� ���(PL/SQL)    
*/
-- �μ����� ���� ���޵� ����� ��, �޿� �հ�, �޿� ���, �޿� �ְ�, �޿� �ּ�..
-- ���� : magam ==> ���� ����/���
-- ��¥ ����
-- ��� �� ����
-- �޿� �հ� ����
-- �޿� ��� ����
-- ...etc...

-- I. ���� ���� ������ ������� ��������� �����ؼ� ������ ���̺��� ����
CREATE TABLE month_salary (
    magam_date  DATE NOT NULL,
    dept_id NUMBER,
    emp_cnt NUMBER,
    sum_salary NUMBER, 
    avg_salary NUMBER(9,2)-- �޿����, �� 9��, �Ҽ��� ���� 2�� vs ������ 7��
);

DESC month_salary;

SELECT *
FROM    month_salary;

-- II. �μ��� ���� 
-- ����� ��
SELECT department_id, COUNT(*)
FROM    employees
GROUP BY department_id
ORDER BY 1;

-- �޿� �հ�
SELECT department_id, SUM(salary)
FROM    employees
GROUP BY department_id
ORDER BY 1;

-- �޿� �հ�
SELECT department_id, ROUND(AVG(salary))
FROM    employees
GROUP BY department_id
ORDER BY 1;

-- (��)���� ������ ��¥
SELECT LAST_DAY(TO_DATE('22/10/01')) LAST_DATE
FROM   dual;

-- III. ���� �����͸� ��������
-- ITAS : INSERT INTO ���̺� AS SELECT ~ ���� [�ѹ��� ��ȸ�� ����� �ٸ� ���̺� �����ϴ� ����]
-- CTAS : CREATE TABLE ���̺� AS SELECT ~ ���� [�ѹ��� ��ȸ�� ����� �ٸ� ���̺��� �����Ͽ� ����]
INSERT INTO month_salary (magam_date, dept_id)
SELECT  LAST_DAY(SYSDATE), department_id
FROM    employees
GROUP BY department_id
ORDER BY 2; -- 12 rows --> ���� ����

-- IV. ������ Ȯ��
SELECT *
FROM    month_salary;
--ROLLBACK;
-- V. �����÷� ���������� EMP_CNT(�����), SUM_SALARY(�޿���), AVG_SALARY(�޿����)�� NULL�� ������ ����
UPDATE month_salary m
SET EMP_CNT=( SELECT    COUNT(*)
              FROM      employees e
              WHERE     e.department_id = m.dept_id
              GROUP BY  e.department_id ),              
    SUM_SALARY=( SELECT    SUM(salary)
                 FROM      employees e
                 WHERE     e.department_id = m.dept_id
                 GROUP BY  e.department_id ),
    AVG_SALARY=( SELECT    ROUND(AVG(salary))
                 FROM      employees e
                 WHERE     e.department_id = m.dept_id
                 GROUP BY  e.department_id );
--WHERE ������; -- ������ �����ϸ� ��� ���ڵ尡 ������Ʈ �ǹǷ� ����!!    

-- magam_date, dept_id�� �Է��� �����͸� ���� ��������� ���� : ����� �޸𸮿��� ����ϰ� ������,..
COMMIT;

-- update ���� ����
UPDATE employees
SET salary = 2009; -- �������� ���� ==> ��� ���ڵ��� salary�� (üũ ��������) 2008���� ������Ʈ �ϴ� ���

SELECT *
FROM EMPLOYEES;

--ROLLBACK;

-- VI. ���������� ������Ʈ�� �μ��� �����, �μ��� �޿��հ�, �μ��� �޿������ ��ȸ (month_salary)
SELECT *
FROM    month_salary;

ROLLBACK;
-- VII. 12�� ���� null ���� ������Ʈ �Ϸ���? (�μ��� �������� ���� ��� Kimberely�� �����͸� ������Ʈ �غ��ÿ�)
UPDATE month_salary
SET EMP_CNT = ( SELECT COUNT(*)
                FROM    employees
                WHERE   department_id IS NULL ),
    SUM_SALARY = (  SELECT SUM(salary)
                    FROM    employees
                    WHERE   department_id IS NULL ),
    AVG_SALARY = ( SELECT ROUND(AVG(salary))
                   FROM    employees
                   WHERE   department_id IS NULL )
WHERE   dept_id IS NULL;                   

-- kimberely�� ������ ��ȸ
SELECT salary
FROM    employees
WHERE   department_id IS NULL;

-- IX. ���� Ŀ��
-- �޸𸮿� �ִ� �����͸� DBMS�� �����ϴ� ��������� (���Ϸ�) ����
COMMIT;

SELECT *
FROM month_salary
WHERE   TO_CHAR(magam_date,'MONTH') = '11��'; -- �� �ѱ��̶� 11�� �ƴ� 11���� ��ȸ vs NOVEMBER

SELECT TO_CHAR(magam_date,'MM')
FROM   month_salary;


-- DBA �� ������ ���̺�, �Ŵ� �� �ڵ����� (������) �����͸� �����ϰ� ���԰� ������Ʈ�� �ǽ��ؼ� �����صθ�,
-- �����ڴ� ����� �Ǵ� �����ڰ� ����� �� �ִ� ȭ��� ��ư�� ����, ex> ���� �޿���� ��ư Ŭ����~ ���̺�
-- �����͸� ��ȸ�ϰ�, �׷����� ��Ʈ�� ��ȯ�� ȭ���� [���]�ϰų� [����]�ϴ� ��ư�� ���� ���ϴ� ����� �����ϴ�
-- ���α׷��� ������ �� �ִ�.


-- 6.4 ��ȣ���� ��������
-- ��Դ� JOIN ������ ���� ��
-- ���� ������ �÷��� ���������� �������� ���Ǵ� ����������, ���� ������ ���������� �ʴ� �����̴�.
[����6-19] �Ŵ����� �ִ� �μ��ڵ忡 �Ҽӵ� ������� ���� ��ȸ�Ͻÿ�
-- �Ŵ����� ���� ��� : �����, 90�� �濵��
-- �Ŵ����� �ִ� ��� : ����� ���� ���� (106��)


-- <�������� ��� ��ġ�� ���� ���� >
-- 1.WHERE ���� �������� : (�Ϲ�����) ��������
-- 2.SELECT ���� �������� : ��Į�� ��������
-- 3.FROM ���� �������� : �ζ��� �� ��������

SELECT  COUNT(*) cnt
FROM    employees e
WHERE   department_id IN ( SELECT department_id
                           FROM   employees d
                           WHERE   manager_id IS NOT NULL
                           AND     e.department_id = d.department_id  )

--SELECT department_id
--FROM   employees
--WHERE   manager_id IS NOT NULL;

-- ==========================================
-- IN �����ڸ� EXISTS �����ڷ� ��ü ����
-- ==========================================
SELECT  COUNT(*) cnt
FROM    employees e
WHERE   EXISTS ( SELECT SYSDATE
                           FROM   employees d
                           WHERE   manager_id IS NOT NULL
                           AND     e.department_id = d.department_id  );
/*
ORA-00920: ���� �����ڰ� �������մϴ�
00920. 00000 -  "invalid relational operator"
*/


-- ========================================================
-- �Ϲ����� ��������(WHERE) vs SELECT��, FROM���� ���� ��������
-- ========================================================
--SELECT  �÷�1, �÷�2,...      : ��Į�� �������� ��ġ
--FROM    ���̺�1, ���̺�2,...   : �ζ��� �� �������� ��ġ
--WHERE   ���ǵ�                : �Ϲ����� �������� ��ġ


-- 6.5 ��Į�� ��������
-- SELECT ���� ����ϴ� �������� ����
-- �ڵ强 ���̺��� �ڵ���� ��ȸ�ϰų�, �׷� �Լ��� ��� ���� ��ȸ�Ҷ� ����Ѵ�.
-- ST_CLERK                        ,  AVG(salary)

[����6-22] ����� �̸�, �޿�, �μ�, �μ��� ������ ��ȸ�Ͻÿ�
-- ��Į�󼭺������� ��ȸ
SELECT  e.first_name, e.salary, e.department_id,
        ( SELECT department_name
          FROM   departments d
          WHERE  d.department_id = e.department_id ) dept_name
FROM    employees e
ORDER BY   e.department_id;

DESC employees;

SELECT first_name, salary, department_id,
        (   SELECT ROUND(AVG(salary))
            FROM    employees   ) avg_sal
FROM    employees
ORDER BY department_id;

          

-- �Ϲ� ���� ��ȸ
-- employees ~ departments ���̺� ���� : JOIN ����
SELECT  e.first_name, e.salary, e.department_id,
        d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;


SELECT *
FROM    month_salary;

SELECT dept_id, sum_salary, avg_salary
FROM    month_salary;

[��������6-3]
1. �� �μ��� ���� �μ��ڵ�, �μ���, �μ��� ��ġ�� �����̸��� ��ȸ�ϴ� �������� ��Į�� ���������� �Ϲ� ������ ��ȸ�Ͻÿ�
-- ��Į�� ��������
SELECT  d.department_id, d.department_name,
        (   SELECT  city
            FROM    locations l
            WHERE   l.location_id = d.location_id   ) city_name
FROM    departments d
ORDER BY    1;


-- �Ϲ����� : JOIN ���� (����Ŭ ����)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id
ORDER BY 1;

-- �Ϲ����� : JOIN ���� (ANSI ����)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d INNER JOIN locations l
ON   d.location_id = l.location_id
ORDER BY 1;

--(ANSI ���� - ���� �÷�)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d INNER JOIN locations l
USING   (location_id)
ORDER BY 1;


-- 6.6 �ζ��� �� (��ü) <------------> ���������� (�ۼ� ��ġ�� ����) ����
-- ���� ������ �������̰� WHERE ������ JOIN�� ���� ���踦 �δ´�.
-- ��(view)                vs      ���̺�(table)
-- �ӽü� ���̺�                    �������� ���̺�
-- �������� ����~�����ϸ� �����       ��� �������
-- (�޸�)                         ������ġ(������)

-- ex> ����Ŭ ��ġ�� �̸� ������� EMP_DETAILS_VIEW�� ��ȸ (=a.k.a ���̺�)
-- ��� ���̺��� �����͸� �����ڿ��� ���� �ʱ� ���Ѱ�(?)
-- �޿����� �� ������ ---> ������� ����, �޿�, ��������    + @ (����, ���,..�μ�)
DESC    emp_details_view;
SELECT * FROM emp_details_view;


-- ==========================================================================
-- �ζ��� �� ���������� ����������! (�� ��� ��ü�� �����ϱ� ���� , ���������� ����!)
-- ==========================================================================
[���� 6-24] �޿��� ȸ�� ��ձ޿� �̻��̰�, �ִ�޿� ������ ����� ���, �̸�, �޿�, ȸ����ձ޿�, ȸ���ִ�޿��� ��ȸ�Ͻÿ�
-- �Ϲ�������
-- 1. ��ձ޿�
SELECT ROUND(AVG(salary)) avg_sal
FROM    employees; --6362

-- 2. �ִ�޿�
SELECT MAX(salary) max_sal
FROM    employees; --24000

-- 1,2�� ���ļ�
SELECT  employee_id, last_name, salary --, avg_sal, max_sal --�� employees ���̺� ��� ��ȸ �Ұ���!        
FROM    employees
WHERE   salary >= 6462
AND     salary <= 24000;
-- ȸ����ձ޿�, ȸ���ִ�޿� �÷��� �������� ���� (employees�� �׿� ��� ���̺���...)
-- �ζ��� �� ����������, ��ġ �׷��� ���̺��� �����ϵ��� (���輺 ���̺�, month_salary ó��) �����͸� ��ȸ



-- �ζ��� �� ���������� �ذ��غ��� (��Į�� ���������� ����������, ������ �ζ��� �� ���������̱� ������~)
SELECT  e.employee_id, e.last_name, e.salary,
        k.avg_sal, k.max_sal
FROM    employees e, 
        ( SELECT ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal
          FROM  employees ) k
WHERE   salary BETWEEN k.avg_sal AND k.max_sal;

[����6-25] ������̺��� �����͸� �������� ���� �Ի� ��Ȳ�� ��ȸ������ �Ʒ��� ���� ���·� ���´ٰ� �ϸ�
-- �����δ� ���� �Ի� ��Ȳ ���̺��� ���� ==> �ζ��� ��� ó���ϴ� ����

-- �������� ������� ���� �Ի����� �հ�

-- ����Ŭ ���� Ȯ��
--SELECT *
--FROM    v$nls_parameters; -- RR/MM/DD, KOREAN --> 11(mm, MM) vs 11��(MONTH, MON)
--
--SELECT TO_CHAR(hire_date, 'MONTH') month
--FROM    employees;


SELECT  DECODE(TO_CHAR(hire_date, 'mm'), '01', COUNT(*), 0) "1��",
        DECODE(TO_CHAR(hire_date, 'mm'), '02', COUNT(*), 0) "2��",
        DECODE(TO_CHAR(hire_date, 'mm'), '03', COUNT(*), 0) "3��",
        DECODE(TO_CHAR(hire_date, 'mm'), '04', COUNT(*), 0) "4��",
        DECODE(TO_CHAR(hire_date, 'mm'), '05', COUNT(*), 0) "5��",
        DECODE(TO_CHAR(hire_date, 'mm'), '06', COUNT(*), 0) "6��",
        DECODE(TO_CHAR(hire_date, 'mm'), '07', COUNT(*), 0) "7��",
        DECODE(TO_CHAR(hire_date, 'mm'), '08', COUNT(*), 0) "8��",
        DECODE(TO_CHAR(hire_date, 'mm'), '09', COUNT(*), 0) "9��",
        DECODE(TO_CHAR(hire_date, 'mm'), '10', COUNT(*), 0) "10��",
        DECODE(TO_CHAR(hire_date, 'mm'), '11', COUNT(*), 0) "11��",
        DECODE(TO_CHAR(hire_date, 'mm'), '12', COUNT(*), 0) "12��"
FROM    employees
GROUP BY TO_CHAR(hire_date, 'mm')
ORDER BY TO_CHAR(hire_date, 'mm');

-- ������� �ϳ�
-- �÷����� 12��
-- �� �����Լ��� ����ؼ� ó��

[����6-26]
SELECT  SUM(m1) "1��", SUM(m2) "2��", SUM(m3) "3��", SUM(m4) "4��", SUM(m5) "5��", SUM(m6) "6��",
        SUM(m7) "7��", SUM(m8) "8��", SUM(m9) "9��", SUM(m10) "10��", SUM(m11) "11��", SUM(m12) "12��"
FROM    (
            SELECT  DECODE(TO_CHAR(hire_date, 'mm'), '01', COUNT(*), 0) m1,
                    DECODE(TO_CHAR(hire_date, 'mm'), '02', COUNT(*), 0) m2,
                    DECODE(TO_CHAR(hire_date, 'mm'), '03', COUNT(*), 0) m3,
                    DECODE(TO_CHAR(hire_date, 'mm'), '04', COUNT(*), 0) m4,
                    DECODE(TO_CHAR(hire_date, 'mm'), '05', COUNT(*), 0) m5,
                    DECODE(TO_CHAR(hire_date, 'mm'), '06', COUNT(*), 0) m6,
                    DECODE(TO_CHAR(hire_date, 'mm'), '07', COUNT(*), 0) m7,
                    DECODE(TO_CHAR(hire_date, 'mm'), '08', COUNT(*), 0) m8,
                    DECODE(TO_CHAR(hire_date, 'mm'), '09', COUNT(*), 0) m9,
                    DECODE(TO_CHAR(hire_date, 'mm'), '10', COUNT(*), 0) m10,
                    DECODE(TO_CHAR(hire_date, 'mm'), '11', COUNT(*), 0) m11,
                    DECODE(TO_CHAR(hire_date, 'mm'), '12', COUNT(*), 0) m12
            FROM    employees
            GROUP BY TO_CHAR(hire_date, 'mm')
        ) -- �ζ��� �� : �ӽü� ���̺�


-- ===========================================================
-- ����, ���� ������� �����ϴ� ���̺��� ����ٸ�? month_salary ó��
-- ==========================================================
CREATE TABLE month_emp_count (
    magam_date DATE DEFAULT LAST_DAY(SYSDATE),
    m1  NUMBER DEFAULT 0,
    m2  NUMBER DEFAULT 0,
    m3  NUMBER DEFAULT 0,
    m4  NUMBER DEFAULT 0,
    m5  NUMBER DEFAULT 0,
    m6  NUMBER DEFAULT 0,    
    m7  NUMBER DEFAULT 0,    
    m8  NUMBER DEFAULT 0,
    m9  NUMBER DEFAULT 0,
    m10  NUMBER DEFAULT 0,
    m11  NUMBER DEFAULT 0,
    m12  NUMBER DEFAULT 0,
    total NUMBER,
    avg NUMBER
);


-- ROWNUM   vs  ROW_NUMBER()
-- �ǻ��÷�   vs  �ǻ��÷� �Լ�
-- Ű���� F1 ������ ���򸻿��� �˻� �غ�����!
-- ���� ���� ����� ���� �� ���� �������� ��Ÿ����.
[����6-27] ���, �̸��� 10�� ��ȸ�Ͻÿ�
SELECT ROWNUM NUM, employee_id, first_name
FROM    employees
WHERE   ROWNUM BETWEEN 11 AND 20
ORDER BY 2;

-- �߰� ����(����)�� ���͸� ���� ����

-- ����(ranking)�� ��Ÿ���� �Լ�
-- RANK()       vs        DENSE_RANK()        vs       AVERAGE_RANK()
-- 1,2,3,3,5,..          1,2,3,3,4,5,6,..              1,2,3.5,3.5,....
-- ex> �޿� ���� 1~10�����, ���� 5��, ���� 10��...

SELECT  employee_id, first_name, 
        RANK() OVER (ORDER BY salary DESC) sal_rank, -- 1,2,3,3,5... [������ ���� ������ +1(�ǳ� �پ� ǥ��)]
        DENSE_RANK() OVER (ORDER BY salary DESC) sal_dense_rank, -- 1,2,3,3,4...[������ ���� ������ ǥ��]
        AVERAGE_RANK() OVER (ORDER BY salary DESC) sal_avg_rank, -- 1,2,3.5,3.5,4...[�������� �Ҽ������� ǥ��]
        ROW_NUMBER() OVER (ORDER BY salary DESC) sal_num1 -- 1,2,3,3,4...[������� �������� ��ȣ�� ǥ��, ROWNUM�� ����]
FROM    employees;


SELECT  employee_id, first_name,
        AVERAGE_RANK() OVER (ORDER BY salary DESC)
FROM    employees;   


[���� 6-28] �м��Լ��� ����ؼ� �޿��� ���� ���� 10�� ����� ���, �̸�, �޿������� ��ȸ�Ϸ���?

SELECT  employee_id, last_name, salary, 
        DENSE_RANK() OVER (ORDER BY salary DESC) sal_rank          
FROM    employees
WHERE   ROWNUM <= 10;













