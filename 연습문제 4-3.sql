HAVING  ROUND(AVG(salary)) >= 8000
ORDER BY    1; -- 6rows
--
--
--3. 년도, 년도별로 입사한 사원수를 조회하는 쿼리문을 작성하시오
--(단, 년도는 2014의 형태로 표기되도록 하시오)
SELECT  TO_CHAR(hire_date, 'YYYY') year, -- CHAR
        COUNT(hire_date) cnt
FROM    employees
--GROUP BY hire_date -- 98 rows
GROUP BY TO_CHAR(hire_date, 'YYYY') -- 8rows
ORDER BY 1;

/* 
YEAR   CNT
-----------
2001	1
2002	1
2002	1
2002	4
2002	1
....
2003	1
2004	1
2004	1
2004	1
2004	1
2004	1
*/
-- ====================================================
-- group by 절에 그룹의 기준되는 컬럼 그리고 그 타입도 유의
-- ====================================================
/*
YEAR   CNT
------------
2001	1
2002	7
2003	6
2004	10
2005	29
2006	24
2007	19
2008	11
*/
