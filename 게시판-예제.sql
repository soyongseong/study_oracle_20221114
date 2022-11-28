-- ���� ���� JOIN ������ �غ���

-- ������ ������ ����?! ����, ���...
-- ======================== �𵨸� =============================
-- ��� vs �μ� <---> ������ �ľ� : ex> ERP �ý��� (�系 �ڿ��� ���� �ý���)
-- ����Ƽ : ���Ǽ����� ��ü(���, ����,..) ==> ��ǻ�� ���� ===> TABLE
-- ��Ʈ����Ʈ(=�Ӽ�) : �̸�, ���, �޿� ...              ===> COLUMN
-- ����� �μ��� ���Եȴ� (����)     vs    ��      : (�Խ��ǿ�) ���Եȴ�     vs   ��      : �����Ѵ�\
                                       �ۼ���   
-- �μ��� ����� �����Ѵ� (����)     vs    �Խ���   :          �����Ѵ�     vs   ��ǰ      : ���ŵǾ�����
-- ������ ������ ��ǻ�� ������ �ű�� ���� <--> �𵨸�! [�𵨷�, DBA]
--        �ý����� �����ϴ� ���α׷��� ����, UI �ۼ� : ������

-- �� ����Ƽ <--> POST ���̺��� �ۼ�
-- ���� �Խ��� : ex> �⼮ �Խ���, ���� �Խ���....
CREATE TABLE POST (
    post_id NUMBER PRIMARY KEY,
    post_title VARCHAR2(30) NOT NULL,
    post_writer NUMBER NOT NULL,
    post_date DATE DEFAULT SYSDATE
);

-- �ۼ��� �Խ��� : ������� ���� ����� ���� ������ ���..�̸�/�̸���/��ȭ��ȣ
CREATE TABLE WRITER (
    writer_id NUMBER PRIMARY KEY,
    writer_name VARCHAR2(30) NOT NULL,
    writer_date DATE DEFAULT SYSDATE,
    writer_email VARCHAR2(50)
)
-- �ܷ�Ű ��������(FK)
ALTER TABLE POST
ADD CONSTRAINT post_writer_fk FOREIGN KEY (post_writer) REFERENCES WRITER (writer_id);

-- �ƹ� �ۼ��ڸ� �Է� ����  +  FK �������� : writer�� ���� ����ڰ� post�� ������� ���ϰ�
-- 1. writer ������ �Է�
INSERT INTO WRITER
VALUES (1, 'ȫ�浿', SYSDATE, 'gildong@naver.com');
INSERT INTO WRITER
VALUES (2, '��浿', SYSDATE, 'gildong222222@naver.com');
INSERT INTO WRITER
VALUES (3, '�ڱ浿', SYSDATE, 'gildong333333@naver.com');

SELECT *
FROM    post;

-- 2. post ������ �Է�
INSERT INTO POST
VALUES (0001, '����Ŭ DBMS�� �н��ϱ�', 1, SYSDATE);
INSERT INTO POST
VALUES (0002, 'ȥ�ڰ����ϴ� JAVA ��ȭ', 1, SYSDATE);
INSERT INTO POST
VALUES (0003, '1�� �������� ���ι�', 2, SYSDATE);

-- JOIN ��ȸ
-- ����Ŭ ����
SELECT  p.post_id, p.post_title,
        w.writer_name
FROM    post p, writer w
WHERE   p.post_writer = w.writer_id;




