-- Copyright (c) 2015 Oracle
--
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-- LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--

LOAD DATA
APPEND
INTO TABLE times
FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '"'
(TIME_ID DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 DAY_NAME,
 DAY_NUMBER_IN_WEEK,
 DAY_NUMBER_IN_MONTH,
 CALENDAR_WEEK_NUMBER,
 FISCAL_WEEK_NUMBER,
 WEEK_ENDING_DAY DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 WEEK_ENDING_DAY_ID,
 CALENDAR_MONTH_NUMBER,
 FISCAL_MONTH_NUMBER,
 CALENDAR_MONTH_DESC,
 CALENDAR_MONTH_ID,
 FISCAL_MONTH_DESC,
 FISCAL_MONTH_ID,
 DAYS_IN_CAL_MONTH,
 DAYS_IN_FIS_MONTH,
 END_OF_CAL_MONTH DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 END_OF_FIS_MONTH DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 CALENDAR_MONTH_NAME,
 FISCAL_MONTH_NAME,
 CALENDAR_QUARTER_DESC,
 CALENDAR_QUARTER_ID,
 FISCAL_QUARTER_DESC,
 FISCAL_QUARTER_ID,
 DAYS_IN_CAL_QUARTER,
 DAYS_IN_FIS_QUARTER,
 END_OF_CAL_QUARTER DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 END_OF_FIS_QUARTER DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 CALENDAR_QUARTER_NUMBER,
 FISCAL_QUARTER_NUMBER,
 CALENDAR_YEAR,
 CALENDAR_YEAR_ID,
 FISCAL_YEAR,
 FISCAL_YEAR_ID,
 DAYS_IN_CAL_YEAR,
 DAYS_IN_FIS_YEAR,
 END_OF_CAL_YEAR DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 END_OF_FIS_YEAR DATE(19) "YYYY-MM-DD-HH24-MI-SS")
