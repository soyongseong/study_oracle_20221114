--SQL : Structured Query Langguage (����ȭ�� ���Ǿ�) ����
-- 2��. SQL

/*
-- �������
-- <�̰� ���� �ּ� ^�̰� ������ �ּ�
-- ��ɾ� ������ ; ���̱�
-- �Ϲ������δ� ��ҹ��ڸ� �������� �ʴ´�.

-- 2. SQL�� ����



*/

/*
-- ȸ�� ������ �����ϴ� ���̺�
-- ���̵� : ����Ű (�����͸� �ĺ��ϱ� ���� ���������� ���� Ű)
-- �̸� ���� ��ȭ��ȣ �ּ� �̸��� 

*/



CREATE TABLE userTBL
 id number,
 name varchar2(20),
 age number,
 phone char (13),
 addr varchar2 (50),
 email varchar2 (30),
 reg_data date
);


-- 2.���̺� ������ ���� : DML (�����ͺ��̽� ���۾��)



INSERT INTO userTBL (id, name, age, phone, addr, email, reg_date)
VALUES (1, 'ȫ�浿', 20, '010-1234-5678', 'gwangju, seo-gu', 'hong@naver.com', SYSDATE);




DROP TABLE USERTBL;




