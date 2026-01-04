SELECT * FROM customer_data;

-- Count and Customer distribution by gender
SELECT
  Gender,
  COUNT(*) AS TotalCount,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_data), 2) AS Percentage
FROM customer_data
GROUP BY Gender;

-- count and customer distribution by contract type
SELECT
  Contract,
  COUNT(*) AS TotalCount,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_data), 2) AS Percentage
FROM customer_data
GROUP BY Contract;

-- group customer by customer status(stayed/churned/joined), and calculate total revenue and revenue share in each group
SELECT
  Customer_Status,
  COUNT(*) AS TotalCount,
  SUM(IFNULL(Total_Revenue, 0)) AS TotalRev,
  ROUND(
    SUM(IFNULL(Total_Revenue, 0)) * 100.0 /
    (SELECT SUM(IFNULL(Total_Revenue, 0)) FROM customer_data),
    2
  ) AS RevPercentage
FROM customer_data
GROUP BY Customer_Status;

-- count and customer distribution by state
SELECT
  State,
  COUNT(*) AS TotalCount,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_data), 2) AS Percentage
FROM customer_data
GROUP BY State
ORDER BY Percentage DESC;




-- separate churn data (churned and stayed customers) from newly joined customers
-- first view: keeps only customers who either churned or stayed
CREATE VIEW vw_ChurnData AS
SELECT *
FROM clean_churn
WHERE Customer_Status IN ('Churned', 'Stayed');

-- second view: Newly Joined customer have not completed a full lifecycle. Including them would bias churn rate and models
CREATE VIEW vw_JoinData AS
SELECT *
FROM clean_churn
WHERE Customer_Status = 'Joined';

SELECT * FROM vw_ChurnData;
SELECT * FROM vw_JoinData;
SELECT * FROM clean_churn;



