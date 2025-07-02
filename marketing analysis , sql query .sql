-- Use the Marketing_Analytics database
USE Marketing_Analysis;

-- Create the 'customers' table
CREATE TABLE customers (
  ID INT PRIMARY KEY,
  Age INT,
  Gender VARCHAR(10),
  Income INT,
  Spending_Score INT,
  Membership_Years INT,
  Purchase_Frequency INT,
  Category VARCHAR(50),
  Last_Purchase_Amount FLOAT
);

-- View all customer records
SELECT * FROM customers;

-- KPI 1: Total number of customers
-- 📌 Shows how many customers are in the table
SELECT COUNT(*) AS Total_Customers FROM customers;

-- KPI 2: Gender distribution
-- 📌 Counts number of customers by gender
SELECT 
  Gender, 
  COUNT(Gender) AS Count_Gender 
FROM 
  customers
GROUP BY 
  Gender;

-- KPI 3: Average Income and Spending Score by Category
-- 📌 Helps understand which product categories are linked to high income and spending behavior
SELECT 
  Category,  
  ROUND(AVG(Income), 2) AS Average_Income,
  ROUND(AVG(Spending_Score), 2) AS Average_Spending_Score
FROM 
  customers
GROUP BY 
  Category
ORDER BY 
  Average_Spending_Score DESC;

-- KPI 4: High-value customers by recent purchase amount
-- 📌 Filters customers who made purchases greater than $500, sorted by purchase size
SELECT * 
FROM 
  customers 
WHERE 
  Last_Purchase_Amount > 500
ORDER BY 
  Last_Purchase_Amount DESC;

-- KPI 5: Total revenue by product category
-- 📌 Aggregates total purchase amount by category to show revenue distribution
SELECT 
  Category, 
  ROUND(SUM(Last_Purchase_Amount), 2) AS Revenue_Product
FROM 
  customers
GROUP BY 
  Category 
ORDER BY 
  Revenue_Product DESC;

-- KPI 6: Customer distribution by age group
-- 📌 Categorizes customers into age brackets and counts how many fall into each
SELECT
  CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 35 THEN '25–35'
    WHEN Age BETWEEN 36 AND 50 THEN '36–50'
    WHEN Age > 50 THEN '51+'
  END AS Age_Group,
  COUNT(*) AS Total_Customers
FROM
  customers
GROUP BY
  Age_Group
ORDER BY
  Total_Customers DESC;

