
use mysql_project;

-- KPI 1 -- POLICY STATUS WISE POLICY COUNT
SELECT 
    ifnull(status,'Grand Total') AS `Policy Status`,
    COUNT(policy_id) AS `No. of Policies`
FROM
    policy_details
WHERE
    status in ('lapsed' or 'active' or 'terminated')
GROUP BY status with rollup;

-- KPI 2 -- MULTI POLICY CUSTOMERS

SELECT 
    COUNT(DISTINCT customer_id) AS `Total No. of Customers`
FROM
    policy_details;

-- KPI 3 -- AGE-BUCKET WISE POLICY COUNT
SELECT 
    CASE
        WHEN `Age Group` IS NULL THEN 'Grand Total'
        ELSE `Age Group`
    END AS `Age Group`,
    `No. of Policies`
FROM (
    SELECT 
        CASE 
            WHEN Age BETWEEN 18 AND 25 THEN '18-25'
            WHEN Age BETWEEN 26 AND 35 THEN '26-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            WHEN Age BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END AS `Age Group`,
        COUNT(policy_id) AS `No. of Policies`
    FROM policy_details
    INNER JOIN `customer information`
        ON policy_details.customer_id = `customer information`.`Customer ID`
    GROUP BY `Age Group` WITH ROLLUP
) AS Temp;


-- KPI 4 -- GENDER WISE POLICY COUNT
SELECT 
    ifnull(gender, 'Grand Total') as Gender, COUNT(policy_id) AS `No. of Policies`
FROM
    policy_details
        INNER JOIN
    `customer information`
WHERE
    policy_details.customer_id = `customer information`.`Customer ID`
GROUP BY Gender with rollup;

-- KPI 5 -- POLICY TYPE WISE POLICY COUNT
SELECT 
    ifnull(policy_type, 'Grand Total') as 'Policy Type', COUNT(policy_id) AS `No. of Policies`
FROM
    policy_details
GROUP BY policy_type with rollup;

-- KPI 6 -- POLICIES EXPIRING THIS YEAR
SELECT 
    YEAR(policy_end_date) AS `Current Year`,
    COUNT(policy_id) AS `Expiring Policies`
FROM
    policy_details
WHERE
    YEAR(policy_end_date) = '2026'
GROUP BY `Current Year`;



-- KPI 7
-- YoY
WITH CTE AS (
    SELECT
        YEAR(Policy_Start_Date) AS Year,
        concat(round(SUM(Premium_Amount)/1000,2),'K') AS Total_Premium
    FROM policy_details
    GROUP BY YEAR(Policy_Start_Date)
)
SELECT
    Year,
    Total_Premium,
    ifnull(LAG(Total_Premium) OVER (ORDER BY Year),'NA') AS Previous_Year_Premium,
    ifnull(concat(ROUND(
        ((Total_Premium - LAG(Total_Premium) OVER (ORDER BY Year))
        / LAG(Total_Premium) OVER (ORDER BY Year)) * 100,
        2
    ),"%"),'NA') AS YoY_Growth_Percentage
FROM CTE
ORDER BY Year;

-- KPI7 QoQ
WITH CTE AS (
    SELECT
        quarter(Policy_Start_Date) AS Quarter_,
        concat(round(SUM(Premium_Amount)/1000,2),'K') AS Total_Premium
    FROM policy_details
    GROUP BY Quarter(Policy_Start_Date)
)
SELECT
    Quarter_,
    Total_Premium,
    ifnull(LAG(Total_Premium) OVER (ORDER BY Quarter_),'NA') AS Previous_Year_Premium,
    ifnull(concat(ROUND(
        ((Total_Premium - LAG(Total_Premium) OVER (ORDER BY Quarter_))
        / LAG(Total_Premium) OVER (ORDER BY Quarter_)) * 100,
        2
    ),"%"),'NA') AS QoQ_Growth_Percentage
FROM CTE
ORDER BY Quarter_;


-- KPI 7
-- MoM
WITH CTE AS (
    SELECT
        MONTH(Policy_Start_Date) AS Month_No,
        MONTHNAME(Policy_Start_Date) AS Months,
        concat(round(SUM(Premium_Amount)/1000,2),'K') AS Total_Premium
    FROM policy_details
    GROUP BY MONTH(Policy_Start_Date), MONTHNAME(Policy_Start_Date)
)
SELECT
    Months,
    ifnull(LAG(Total_Premium) OVER (ORDER BY Month_No),"NA") AS Previous_Month_Premium,
    ifnull(CONCAT(
        ROUND(
            (
                (Total_Premium - LAG(Total_Premium) OVER (ORDER BY Month_No))
                / LAG(Total_Premium) OVER (ORDER BY Month_No)
            ) * 100,
            2
        ),
        '%'
    ), "NA") AS MoM_Growth_Percentage
FROM CTE
ORDER BY Month_No;


-- KPI 8 -- CLAIM STATUS WISE POLICY COUNT
SELECT 
    IFNULL(`Claim Status`, 'Grand Total') AS `Claim Status`,
    COUNT(*) AS Policy_Count
FROM
    claims
GROUP BY `Claim Status` WITH ROLLUP;

-- KPI 9 -- PAYMENT STATUS WISE POLICY COUNT
SELECT 
    IFNULL(`Payment Status`, 'Grand Total') AS `Payment Status`,
    COUNT(*) AS Policy_Count
FROM
    `payment history`
GROUP BY `Payment Status` WITH ROLLUP;


-- KPI 10 TOTAL CLAIM AMOUNT
SELECT 
    `Claim Status`,
    CONCAT(ROUND(SUM(`claim amount`) / 1000000, 2),
            'M') AS Total_Claim_Amount
FROM
    claims
WHERE
    `Claim Status` = 'Approved'
GROUP BY `Claim Status`;

