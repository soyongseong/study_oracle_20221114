--8��. DML
-- �������� COMMIT �̳� ROLLBACK      vs   �ڵ����� COMMIT �Ǵ� �� (DDL : CREATE, ALTER, DROP, TRUNCATE / AUTO COMMIT)
-- Ʈ�����(Transaction, �ŷ� / �۱ݽ� ���Ⱑ ���ܵǾ� �۱ݰ���� ���� ���¿��� ���»��� �ݾ��� �Ű����� ���� ������
-- ���࿡���� ���� �ŷ��� �� �̷������� Ȯ���ϰ� �ش� ��ġ�� ����)
-- ����()
-- �۱�()

-- Data ���� ���
-- �����ڵ��� ���� ���� ����ϴ� ����   vs   �𵨷�, DBA, �����ͺм���...
-- SELECT, INSERT, UPDATE, DELETE ����

--8.1 ������ ����
-- INSERT INTO ���̺� (�÷���1, �÷���2,..) : ����, �÷����� �߿�
-- VALUES (��1, ��2,...) 

-- INSERT INTO ���̺�   : ��� �÷��� ������ ����(����x)
-- VALUES (��1, ��2...)

-- emp ��� ���̺� ����
-- 12.2 ������������ ��� emp ���̺��� ���� DROP �� �ڿ�~ ����!
DROP TABLE emp;
-- 1.hr ��Ű�� ==> EMPLOYEES ���̺��� �Ϻ� �÷��� �����ͼ� emp�� ����� ��� : CTAS (��ȸ�� 
-- CREATE TABLE ���̺��
-- SELECT ����~ 
CREATE TABLE emp AS
SELECT  employee_id emp_id, first_name fname, last_name lname, hire_date, job_id, salary,
        commission_pct comm_pct, department_id dept_id
FROM    employees -- �÷��� �����͸� �Բ� ��ȸ�� emp ���̺��� �����ϰ� �����͸� ����
-- CTAS�� ���̺��� �����ϸ�, ���õ� �������ǵ鵵 ���簡 �ȴ�.

desc emp;
select * from emp;
-- ======================================================================
-- ���̺� ���������� Ȯ���ϴ� ���
SELECT  *
FROM    user_constraints
WHERE   table_name = 'EMP'; -- EMP ��� ���̺� ���ǵ� ���������� Ȯ��
-- ======================================================================

INSERT INTO emp (emp_id, fname, lname, hire_date, job_id)
VALUES (301, 'Bill', 'Gates', TO_DATE('2013/05/26', 'yyyy/mm/dd'), 'SA_CLERK'); -- JOB_ID NOT NULL �������Ƕ����� ������ ���Խ� ����

-- 2.emp ��� ���̺��� ���� ���� 
CREATE TABLE emp (
    EMP_ID NUMBER PRIMARY KEY,
    FNAME VARCHAR2(30),
    LNAME VARCHAR2(20),
    HIRE_DATE DATE DEFAULT SYSDATE,
    JOB_ID VARCHAR2(20), -- NOT NULL ������ ������� ������, NULL �� ���!
    SALARY NUMBER(9,2),
    COMM_PCT NUMBER(3,2),
    DEPT_ID NUMBER(3) -- �ܷ�Ű �������ǵ��� ��� ������ �ٷ� ��!!
);

[����8-1]
INSERT INTO EMP (emp_id, fname, lname, hire_date, job_id)
VALUES (300, 'Steven', 'Jobs', SYSDATE, 'ST_MAN');

COMMIT; -- �������� �����ڰ� Ŀ��(�޸� --> ���������� ����)

-- �ڵ�Ŀ�ԵǴ� ���
TRUNCATE TABLE emp; -- emp ���̺��� ��� �����͸� ���� / ������ ���� + (�ڵ����� COMMIT;)
ROLLBACK; -- �������� �ѹ�
SELECT * FROM EMP;

-- A���� ���� : GRANT CONNECT, CREATE VIEW, RESOURCES TO ����1;


[����8-4] ���������� ������ �Է� , NULL �Ǵ� '' ���ڿ��� ǥ��
INSERT INTO emp (emp_id, fname, lname, hire_date, job_id, salary)
VALUES (302, 'Warren', 'Buffett', SYSDATE, 'ST_CEO','');

SELECT *
FROM    emp;


[����8-5] 
-- CTAS : CREATE TABLE ���̺�� AS SELECT ����
-- ITAS : INSERT INTO ���̺� (AS����) SELECT ����
INSERT INTO emp (emp_id, fname, lname, hire_date, job_id, dept_id)
SELECT employee_id, first_name, last_name, hire_date, job_id, department_id
FROM    employees
WHERE   department_id IN (10, 20);

COMMIT;

-- ���� �޿� ���� ���̺� : month_salary
-- ���� �÷� �������� �ǽ����� �������
DESC month_salary;

SELECT  *
FROM    month_salary;

[���� 8-6]
TRUNCATE TABLE month_salary; -- ��� �����͸� ����� �ڵ� Ŀ��!



-- ITAS
INSERT INTO month_salary (magam_date, dept_id)
SELECT  SYSDATE, department_id
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id

SELECT * FROM month_salary;

-- ������ NULL ä�����, �����÷� ���������� ����ؼ� UPDATE ���� ����

[����8-7] emp ���̺� employees ���̺��� 30������ 60�� �μ��� �ٹ��ϴ� ����� ������ ��ȸ�ؼ� �����Ͻÿ�
INSERT INTO emp
SELECT  employee_id, first_name, last_name, hire_date, job_id, salary, commission_pct, department_id
FROM    employees
WHERE   department_id BETWEEN 30 AND 60; -- 57 rows

SELECT * FROM EMP;

-- ===================================================================
-- INSERT INTO ���̺�� (�÷���1, �÷���2,..) VALUES (��1, ��2, ...)
-- INSERT INTO ���̺�� VALUES (��1, ��2, ...�÷�����ŭ)
-- INSERT INTO ���̺�� SELECT ����~ : ITAS (AS ����)
-- ===================================================================


-- 8.2 ������ ���� / UPDATE
-- INSERT           VS    UPDATE
-- ���ο� ������ ����  vs    ���� �����͸� �����ؼ� ����(=����)

-- UPDATE ���̺��
-- SET �÷���=��
-- WHERE ������        :    where ������ ������ ��� ���� ������
-- COMMIT or ROLLBACK;
-- UPDATE ���� + �����÷� �������� : ���̺��� ���� ���� �÷��� �ѹ��� ������Ʈ�Ҷ� ����!
SELECT *
FROM    employees;

UPDATE employees
SET salary = ( SELECT MIN(salary) FROM employees );

ROLLBACK;


[����8-8] ����� 300�� �̻��� ����� �μ��ڵ带 20���� �����Ͻÿ�

rollback;
UPDATE emp
SET dept_id = 20
--WHERE   emp_id >= 300; -- ���ǿ� ��ġ�ϴ� ��(row)�� �÷� �����͸� ����

[����8-9]emp���̺��� ����� 300���� ����� �޿�, Ŀ�̼� �����, �����ڵ带 �����Ͻÿ�
-- �޿��� 2000, Ŀ�̼ǹ������ 0.1��, �����ڵ�� IT_PROG

UPDATE emp
SET salary=2000,
    comm_pct=0.1,
    job_id='IT_PROG'
WHERE   emp_id=300;    
    
SELECT * FROM emp;
COMMIT;
[����8-10] emp ���̺��� ��� ������� salary�� 5000, ���ʽ� ������� 0.4�� �����Ͽ� �����Ͻÿ�
UPDATE emp
SET salary=5000,
    comm_pct=0.4;
        

[����8-11] ���������� �̿��ؼ� emp ���̺��� 103�� ����� �޿��� employees ���̺��� 20�� �μ��� �ִ� �޿��� ����
�Ͻÿ�

-- I. �Ϲ�����
SELECT  MAX(salary)
FROM    employees
WHERE   department_id = 20; -- 13000

UPDATE emp
SET salary = 13000
WHERE   emp_id = 103; -- 0�� ������Ʈ / 103�� ����� : 9000 --> 13000 ���� (����?)

INSERT INTO emp
SELECT  employee_id, first_name, last_name, hire_date, job_id, salary, commission_pct, department_id
FROM    employees
WHERE   employee_id = 103;

SELECT * FROM   emp;

-- II.���������� �����͸� ����
-- �����ġ ���� : SELECT��(=��Į��), FROM��(=�ζ��κ�), WHERE�� (=�Ϲ����� ��������)
-- ������(JOIN����) ���� : ��ȣ���� ��������
-- ����� : (���� �÷�)���� ��, (���� �÷�)���� ��, (���� ��)���� �÷�
ROLLBACK;

UPDATE emp
SET salary = (  SELECT  MAX(salary)
                FROM    employees
                WHERE   department_id = 20 )
WHERE   emp_id = 103;

[����8-12] emp ���̺��� ��� 180�� ����� ���� �ؿ� �Ի��� ������� �޿��� employees ���̺� 50�� �μ��� ���
�޿��� �����ϴ� ������ �ۼ��Ͻÿ�


UPDATE emp
SET = (50�� �μ��� ��� �޿�)
WHERE   �Ի����� 180�� ����� ���� ��

-- I.�Ϲ�����
SELECT ROUND(AVG(salary))
FROM    employees
WHERE   department_id = 50; -- 3476

SELECT TO_CHAR(hire_date, 'yyyy') -- 2006
FROM    employees
WHERE   employee_id = 180
--COMMIT;
UPDATE emp
SET salary = 3476
WHERE   TO_CHAR(hire_date,'yyyy') = '2006';

-- II.���������� ����Ѵٸ�?
ROLLBACK;

UPDATE emp
SET salary = (  SELECT ROUND(AVG(salary))
                FROM    employees
                WHERE   department_id = 50  )
WHERE   TO_CHAR(hire_date,'yyyy') = (   SELECT TO_CHAR(hire_date, 'yyyy') -- CHAR
                        FROM    employees
                        WHERE   employee_id = 180   ); --24 rows
--SELECT 1 + '1'
--FROM    dual;

SELECT *
FROM    emp;
/*
TRUNCATE TABLE emp;

INSERT INTO emp
SELECT employee_id, first_name, last_name, hire_date, job_id, salary, commission_pct, department_id
FROM    employees;
*/

[����8-14] �����÷� ���������� month_salary�� ��� ���� �÷� �����͸� ������Ʈ �Ͻÿ�
SELECT *
FROM    month_salary;
TRUNCATE TABLE month_salary;
-- �� ������ month_salary�� ������ ������ TRUNCATE TABLE emp; �Ŀ�~
-- I. magam_date, dept_id �� ���� INSERT
INSERT INTO month_salary (magam_date, dept_id)
SELECT  LAST_DAY(SYSDATE), department_id
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY    department_id;

SELECT *
FROM    month_salary;
-- II. �����÷� ���������� �̿��ؼ� emp_cnt, sum_sal, avg_salary UPDATE
-- ��, UPDATE�� �����÷� ���������� �ۼ��Ͻÿ�
UPDATE month_salary m
SET (emp_cnt, sum_salary, avg_salary) = (   SELECT  COUNT(*), SUM(e.salary), ROUND(AVG(e.salary))
                                            FROM    employees   e
                                            WHERE   e.department_id = m.dept_id
                                            GROUP BY e.department_id )
--WHERE                                            

COMMIT;

-- 8.3 DELETE / ������ ����
-- ���ǿ� ��õ� ������ ��(row)�� �����ϴ� ���
/*
    DELETE FROM ���̺��
    WHERE   ������
*/

-- �� WHERE �� ������ ��� ������(=���ڵ�) ����
-- ROLLBACK ���� Ʈ����� ó�� �������� ���ư���!!

[����8-15] emp ���̺��� 60�� �μ��� ��� ������ �����Ͻÿ�
SELECT *
FROM    emp
WHERE   dept_id = 60; -- �� 107��, 60�� �μ����� 5��

DELETE FROM emp
WHERE dept_id = 60;

ROLLBACK;

[����8-16] emp ���̺��� ��� �����͸� �����Ͻÿ�
DELETE FROM emp;
-- 102�� �� ��(��) �����Ǿ����ϴ�


TRUNCATE TABLE emp;
-- Table EMP��(��) �߷Ƚ��ϴ�. (���̺��� ������ �����, �����ʹ� ���� <---> ���)



-- 9��. DDL
-- Database Definition Language, �����ͺ��̽� ���� ���
-- ���̺�, ����� �����ͺ��̽� ��ü�� ����,����,���� �ϴ� ��ɾ�
-- SQL : Structured Query Language --> ����ť��, ����
-- 0) DQL : SELECT
-- 1) DML : INSERT, UPDATE, DELETE
-- 2) DDL : CREATE, ALTER, DROP
-- 3) DCL : COMMIT, ROLLBACK


