--[��������3-2]

-- 1. ��� ���̺��� �̸�(first_name)�� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̸� ��ȸ�Ͻÿ�
SELECT  employee_id, first_name, LENGTH(first_name) name_length
FROM    employees
WHERE   first_name LIKE 'A%' -- % : ���� ���ڿ�, _ : �Ѱ� ����
ORDER BY 1; -- 10 rows


-- 2. 80�� �μ����� �̸��� �޿��� ��ȸ�Ͻÿ�
-- ��, �޿��� 15�� ���̷� ���ʿ� $ ��ȣ�� ä���� ���·� ǥ���Ѵ�.
-- LPAD, RPD : �߰�
-- LTRIM, RTRIM, TRIM : ����
-- SUBSTR : ����
-- INSTR : Ư�� ������ ���� ��ġ�� ��ȯ
-- REPLACE, TRANSLATE : ���ڿ����� Ư�� ���ڸ� ã�Ƽ� ��ȯ or 1:1��ȯ
-- LENGTH : ���ڿ��� ���̸� ��ȯ
SELECT  employee_id, first_name, LPAD(salary, 15, '$') salary
FROM    employees
WHERE   department_id = 80; -- 34 rows



-- 3. 60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ�� ��ȸ�ϴ�
-- �������� �ۼ��Ͻÿ�
-- ��, ������ȣ�� Local Number��� ǥ���ϰ� ������� 515.123.4169��� ��ȭ��ȣ���� 515�� Local Number �̴�.
SELECT  employee_id, first_name, 
        SUBSTR(phone_number, 1, INSTR(phone_number, '.')-1) "Local Number", -- ����(ù ��ȣ)
        SUBSTR(phone_number, INSTR(phone_number, '.')+1) "Extra Number"        
FROM    employees
WHERE   department_id IN (60, 80, 100)
ORDER BY 1; -- 45 rows


