-- ������ ��ȸ(p.4)
-- SQL�� ��ҹ��ڸ� �������� ������ Java�� ��ҹ��ڸ� ������ ������
-- ���̺��� ������ ���캸�� ��� : desc, describe

desc countries;              -- countries��� ���̺��� ������ �Ʒ��� ����

/*
�̸�           ��?       ����           
------------ -------- ------------ 
COUNTRY_ID   NOT NULL CHAR(2)       : ������ �ڵ�
COUNTRY_NAME          VARCHAR2(40)  : ������ �̸�
REGION_ID             NUMBER        : ������ ���Ե�(=�Ҽӵ�) ��� �ڵ�
*/
-- countries ���̺�κ��� *(=all) (��)�� ��ȸ�ϴ� ���
SELECT * FROM countries;

SELECT country_id, country_name, region_id     -- select ��
FROM countries;             -- from ��

SELECT *                    -- select ��
FROM countries;             -- from ��




[���� 2-1] EMPLOYEES ���̺��� ������ ��ȸ�Ͻÿ�
desc EMPLOYEES;

[���� 2-1] EMPLOYEES ���̺��� �����͸� ��� ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES; 

SELECT employee_id, FIRST_NAME
FROM EMPLOYEES; 



















2.2 ������
��ü�����Ϳ��� Ư�� �� �����͸� �����Ͽ� ��ȸ�ϱ� ���� �������� ����Ѵ�.
/*
SELECT �÷�1, �÷�2, ...        (3) ���ϴ� Į���� ��ȸ
FROM ���̺� �̸�                 (1) ����
WHERE ������ ����;               (2) ����(=���͸�)
*/

[���� 2-3] 80�� �λ���� ��������� ��ȸ�Ͻÿ�
SELECT *
FROM EMPLOYEES
WHERE department_ID = 80;



-- ��ü �μ��� �? �Ƶ� �μ��ڵ带 �����ִ��� ��ȸ
DESC departments;

SELECT *
FROM departments; -- 27ROWS




















