-- I.�����ͺ��̽� ��ü > �����ڰ� ������Ʈ������ ���� : ���̺�
-- 1) �� ���̺� ������ ���� ���� (=�÷�)
--CREATE TABLE ���̺�� (
--    �÷��� ������Ÿ��(BYTE����) ��������,
--    ....���..
--);

-- 2) CTAS : �ٸ� ���̺��� ��ȸ�� �����͸� �����ؼ� (=�����ϵ� ���� ���̺��� ������ �����͸� �����ͼ� ����)
--CREATE TABLE ���̺�� AS 
-- SELECT   �÷�1, �÷�2,...
-- FROM     �������̺��
-- WHERE    ������
-- ���������� �Ϻ� ����(NN)�Ǿ����� PK,FK���� ���� �ȵǾ���

DESC departments;
-- =============== Ư�� ���̺� ���ǵ� ���� ������ ��ȸ�ϴ� ��� ====================
-- �̸� : ����(PK-FK : �ĺ�����, JOIN ����)
-- A���̺��� PK�� B ���̺��� FK�� ����ϴ� ���� : �ĺ����� (��������, ����, ���� ����)
SELECT  *
FROM    user_constraints
WHERE   table_name='EMPLOYEES';
-- =============================================================================

9.1 ������ Ÿ��
1) ������ : �������� vs ��������
1-1) ��������
- CHAR(n) : n ����Ʈ ������ ������ ���ڵ����� Ÿ��
   �� ���� 1�� : 1byte
