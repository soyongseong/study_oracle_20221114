-- 7��. SET ������ (p.63)
-- hr, co ��Ű�� Ȱ��
-- �����PC/Study_Oracle/Extras�� �ִ� HWP, PDF �����Ͽ� ���� ��ġ

--JOIN, SubQuery : �������� ���迡�� ���̺��� �����͸� ��ȸ --> �������������� ���������� ���� ��ȸ�ϴ� �����͸� ����
--SET ���� : �������


-- SQL������ ���п��� ����ϴ� ������ ����ó�� (vs ����, ���������� �������� ����) ���δٸ� ������ ���� �����
-- ��ĥ�� �ִ�.

-- 1) UNION : ������ (�ߺ�����)
-- 2) UNION ALL : ������ (??)
-- 3) INTERSECT : ������
-- 4) MINUS : ������
/* �� + ����Ű : Ư������
[1,2,3] �� [4,5] <---> [1,2,3,4,5]
[1,2,3] �� [3,4,5] <--->  [1,2,3,4,5]
*/

--[����7-1]
-- �ߺ��� ������ ���� ����� ��ȯ
-- ���� ������ ���� ������ ���� �߻� : ORA-01789: ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
-- null ���������, �÷��� ������ Ÿ���� ���ƾ� ��
-- ��ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM    dual
UNION ALL
SELECT 2, 4, 5, 6, 8, null, 'B' second
FROM    dual
UNION ALL
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM    dual;


[����7-2] �����ǰ� �ִ� �μ�, �����ǰ� �ִ� ���� ������ ��ȸ�Ͻÿ�
SELECT  hr.department_id code, hr.department_name name
FROM    hr.departments
UNION
SELECT  hr.location_id, city
FROM    hr.locations;
--UNION                -- hr ��Ű���� ������ co ��Ű���� ������ �� ���ٸ�, �Ұ���
SELECT  customer_id, full_name
FROM    co.customers;

[����7-3] �����ǰ� �ִ� ���ÿ� ���� ������ ��ȸ�Ͻÿ�
DESC locations;
DESC countries;

SELECT  TO_CHAR(location_id) code, city name -- NUMBER , VARCHAR2
FROM    locations
UNION
SELECT  country_id, country_name    -- CHAR, VARCHAR2
FROM    countries;

-- ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ� / NULL ���

-- 7.2 UNION ALL
-- UNION    vs    UNION ALL : �ߺ��� ����    vs    �ߺ��� ����


-- 7.3 INTERSECT
-- ������
-- [1,2,3,5] �� [2,4,6] = [2]

[����7-7] 80�� �μ��� 50�� �μ��� �������� �ִ� ����� �̸��� ��ȸ�Ͻÿ�
SELECT first_name
FROM    employees
WHERE   department_id = 80 -- 34
INTERSECT
SELECT first_name
FROM    employees
WHERE   department_id = 50 -- 45

-- Peter, John  : ���� �̸�?

-- 7.4 MINUS ������
-- ���տ��� �����տ� �ش��ϴ� ����
-- [1,2,3,5] - [2,4,6] = [1,3,5]

SELECT first_name
FROM    employees
WHERE   department_id = 80 -- 34
MINUS
SELECT first_name
FROM    employees
WHERE   department_id = 50 -- 45




--8��. DML
-- Data Manipulation Lang: ������ ���۾�/��ɾ�
--1) SELECT : ��ȸ
--2) INSERT : ���ο� ������ ����
--3) UPDATE : ���� �����͸� ����
--4) DELETE : �����͸� ����
-- DML�� TCL(=Transaction Control Language)�� �Բ� ����Ѵ�.
-- �� COMMIT : �޸𸮿� �ִ� ������(=���� ���)�� ������ġ�� �����ϴ� Ʈ����� ���� ��ɾ�
-- �� ROLLBACK : ������ ������ ����� ����ϴ� Ʈ����� ���� ��ɾ�

-- 8.1 INSERT
-- I. �÷��� ����ϴ� ��� : ������ŭ ���� ����, ������ ���� �������� ����
-- INSERT INTO ���̺�� (�÷���1, �÷���2, ..)
-- VALUES (��1, ��2, ..)

-- II. �÷��� �����ϴ� ��� : ���̺��� ��� �÷��� �����ϴ� ���� �Է�
-- INSERT INTO ���̺��
-- VALUES (��1, ��2, ..)

-- �������� �ʴ� �÷����� �ڵ����� NULL �� ����ȴ�.
SAVEPOINT SP1; -- SP1�̶�� ���̺�����Ʈ�̸� / �����ŭ �۾��� ����Ǿ������� �����ϰ� ǥ�� (=����ǥ)
COMMIT;

[����8-1] ���, �̸�, ��, �Ի����� 300, 'Steven', 'Jobs', SYSDATE ���� �����Ͻÿ�!
-- I.emp ������ ������ ����
CREATE TABLE emp (
    emp_id NUMBER PRIMARY KEY,
    fname VARCHAR2(20),
    lname VARCHAR2(20),
    hire_date DATE DEFAULT SYSDATE,
    --...���..
);

DROP TABLE emp;
-- I. employees�� ������ �����ؼ� emp�� �����ϴ� ��� : CTAS (Create Table ���̺� AS SELECT ����)
CREATE TABLE emp AS
SELECT  employee_id emp_id, first_name fname, last_name lname, hire_date, 
        job_id, salary, commission_pct comm_pct, department_id dept_id
FROM    employees
WHERE   1=2; -- ������������ ��ȸ�� ����� ���� emp�� ����(���̺� ����, ������Ÿ�Ե�)
             -- �������ǵ� ���� ��

SELECT *
FROM emp;

-- II. ������ �� ����
INSERT INTO emp (emp_id, fname, lname, hire_date, job_id)
VALUES (300, 'Steven', 'Jobs', SYSDATE, 'ST_CLERK');

DESC emp; -- NUMBER, VARCHAR2, VARCHAR2, DATE

INSERT INTO emp (emp_id, fname, lname, hire_date, job_id)
VALUES (301, 'Bill', 'Gates', SYSDATE, 'ST_MAN');

-- ITAS : INSERT INTO ���̺� AS SELECT ����~
-- ���� ���� �����͸� �ѹ��� �����ϰ��� �Ҷ�
-- Ư�� �÷��� �����͸� �����ϰ��� �ϸ� ���� �߻�   vs �ѹ��� ��� �÷��� ��ȸ�ؼ� �Է��Ҷ��� ��������
INSERT INTO emp
SELECT  employee_id, first_name, last_name, hire_date, job_id, salary, NVL(commission_pct, 0), department_id
FROM    employees
WHERE   department_id = 30;


SELECT *
FROM emp;

COMMIT;





































