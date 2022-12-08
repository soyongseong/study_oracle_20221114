--[��������10-1]

--������ ���̺��� �����Ͻÿ� (1~3)

-- 1. STAR_WARS (��ȭ����)
-- 1-1. ���� â���� hanul > ���̺� : ��Ŭ��-�� ���̺�...
-- 1-2. DDL�� ���� �ۼ�

CREATE TABLE star_wars (
    episode_id NUMBER(5), --PRIMARY KEY --�÷� ���� : �������Ǹ� SYS_CXXXX ����
    episode_name VARCHAR2(50),
    open_year   NUMBER(4),
    CONSTRAINT episode_id_pk PRIMARY KEY (episode_id) -- ���̺� ���� : �������Ǹ��� ���ܸ���ϰ�~
);

-- 2. CHARACTERS (�����ι�)
CREATE TABLE characters (
    character_id NUMBER(5), --PRIMARY KEY --�÷� ���� : �������Ǹ� SYS_CXXXX ����
    character_name VARCHAR2(30),
    master_id NUMBER(5),
    role_id   NUMBER(4),
    email VARCHAR(40),
    CONSTRAINT character_id_pk PRIMARY KEY (character_id) -- ���̺� ���� : �������Ǹ��� ���ܸ���ϰ�~
);
-- 3. CASTING (�����ι�-���� �������)
CREATE TABLE casting (
    episode_id NUMBER(5), --PRIMARY KEY --�÷� ���� : �������Ǹ� SYS_CXXXX ����
    character_id NUMBER(5),
    real_name   VARCHAR2(30)
);


-- 4. STAR_WARS ���̺� ���� 88��, �����͸� �Է��Ͻÿ�
-- DML + COMMIT / ROLLBACK;
INSERT INTO star_wars
VALUES (4, '���ο� ���(A New Hope)', 1977);
INSERT INTO star_wars 
VALUES (5, '������ ����(The Empire Strikes Back)', 1980);
INSERT INTO star_wars 
VALUES (6, '�������� ����(Return of the Jedi)', 1983);
INSERT INTO star_wars 
VALUES (1, '������ �ʴ� ����(The Phantom Menace)', 1999);
INSERT INTO star_wars 
VALUES (2, 'Ŭ���� ����(Attack of the Clones)', 2002);
INSERT INTO star_wars 
VALUES (3, '�ý��� ����(Revenge of the Sith)', 2005);

SELECT *
FROM    star_wars;