- CHAR(char n) : n���� ���ڷ� �����ϴ� ���ڵ����� Ÿ��   
- NCHAR(n) : National CHAR(n) : �������� �ٸ� n ����Ʈ ���̸� ���� ���ڵ�����
   �� �ѱ� 1�� :  3~4 byte�� ���� [Oracle �Ǵ�]

1-2) �������� : ��ĳ����2 vs ����2
- VARCHAR(n) <---> ����Ŭ���� ������ : �ٸ� �뵵�� ����� ��ȹ�̶�, �������ڴ� VARCHAR2�� ����� ��!
- VARCHAR2(n) :  n ����Ʈ ����
- NVARCHAR2(n) :  National VARCHAR2(n)
�� sqlDeveloper > �޴� > ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ���� : BYTE �� �Ǿ�����
   
   
2) ������ : ���� vs �Ҽ�
    - NUMBER : ����x
    - NUMBER(9,2) : �Ҽ��� 2, ������ 7��, �� 9��
3) ��¥�� : DATE
SELECT SYSDATE, SYSTIMESTAMP
FROM    dual;
4) LOB, BLOB, LONG, RAW, ...�����ڰ� ������� �ʴ� Ÿ�Ե�
-- Double, Float Ÿ�� --> ����Ŭ������ NUMBER�� ó��


