SELECT * FROM vickydb.ci_customers;
select * from ci_customers;

select distinct loan_type
from ci_customers;

SELECT loan_type,
       Count(*) AS Number_of_loans
    FROM   ci_customers
  GROUP  BY loan_type;
  
 
 
 SELECT loan_type,
       Count(account_no) AS count_of_loans
FROM   ci_loan
WHERE  credit_score < 580
GROUP  BY loan_type;

SELECT *
FROM   ci_loan
WHERE  credit_score < 580
       AND loan_type ="hl"
ORDER  BY credit_score 

SELECT  b.if_default,
       Avg(annual_income) AS Average_annual_income
FROM    ci_customers a
       INNER JOIN ci_loan b
               ON a.account_no = b.account_no
WHERE   b.credit_score > 700
  GROUP  BY b.if_default 
  
  SELECT  a.marital_status,
       Avg(b.credit_score) AS Average_credit_Score
FROM    ci_customers a
       INNER JOIN CI_loan b
               ON a.account_no = b.account_no
GROUP   BY a.marital_status; 

SELECT a.education_level,
       Sum(b.if_default) as default_count
FROM   ci_customers a
       INNER JOIN ci_loan b
              ON a.account_no = b.account_no
  GROUP  BY a.education_level
HAVING default_count >= 5 

select * from ci_economics


SELECT
 a.report_month,
       a.Real_GDP (in Lakh Crore),
       a.unemp_rate,
       Count(b.account_no) AS count_of_loans
FROM  
 ci_economics a
       LEFT JOIN ci_loan b
              ON Year(a.report_month) = Year(b.start_date)
                 AND Month(a.report_month) = Month(b.start_date)
GROUP  BY a.report_month,
          a.Real_GDP (in Lakh Crore),
          A.unemp_rate
ORDER 
BY a.unemp_rate ASC
