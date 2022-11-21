-- �������� 2-1
-- hr ��ī���� �̿��� ������ �ذ��Ͻÿ�

-- 1. ����� 200�� ����� �̸��� �μ��� ��ȣ�� ��ȸ�Ͻÿ�
-- ���� Į��






-- 2. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� ���, �̸�, �޿� ������ ��ȸ�Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY < 3000
OR    SALARY < 15000


-- 3. �μ� ��ȣ�� 30�� 60�� �Ҽӵ� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�Ͻÿ�
-- �� �̸��� ���ĺ� ������ �����Ͽ� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 60
ORDER BY FIRST_NAME




-- 4. �޿��� 3000���� 15000�̸鼭 �μ� ��ȣ�� 30�� 60�� �Ҽӵ� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�Ͻÿ�
-- �� �̸��� ������ ���ļ� NAME����, ���޿��� MOUTHLY SALARY�� ��ȸ�ϰ� �Ѵ�
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME NAME, SALARY "MOUTHLY SALARY", DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 15000
AND DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 60


-- 5. �Ҽӵ� �μ���ȣ�� ���� ����� ���, �̸�, ���� ID�� ��ȸ�Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL



-- 6. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼��� ��ȸ + Ŀ�̼��� ���� ������� ���� ��� ������ ����
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY 4 DESC


-- 7. �̸��� ���� z�� ���Ե� ����� ����� ����� ��ȸ�Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%'