-- ===============================
--  ���̺� ���� ��Ģ
-- ===============================
-- �ݵ�� ���ڷ� ����
-- ���ڵ� ��� ����(����+����)
-- �ִ� 30����Ʈ(11g ����, 21c���, 256����Ʈ ����)
-- ����Ŭ ���� ����� �� ����
-- =======================================================
-- �ý����� ����ϴ� �����(Keyword)�δ� ��ü�� ������ �� ����.
-- =======================================================
-- SYSTEM �������� �����ؼ� �����غ��� (����)
-- Oracle �������� ������ �ٸ� : 21c�� 2555��
SELECT  keyword
FROM    v$reserved_words
ORDER BY 1;

-- �׷����� �ұ��ϰ� �� ����ؾ��ϴ� ������ "�����" ���� (ū����ǥ�� ���)


[����9-1] TMP ��� ���̺��� 3byte ���� id �÷��� 20byte ���� fname �÷����� �̷���� ���̺��̴�. �̰���
�����ϴ� SQL�� �ۼ��Ͻÿ�
CREATE TABLE TMP (
    id NUMBER(3),
    fname VARCHAR2(20)
);

[����9-2]-- ȫ�浿 ������ ����
INSERT INTO TMP
VALUES (1, 'ȫ�浿');

[����9-3] ȫ�浿�� ȫ���� 1�� ������ ����
UPDATE TMP
SET fname='ȫ��'
WHERE   id=1;

-- �����ϼ���
DELETE FROM TMP; -- ROLLBACK, COMMIT�� ����
--TRUNCATE TABLE TMP -- AUTO COMMIT;

COMMIT;












