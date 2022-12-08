-- 10��. ��������
-- ���Ἲ �������� : �������� ��Ȯ���� �����ϱ� ���� �������� , 5���� ��������
-- ���̺� �߸��� �����Ͱ� ���Ե��� �ʵ��� ������ ��Ģ�� �ִ� ��

-- 1) NOT NULL : NULL ���� ������� �ʴ� ����, NULL ������ �Է½� �����߻�!!
-- 2) CHECK : �����͸� üũ(ex. ����, �ݾ�, ����..) / ������
-- 3) UNIQUE : �����ϰ� �ĺ��ϴ� ���� �Է¹��� �� �ְ�, �� NULL ��� --> �ߺ��� �����ʹ� �Է½� �����߻�!
-- 4) PRIMARY KEY : �����ϰ� �ĺ��ϴ� �ĺ��ڷ� NOT NULL + UNIQUE ��������
-- 5) FOREIGN KEY : �ٸ� ���̺��� PK�� �����ϴ� ��������
--    DEFAULT : ������ �Է½� �⺻���� ������ ���� (ex. SYSDATE)

-- �����̺��� �����ϸ鼭 �����ϰų�, �Ǵ� ���̺� ���� ���Ŀ� �����ϴ� ����� �ִ�.

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM    user_constraints
WHERE   OWNER='HR';
-- SYS_CXXXXX ������ ���������� �ý����� �̸� ��� ��ȣ�������� ������ �������� ����
-- ����ڰ� ���� �����ϴ� ���������� ��� �����Ϳ� ���õ� ������ ���̹��� �־, ���������� �ľ��ϱ� ������.


10.1 NOT NULL
-- 1) ���̺� ������ �������� ����
[����10-1] nulltest ��� ���̺��� �����ϰ� col1 �� NOT NULL ���������� �߰��Ͻÿ�
CREATE TABLE nulltest (
    col1 VARCHAR2(5) NOT NULL, -- �÷� �������� ����
    col2 VARCHAR2(5)
);
-- HR	SYS_C008435	C	NULLTEST

[����10-2] nulltest ���̺� �����͸� �Է��Ͻÿ�
INSERT INTO nulltest (col1)
VALUES ('AA');
INSERT INTO nulltest (col1)
VALUES ('������');
INSERT INTO nulltest (col1)
VALUES ('12345');

SELECT *
FROM    nulltest;

[����10-3] nulltest ���̺��� col2�� ���ڿ� BB�� �Է��Ͻÿ�
INSERT INTO nulltest (col2)
VALUES ('BB');


-- 2) ���̺� ������ �������� �߰�
-- �����Ͱ� ���ԵǱ� ���� ������ �ؾ� �Ѵ�.
-- ALTER TABLE ��ɹ��� ����Ͽ� �÷��� NULL �����Ͱ� ���� ���, NOT NULL�� �߰��� �� �ִ�.
UPDATE nulltest 
SET col2='BB';

[����10-4] nulltest ���̺��� col2�� NOT NULL ���������� �߰��Ͻÿ�
ALTER TABLE nulltest
MODIFY (col2 NOT NULL);


-- 10.2 CHECK ��������
-- ���ǿ� �´� �����͸� ������ �� �ְ� �ϴ� �������� (ex. EMPLOYEES ���̺��� salary > 0)
-- ������ : ���̺� �Է��Ҽ� �ִ� �������� ����, ���� ����
-- 1) ���̺� ������ �������� ���� - �÷� �������� ����
[����10-6] check_test ���̺��� �����ϸ鼭 check ���������� �����Ͻÿ�
CREATE TABLE check_test (
    name VARCHAR2(10) NOT NULL,
    gender VARCHAR2(10) NOT NULL CHECK (gender IN('����','����','��','��','M','F','m','f')), --�÷� ����
    salary NUMBER(8),
    dept_id NUMBER(4),
    CONSTRAINT check_salary CHECK(salary > 2000) -- ���̺� ����
    -- �ʹ� ���� �ʰ�, ������ �����ϰ� ����ϰ� , ������ ��Ģ�� ������ ���ؼ� �ۼ��ϴ°� ����.
);

DESC check_test;

[���� 10-7] ȫ�浿 ����� ������ check_test ���̺� �Ʒ��� ���� �Է��Ͻÿ�
INSERT INTO check_test 
VALUES ('ȫ�浿','����',3000,0001);
INSERT INTO check_test 
VALUES ('�̼���','����',2100,0002);
INSERT INTO check_test 
VALUES ('�庸��','M',2500,0003);

