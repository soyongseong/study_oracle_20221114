-- [�������� 3-5]
-- ����� ���, �̸�, ����(�ڵ�), ��������� ��ȸ
-- DESCODE �Լ��� CASE ǥ�������� �ۼ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,
       DECODE (
               JOB_ID, 'AD_PRES', 'A',
                       'ST_MAN', 'B',
                       'IT_PROG', 'C',
                       'SA_REP', 'D',
                       'ST_CLERK', 'E',
                       'X'               
               ) GRADE
FROM EMPLOYEES
ORDER BY GRADE


SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,
      case JOB_ID WHEN 'AD_PRES' THEN 'A'
           WHEN 'ST_MAN' THEN 'B'
           WHEN 'IT_PROG' THEN 'C'
           WHEN 'SA_REP' THEN 'D'
           WHEN 'ST_CLERK' THEN 'E'
           ELSE 'X'
           END GRADE
FROM EMPLOYEES
ORDER BY GRADE


























