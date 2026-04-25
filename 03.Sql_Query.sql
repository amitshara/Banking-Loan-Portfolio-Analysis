-- Solving these EDA Question using PostgreSQL

'Q1.What is the overall default rate?
Q2.How many loans are issued per term?
Q3.Default rate by income group
Q4.Does high DTI lead to default?
Q5.Default rate by credit utilization
Q6.Impact of Bank currupcy
Q7. Does interest rate impact default?
Q8. Default rate by loan amount range
Q9. Default rate by employment length
Q10. Default rate by home ownership'




CREATE TABLE loans1 (
    loan_amnt               NUMERIC(12, 2)        NOT NULL,
    term                    INTEGER               NOT NULL,
    int_rate                NUMERIC(6, 4)         NOT NULL,
    installment             NUMERIC(10, 2)        NOT NULL,
    grade                   VARCHAR(2)            NOT NULL,
    sub_grade               VARCHAR(5)            NOT NULL,
    emp_length              NUMERIC(4, 1)         NOT NULL,
    home_ownership          VARCHAR(20)           NOT NULL,
    annual_inc              NUMERIC(14, 2)        NOT NULL,
    verification_status     VARCHAR(30)           NOT NULL,
    issue_d                 VARCHAR(10)           NOT NULL,
    loan_status             BIGINT                NOT NULL,
    purpose                 VARCHAR(50)           NOT NULL,
    dti                     NUMERIC(8, 4)         NOT NULL,
    earliest_cr_line        TIMESTAMPTZ           NOT NULL,
    open_acc                NUMERIC(6, 1)         NOT NULL,
    pub_rec                 NUMERIC(6, 1)         NOT NULL,
    revol_bal               NUMERIC(14, 2)        NOT NULL,
    revol_util              NUMERIC(6, 2)         NULL,     -- 252 nulls
    total_acc               NUMERIC(6, 1)         NOT NULL,
    initial_list_status     VARCHAR(5)            NOT NULL,
    application_type        VARCHAR(30)           NOT NULL,
    mort_acc                NUMERIC(6, 1)         NOT NULL,
    pub_rec_bankruptcies    NUMERIC(6, 1)         NULL,     -- 518 nulls
    credit_history_years    INTEGER               NOT NULL,
    loan_income_ratio       NUMERIC(10, 4)        NOT NULL,
    credit_utilization      NUMERIC(8, 4)         NOT NULL
);

select * from loans1;


'Q1.What is the overall default rate?'

select count(*) as total_loan,
sum(case when loan_status = 1 then 1 else 0 end) as total_default,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/ count(*)) as default_rate
from loans1;


'Q2.How many loans are issued per term?'

select term , count(*) from loans1
group by term;



'Q3. Default rate by income group'

select (case
when annual_inc < 30000 then 'Low Income'
when annual_inc between 30000 and 70000 then 'Medium Income'
else 'High Income' END) as income_group,
count(*) as total_loan,
sum(case when loan_status = 1 then 1 else 0 end) as total_default,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/count(*),2) as default_rate
from loans1
group by income_group;


'Q4. Does high DTI lead to default?'

SELECT 
ROUND(dti,0) AS dti_bucket,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults_rate,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/count(*),2) as default_rate
FROM loans1
GROUP BY dti_bucket
ORDER BY dti_bucket;

'Q5. Default rate by credit utilization'

SELECT 
ROUND(revol_util,0) AS util_bucket,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults
FROM loans1
GROUP BY util_bucket
ORDER BY util_bucket;


'Q6.Impact of Bank currupcy'

SELECT 
pub_rec_bankruptcies,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults
FROM loans1
GROUP BY pub_rec_bankruptcies;

'Q7. Does interest rate impact default?'

SELECT 
ROUND(int_rate,1) AS rate,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults
FROM loans1
GROUP BY rate
ORDER BY rate;

'Q8. Default rate by loan amount range'

SELECT 
CASE 
WHEN loan_amnt < 5000 THEN 'Small'
WHEN loan_amnt BETWEEN 5000 AND 15000 THEN 'Medium'
ELSE 'Large'
END AS loan_size,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/ count(*)) as default_rate
FROM loans1
GROUP BY loan_size;

'Q9. Default rate by employment length'

SELECT 
emp_length,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/ count(*)) as default_rate
FROM loans1
GROUP BY emp_length
ORDER BY emp_length;

'Q10. Default rate by home ownership'

SELECT 
home_ownership,
COUNT(*) AS total,
SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
ROUND( sum(case when loan_status = 1 then 1 else 0 end)*100/ count(*)) as default_rate
from loans1
group by home_ownership
order by COUNT(*) desc;