-- 5. CHARACTERS ���̺� ���� 89�� �����͸� �Է��Ͻÿ�
INSERT INTO characters (character_id, character_name, email)
VALUES (1, '��ũ ��ī�̿�Ŀ', 'luke@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (2, '�� �ַ�', 'solo@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (3, '���̾� ����', 'leia@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (4, '����� �ɳ��', 'Obi-Wan@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (5, '�پ� ���̴�', 'vader@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (6, '�پ� ���̴�(��Ҹ�)', 'vader_voice@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (7, 'C-3PO', 'c3po@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (8, 'R2-D2', 'r2d2@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (9, '���ī', 'Chewbacca@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (10, '���� Į���þ�', NULL);
INSERT INTO characters (character_id, character_name, email)
VALUES (11, '���', 'yoda@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (12, '�پ� �õ�', 'sidious@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (13, '�Ƴ�Ų ��ī�̿�Ŀ', 'Anakin@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (14, '���̰� ��', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (15, '�ƹ̴޶� ����', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (16, '�Ƴ�Ų ��Ӵ�', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (17, '���ں�ũ��(��Ҹ�)', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (18, '�پ� ��', 'maul@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (19, '��� ��', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (20, '������ ����', 'windu@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (21, '���� ����', 'dooku@jedai.com');

SELECT *
FROM    characters;

-- 6. ROLES ���̺� ����, 89�� ������ ����
CREATE TABLE roles (
    role_id NUMBER(4),
    role_name VARCHAR2(9)
);

INSERT INTO roles VALUES (1001, '������');
INSERT INTO roles VALUES (1002, '�ý�');
INSERT INTO roles VALUES (1003, '�ݶ���');

SELECT * FROM   roles;


-- 7. CHARATERS ���̺��� ROLE_ID �÷��� �����Ͱ� ROLES ���̺��� ROLE_ID �÷��� �����͸� �����ϵ��� / �ܷ�Ű(FK)
-- CHARACTERS ���̺� ����Ű�� �����Ͻÿ�
-- 7-1. roles ���̺��� role_id�� PK�� ����
ALTER TABLE roles
ADD CONSTRAINT roles_id_pk PRIMARY KEY (role_id);

SELECT  constraint_name, constraint_type
FROM    user_constraints
WHERE   table_name = 'ROLES';

-- 7-2. characters ���̺��� role_id�� roles ���̺��� role_id�� �����ϵ���
ALTER TABLE characters
ADD CONSTRAINT roles_id_fk FOREIGN KEY (role_id) REFERENCES roles (role_id);
                           -- charaters �÷�(fk)             -- roles pk �÷�
-- pk : unique + not null
-- fk : null ��� (unique�� ���)

-- 8. characters ���̺��� role_id���� ����
-- �̸����� sith��, 1002
-- �̸����� alliance��, 1003
-- �̸����� jedai�� 1001 (������ ����..)

UPDATE characters
SET role_id = 1002
WHERE   email LIKE '%sith%'; --4 rows

UPDATE characters
SET role_id = 1003
WHERE   email LIKE '%alliance%'; --5 rows

UPDATE characters
SET role_id = 1001
WHERE   email LIKE '%jedai%'; -- 6rows by EMAIL

-- ���̰� �� : �̸����� ���� (jedai)
UPDATE characters
SET role_id = 1001
WHERE   character_name = '���̰� ��';

SELECT *
FROM    characters;


-- 9. CHARACTERS ���̺��� MASTER_ID (����-����) �÷��� EMPLOYEES�� ���-�Ŵ��� ����� ���� ����
-- CHARACTERS ���̺��� character_id�� master_id�� �����ؼ� master_id�� ����
UPDATE characters
SET master_id = (   SELECT character_id
                    FROM   characters
                    WHERE  character_name = '����� �ɳ��' ) -- ��������
WHERE   character_name IN ('�Ƴ�Ų ��ī�̿�Ŀ', '��ũ ��ī�̿�Ŀ');

UPDATE characters
SET master_id = (   SELECT character_id
                    FROM   characters
                    WHERE  character_name = '���' ) -- ��������
WHERE   character_name IN ('������ ����', '���� ����');

UPDATE characters
SET master_id = (   SELECT character_id
                    FROM   characters
                    WHERE  character_name = '�پ� �õ�' ) -- ��������
WHERE   character_name IN ('�پ� ���̴�', '�پ� ��');

UPDATE characters
SET master_id = (   SELECT character_id
                    FROM   characters
                    WHERE  character_name = '���̰� ��' ) -- ��������
WHERE   character_name = '����� �ɳ��';

UPDATE characters
SET master_id = (   SELECT character_id
                    FROM   characters
                    WHERE  character_name = '���� ����' ) -- ��������
WHERE   character_name = '���̰� ��';

SELECT *
FROM characters;


-- 10. CASTING ���̺��� EPISODE_ID, CHARACTER_ID�� ���� STAR_WARS, CHARACTERS ���̺��� ID�� �����ϴ�
-- �ܷ�Ű�� �����Ͻÿ�
-- II. (�̹� ������� ���̺�) �ܷ�Ű ���������� �߰�
ALTER TABLE casting
ADD CONSTRAINT episode_id_fk FOREIGN KEY (episode_id) REFERENCES star_wars (episode_id);
--�������� �߰�       [�̸�]     [��������]    [�ش��÷�]    ���� ����  [���̺�] [�÷�]
ALTER TABLE casting
ADD CONSTRAINT character_id_fk FOREIGN KEY (character_id) REFERENCES characters (character_id); 

SELECT  constraint_name, constraint_type, owner
FROM    user_constraints
WHERE   table_name = 'CASTING';

/* ��������
    -- �������� ���Ἲ�� �����ϱ� ���� --> �÷��� �߸��� �����Ͱ� �Էµ��� �ʵ��� --> ���ռ� ����!
    -- NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY
    -- DEFAULT : <���������� �ƴ�>
    I. ���̺� ������ �÷����� or ���̺� ���� ���� [CREATE]
    CREATE TABLE ���̺�� (
        �÷���1 ������Ÿ��1 ��������1, -- �÷� ����
        �÷���2 ������Ÿ��2,
        CONSTRAINT ���������̸� �������� (�ش��÷�) --���̺� ����
    )
    II. ���̺� ���� �� �ش� �÷��� �������� �߰� [ALTER]
    ALTER TABLE ���̺��
    ADD CONSTRAINT ���������̸� �������� (�ش��÷�);
*/





