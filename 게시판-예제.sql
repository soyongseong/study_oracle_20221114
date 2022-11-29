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
VALUES (0001, 'ȫ�浿, �⼮�Ϸ�!', 1, SYSDATE, 0001);
INSERT INTO POST
VALUES (0002, '���� ���� �߿���!', 1, SYSDATE, 0002);
INSERT INTO POST
VALUES (0003, 'ORACLE ��ġ���?', 2, SYSDATE, 0003);

SELECT *
FROM    post;
-- JOIN ��ȸ
-- ����Ŭ ����
SELECT  p.post_id, p.post_title, p.post_date write_date,
        w.writer_name, w.writer_email
FROM    post p, writer w
WHERE   p.post_writer = w.writer_id;

--BOARD ���̺� �߰�
CREATE TABLE BOARD (
    board_id NUMBER(4) PRIMARY KEY,
    board_name VARCHAR2(30) NOT NULL,
    board_date DATE DEFAULT SYSDATE
);

-- ���õ�����
INSERT INTO BOARD
VALUES  (0001, '�⼮ �Խ���', TO_DATE('22/11/14'));
INSERT INTO BOARD
VALUES  (0002, '���� �Խ���', TO_DATE('22/11/14'));
INSERT INTO BOARD
VALUES  (0003, '�����亯 �Խ���', TO_DATE('22/11/14'));


SELECT * 
FROM    POST;

SELECT * 
FROM    BOARD;

-- POST�� BOARD �̸� ������ ��ȸ
SELECT  p.POST_ID, p.POST_TITLE, p.POST_DATE, 
        b.BOARD_NAME
FROM    POST p, BOARD b       
WHERE   p.POST_BOARD = b.board_id;