-- 2) ���̺� �����Ŀ� �������� �߰�
-- 2-1) ���̺� ������ �÷� �������� ������ ���������� ���� ����
ALTER TABLE check_test
DROP CONSTRAINT check_salary;

-- check_salary �Ǵ� check_salary_ck �����Ǿ��� Ȯ��


-- 2-2) ���̺� ������ ���������� ���� �߰�
ALTER TABLE check_test
ADD CONSTRAINT salary_ck CHECK (salary > 2000);

-- ���������� �� �߰��Ǿ��� Ȯ��
/*
SYS_C008437	C	CHECK_TEST
SYS_C008438	C	CHECK_TEST
SYS_C008439	C	CHECK_TEST
SALARY_CK	C	CHECK_TEST
*/

INSERT INTO check_test
VALUES ('�庸��', '��', 2400, 100);

SELECT *
FROM    check_test;


10.3 UNIQUE  ��������
-- �������� �ߺ��� ������� �ʴ� (=�ߺ����� �ʵ���) ���ϼ��� �����ϴ� ��������
-- NULL�� ���
-- PK (=Primary Key) = UNIQUE + NOT NULL
-- ����Ű(=Composite Key)�� ������ �� �ִ�.
-- 1) ���̺� ������ �÷�����, ���̺������� ����
[����10-13] UNIQUE_TEST ���̺��� �����ϰ� ���������� ���������� �����Ͻÿ�
CREATE TABLE unique_test (
    col1 VARCHAR2(5) UNIQUE NOT NULL, -- �÷� ����
    col2 VARCHAR2(5),
    col3 VARCHAR2(5) NOT NULL,
    col4 VARCHAR2(5) NOT NULL,
    CONSTRAINT uni_col2_uk UNIQUE (col2), -- ���̺� ����
    CONSTRAINT uni_col34_uk UNIQUE (col3, col4) -- ���̺� ����, ���� Ű
);

[����10-14]
INSERT INTO unique_test
VALUES ('A1', 'B1', 'C1', 'D1');
INSERT INTO unique_test
VALUES ('A2', 'B1', 'C1', 'D1'); -- ORA-00001: ���Ἲ ���� ����(HR.SYS_C008445)�� ����˴ϴ�
INSERT INTO unique_test
VALUES ('A2', 'B2', 'C2', 'D2');
INSERT INTO unique_test
VALUES ('A3', '', 'C3', 'D3');
INSERT INTO unique_test
VALUES ('A4', NULL, 'C4', 'D4');

SELECT * FROM unique_test;
INSERT INTO unique_test
VALUES ('A5', 'B5', 'C3', 'D5');

-- 2) ���̺� ���� �� �߰�
-- 2-1. ���̺� ������ ���ǵ� ���������� ���� ����
ALTER TABLE unique_test -- ��� ���̺�
DROP CONSTRAINT uni_col2_uk; -- �������Ǹ�

SELECT *
FROM    unique_test;
-- col2�� �ߺ��� �����͸� ����
INSERT INTO unique_test
VALUES ('A6', 'B5', 'C6', 'D6');
INSERT INTO unique_test
VALUES ('A7', 'B2', 'C7', 'D7');

ALTER TABLE unique_test -- ��� ���̺�
DROP CONSTRAINT uni_col34_uk;

INSERT INTO unique_test
VALUES ('A8', 'B5', 'C1', 'D1');

INSERT INTO unique_test
VALUES ('A9', '', 'C2', 'D2');

-- 2-2. �ٽ� uni_col2_uk�� �߰� / uni_col34_uk
-- �̹� �Էµ� �����Ͱ� �ش� �÷����� unique �ؾ� ��, �׷��� ������ ���� �߻�!
ALTER TABLE unique_test
ADD CONSTRAINT uni_col2_uk UNIQUE (col2);

ALTER TABLE unique_test
ADD CONSTRAINT uni_col34_uk UNIQUE (col3, col4);

-- ORA-02299: ���� (HR.UNI_COL2_UK)�� ��� �����ϰ� �� �� ���� - �ߺ� Ű�� �ֽ��ϴ�
-- 02299. 00000 - "cannot validate (%s.%s) - duplicate keys found"

