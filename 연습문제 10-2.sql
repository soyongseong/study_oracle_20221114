--[��������10-2]


-- 1. characters ���̺��� email ������ ���� �迪�� ��� ������ ��ȸ�Ͻÿ�
SELECT  *
FROM    characters
WHERE   email IS NULL; -- 6 rows

-- 2. characters ���̺��� ������ �ý��� �ش��ϴ� �����ι��� ��ȸ�Ͻÿ�
-- 2-1. roles ���̺��� '�ý�'�� �ش��ϴ� role_id�� ��ȸ vs character ���̺��� EMAIL�� Ư�� �����������ε�~
-- 2-2. characters ���̺��� role_id�� 2-1�� ���� ������ �����͸� ��ȸ

SELECT  character_name -- 4rows
FROM    characters
--WHERE   role_id = 1002;
--WHERE   email LIKE '%sith%';
WHERE   role_id = ( SELECT role_id
                    FROM    roles
                    WHERE  role_name = '�ý�' ) -- �Ϲ����� ���������� ��ġ
-- ��� ��ġ�� ���� : ��Į�� ��������(SELECT��), �ζ��� �� ��������(FROM��)

-- 3. ���Ǽҵ� 4�� �⿬�� ������ ���� �̸��� ��ȸ�Ͻÿ�
SELECT real_name
FROM    casting
WHERE   episode_id = 4; --3 rows
-- 3-1. ���ݱ��� ������ ���̺� : characters(�迪), star_wars(���Ǽҵ�), roles(����), casting(�迪,�����ι�)
-- 3-2. casting ���̺� ���Ǹ� �ϰ�, ���� �����ʹ� �Է����� �ʾ���
-- �� ���۸� > https://ko.wikipedia.org/wiki/��Ÿ������_�⿬_���_���
truncate table casting;

INSERT INTO casting
VALUES (4, 1, '��ũ �ع�');
INSERT INTO casting
VALUES (4, 2, '�ظ��� ����');
INSERT INTO casting
VALUES (4, 3, 'ĳ�� �Ǽ�');

INSERT INTO casting
VALUES (5, 4, '�ٸ� ��Ͻ�');
INSERT INTO casting
VALUES (5, 5, '���̺�� ���ν�');
INSERT INTO casting
VALUES (5, 6, '���ӽ� �� ����');

INSERT INTO casting
VALUES (6, 7, '�ؼ��� ��Ͼ�');
INSERT INTO casting
VALUES (6, 8, '�ɴ� ����Ŀ');
INSERT INTO casting
VALUES (6, 9, '���� ������');

INSERT INTO casting
VALUES (1, 10, '���� �� ��������');
INSERT INTO casting
VALUES (1, 11, '����ũ ����');
INSERT INTO casting
VALUES (1, 12, '�̴� �ƴ��̵�');

INSERT INTO casting
VALUES (2, 13, '���̵� ũ�����ٽ�');
INSERT INTO casting
VALUES (2, 14, '���� �Ͻ�');
INSERT INTO casting
VALUES (2, 15, '��Ż�� ��Ʈ��');

INSERT INTO casting
VALUES (3, 16, '�丣�Ҷ� ���Ž�Ʈ');
INSERT INTO casting
VALUES (3, 17, '�Ƹ޵� ����Ʈ');
INSERT INTO casting
VALUES (3, 18, '���� ��ũ');

INSERT INTO casting
VALUES (3, 19, '�׹¶� �𸮽�');
INSERT INTO casting
VALUES (3, 20, '���¾� L. �轼');
INSERT INTO casting
VALUES (3, 21, 'ũ�������� ��');

SELECT *
FROM    casting;


-- 4. ���Ǽҵ�5 �⿬�� ������ �迪�̸�, ���� �̸��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
-- �迪���� : characters [character_id : pk]
-- �����̸� : casting [character_id : fk]
-- �����÷� : character_id

-- 4.1 ����Ŭ JOIN 
SELECT  ch.character_name,
        ca.real_name
FROM    characters ch, casting ca        
WHERE   ch.character_id = ca.character_id;

-- 4.2 ANSI JOIN 
SELECT  ch.character_name,
        ca.real_name
FROM    characters ch INNER JOIN casting ca        
--ON   ch.character_id = ca.character_id;
USING   (character_id);



-- 5. �־��� ����Ŭ ���ι��� ANSI �������� �����Ͻÿ�
-- ANSI JOIN : ������ ���̺��� �ִٸ�, 2�� ���̺��� JOIN ����� �ٽ� INNER JOIN / OUTER JOIN �ϴ� ���
SELECT c.character_name, p.real_name, r.role_name
FROM    characters c INNER JOIN casting p
ON   c.character_id = p.character_id
LEFT OUTER JOIN roles r
ON   c.role_id = r.role_id
WHERE     p.episode_id = 2;


SELECT c.character_name, p.real_name, r.role_name
FROM    characters c INNER JOIN casting p
USING   (character_id)
LEFT OUTER JOIN roles r
USING    (role_id)
WHERE     p.episode_id = 2;


-- 6. characters ���̺��� �迪�̸�, �̸���, �̸��� ���̵� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�
-- ��, �̸����� id@jedai.com�϶��� �����Ͻÿ�
SELECT  character_name, 
        email,
        (SUBSTR(email,1,INSTR(email,'@')-1)) email_id
FROM    characters;

SELECT 'character_name@jedai.com',
        SUBSTR('character_name@jedai,com',1,INSTR('character_name@jedai,com','@')-1) id
FROM    dual;


-- 7. ������ �����̿� �ش��ϴ� �迪���� �迪�̸�, ���� ������ �̸��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
-- �������� / �ƿ��� ó�� : ����ŬJOIN(+) vs ANSI JOIN : [LEFT|RIGHT|FULL] OUTER JOIN
-- NULL ó�� : NVL, NVL2, COALESCE
-- ����Ŭ IF ~ ELSE IF : DECODE, CASE WHEN~
SELECT  ch.character_name,
        ca.character_name masters -- ����� ������ ����, null�� �����µ� --> ������ �� ������ ǥ��
FROM    characters ch, characters ca
WHERE   ch.master_id = ca.character_id--���� ���ν�
AND     ch.role_id = 1001; -- �˸�, �𸣸� ��������

-- �������� 10-1, 10-2 Ʈ����� ó��!
COMMIT;

















