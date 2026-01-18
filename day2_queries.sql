Day 2: Data Preview & Metrics

Total orders in the dataset
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM customer_data;

/*
Result:
total_orders = 25900
*/



“The dataset spans approximately one year, allowing customer retention and churn behaviour to be analysed over time.”

-- Date range of transactions
SELECT 
  MIN(InvoiceDate) AS first_order_date,
  MAX(InvoiceDate) AS last_order_date
FROM customer_data;

/*
Result:
first_order_date = 2010-12-01
last_order_date  = 2011-12-09
*/



-- Rows with missing CustomerID (excluded from retention analysis)
SELECT COUNT(*) AS missing_customerid_rows
FROM customer_data
WHERE CustomerID IS NULL;

/*
Result:
missing_customerid_rows = 135080
*/




If a recruiter asks:

“How did you handle missing customer data?”

You can confidently say:

“I excluded transactions with null CustomerID before retention and churn analysis to ensure accurate customer-level insights.

-- “Analysis shows that repeat customers significantly outnumber one-time customers, indicating strong customer retention and loyalty within the business.”

-- One-time vs Repeat Customers (excluding NULL CustomerID)
WITH customer_orders AS (
  SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS order_count
  FROM customer_data
  WHERE CustomerID IS NOT NULL
    AND Quantity > 0
  GROUP BY CustomerID
)
SELECT
  CASE
    WHEN order_count = 1 THEN 'One-time'
    ELSE 'Repeat'
  END AS customer_type,
  COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_type;

/*
Result:
One-time customers = 1489
Repeat customers   = 2845
*/