-- �ε���������,..��� �����͸� ����
TRUNCATE TABLE unique_test;


-- 10.4 PRIMARY KEY / �� Ű, �ֽĺ���
-- ���̺� ���� �����͸� �����ϰ� �ĺ��ϴ� ��������
-- 2�� �̻��� �÷��� ����ؼ� ����Ű ��������
-- 1) ���̺� ������ �÷�����, ���̺� �������� ����
CREATE TABLE dept_test (
    dept_id NUMBER(4),
    dept_name VARCHAR2(30) NOT NULL, -- �÷�����
    CONSTRAINT dept_test_id_pk PRIMARY KEY (dept_id) -- ���̺� ����
);

[����10-22] 10�� �μ� �������� ������ dept_test ���̺� �Է��Ͻÿ�
INSERT INTO dept_test
VALUES (10, '������');
INSERT INTO dept_test
VALUES (10, '���ߺ�');
INSERT INTO dept_test
VALUES ('', '���ߺ�');
INSERT INTO dept_test
VALUES (NULL, '���ߺ�');

-- 2) ���̺� ���� �� �߰�
-- 2-1. ���� dept_test_id_pk ���������� ����
ALTER TABLE dept_test
--ADD CONSTRAINT
DROP CONSTRAINT dept_test_id_pk;


SELECT constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name='DEPT_TEST'; -- �ҹ��ڷ� ���̺�� �ۼ��� ��ȸ�� ����� �ȵǴ� ��찡 ����.
-- 2-2. �ٽ� id_pk ��� ���������� �߰�
-- �̹� �����Ͱ� �ִٸ�, �߰��Ϸ��� PK �������ǿ� ������� �ʴ��� Ȯ�� --> UPDATE / DELTE / TRUNCATE
-- �����Ͱ� ������ ���������� �߰��ϴ°� ����

ALTER TABLE dept_test
ADD CONSTRAINT id_name_complex_pk PRIMARY KEY (dept_id, dept_name); -- ����Ű
-- (�𵨸�) �������� ���ٸ�, 30������ �̳����� �������Ǹ��� ���ϴ� ��Ģ�� ���� ����ϸ� ��.


-- 10.5 FOREIGN KEY / ����Ű, �ܷ�Ű, FK
-- �𵨸� : ���� -> �� : PK,FK, ��������, ����Ƽ�� �Ӽ��� ����, ������Ÿ�� ���� -> ����
-- �������� ����, �������� ==> �θ�, �ڽ�   vs   ���, ����   vs  ��ǰ,  �μ�
-- �θ� ���̺��� �÷��� �����ϴ� �ڽ����̺��� �÷��� �������� ���Ἲ�� �����ϱ� ���� �����ϴ� ��������,
-- NULL ����Ѵ�.
-- �÷�����, ���̺� �������� �����ϰ� ���̺� ���� �� �߰��� �� �ִ�.
-- ����Ű�� ������ �� �ִ�.

-- 1) ���̺� ������ ����(=�÷�����, ���̺� ����)
[����10-26] emp_test ��� ���̺� ���, �̸�, �μ��ڵ�, �����ڵ� �÷��� �����ϰ� departments ���̺��� �μ��ڵ带
                    -- employee_id vs emp_id vs id,...
�����ϴ� ���������� �����Ͻÿ�
desc emp_test;
select *
from departments;

CREATE TABLE emp_test (
    emp_id NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(30) NOT NULL,
    --dept_id NUMBER(4) REFERENCES departments (department_id) -- �÷� �������� ����(1)
    --dept_id NUMBER(4) CONSTRAINT dept_id_fk REFERENCES departments (department_id) -- �÷� �������� ����(2)
    dept_id NUMBER(4),
    job_id VARCHAR2(10),
    CONSTRAINT emp_test_dept_fk FOREIGN KEY (dept_id) REFERENCES departments (department_id) -- ���̺� �������� ����
);

SELECT constraint_name, constraint_type, table_name
FROM    user_constraints
WHERE   table_name='EMP_TEST';

-- departments ���̺� : 10 ~ 270 (�μ��ڵ�)
INSERT INTO emp_Test
VALUES (100,'ȫ�浿',10, 'SA_CLERK');
INSERT INTO emp_Test
VALUES (101,'��浿',1000, 'SA_CLERK');

COMMIT;



-- 2) ���̺� ���� �� �߰�




















