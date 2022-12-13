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
-- NULL ó�� : NVL(expr1, expr2), NVL2(expr1,expr2,expr3), COALESCE(null,expr1,expr2,...)
-- ����Ŭ IF ~ ELSE IF : DECODE, CASE WHEN~
-- ����� ������ ����, null�� �����µ� --> ������ �� ������ ǥ��
SELECT *
FROM    characters;

select *
from roles;

SELECT  c.character_name, NVL(d.character_name, '������ ���� ������') masters 
FROM    characters c, characters d, roles r
WHERE   c.master_id = d.character_id(+)
AND     c.role_id = r.role_id
AND     r.role_name = '������'
ORDER BY 1 ;

-- �������� 10-1, 10-2 Ʈ����� ó��!
COMMIT;

-- 8. ������ �����̿� �ش��ϴ� �迪���� �迪�̸�, �̸���, �������� �̸����� ��ȸ�Ͻÿ�
-- P.92 ǥ�� ����
SELECT  c.character_name, c.email JEDAI_EMAIL, m.email MASTER_EMAIL
--        NVL2(c.email, c.email, m.email) MASTER_EMAIL
FROM    characters c, characters m, roles r
WHERE   c.master_id = m.character_id(+)
AND     c.role_id = r.role_id
AND     r.role_name = '������'
ORDER BY 1;


-- 9. ��Ÿ���� �ø�� �⿬ ��� ��,
-- ���Ǽҵ� �̸�, �⿬ ��� ��, �����⵵ ������ ��ȸ�ϴ� ���� �ۼ�
--      [ select ]           [ order by ]
-- star_wars : ��ȭ���� / ���Ǽҵ� ���̵�, ��ȭ����, �����⵵
-- casting : ĳ�������� / ���Ǽҵ� ���̵�, ĳ���� ���̵�, ���� ����̸�

SELECT  s.episode_name, COUNT(*) actor_count
FROM    star_wars s, casting c
WHERE   s.episode_id = c.episode_id
GROUP BY s.episode_name, s.open_year
--HAVING
--ORDER BY 1;

-- =======================================================================
--  casting ������ ���� : �� �迪�� ���� ������ ��� 1ȸ �⿬�� ������ �Էµ� �����ͷ�
--  �׷��Լ� ���� ������ ��ȸ�ϴ� ��� ���� �ø�� �ߺ��ؼ� �⿬�� ���鿡 ���� ������
--  ����� ���� �ʴ� ��Ȳ���� �����ϼ���!!
-- =======================================================================

-- 10.��ü �ø���� �� ��캰 �迪�̸�, �����̸�, �⿬ Ƚ���� ��ȸ
-- �⿬Ƚ���� ���� �迪�̸� , ���� �̸� ������ ��ȸ�Ͻÿ�
-- characters : �迪�̸�
-- casting : �����̸�
-- star_wars : ���Ǽҵ��, �����⵵ (x)
SELECT  ch.character_name �迪�̸�, ca.real_name �����̸�, count(*)
FROM    characters ch, casting ca
WHERE   ch.character_id = ca.character_id
GROUP BY ch.character_name, ca.real_name;
--HAVING
--ORDER BY



--11. 10���� �����Ͽ� �⿬ Ƚ���� ���� ���� 3���� �迪��, �Ǹ�, �⿬ Ƚ���� ��ȸ
-- ROWNUM : ���� ���� �������~ (����, ����) : ������ �Լ� ==> �ǻ� �÷�    vs  ROW_NUMBER()
-- RANK() OVER(ORDER BY ��), DENSE_RANK() OVER(ORER BY��)
-- 1,2,2,4,5,6...           vs   1,2,2,3,4,6...
-- ������ ���� ���� �ǳʶ�     vs   ������ ���� ������ ǥ��
-- �׷��Լ��� ���� : HAVING�� ǥ��

SELECT  ch.character_name �迪�̸�, ca.real_name �����̸�, count(*) �⿬Ƚ��
FROM    characters ch, casting ca
WHERE   ch.character_id = ca.character_id
GROUP BY ch.character_name, ca.real_name;

-- 11-1. ���翡�� ����� ��� : ROWNUM + �ζ��� �� ��������
--
SELECT ROWNUM ranking, e.*
FROM    (   SELECT  ch.character_name �迪�̸�, ca.real_name �����̸�, count(*) �⿬Ƚ��
            FROM    characters ch, casting ca
            WHERE   ch.character_id = ca.character_id
            GROUP BY ch.character_name, ca.real_name
            ORDER BY 1 DESC ) e -- �ζ��� �� : �����δ� �������� �ʴ� ������ / �ӽü� ���̺� (�޸𸮿��� ó��)
WHERE   ROWNUM <= 3;

-- 11-2. RANK() �Ǵ� DENSE_RANK() ����� ���
SELECT  *
FROM    (   SELECT  DENSE_RANK() OVER(ORDER BY COUNT(*)) ranking, ch.character_name �迪�̸�, ca.real_name �����̸�, count(*) �⿬Ƚ��
            FROM    characters ch, casting ca
            WHERE   ch.character_id = ca.character_id
            GROUP BY ch.character_name, ca.real_name    )
WHERE   ROWNUM <= 3;            


-- 12. �ø�� ����� ��찡(=���� ���) �⿬ �ߴ��� ��ȸ
-- ���Ǽҵ� �ø��� ��ȣ, ���Ǽҵ� �̸�, �⿬ ����� ��
-- �⿬ ����� ���� ���� ������ ��ȸ

-- star_wars : ���Ǽҵ� ����
-- casting : ������� ����

SELECT  s.episode_id, s.episode_name, count(*) actor_count
FROM    star_wars s, casting c
WHERE   s.episode_id = c.episode_id
GROUP BY s.episode_id, s.episode_name
--ORDER BY    actor_count DESC;
ORDER BY 3 DESC;

-- 
COMMIT;






















