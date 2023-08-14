SELECT emp.firstName, emp.lastName, mdl.model, count(model) as qty,
  rank() OVER(PARTITION BY sls.employeeId
              ORDER BY count(model) DESC) as Rank
FROM sales sls
JOIN employee emp USING(employeeId)
JOIN inventory env USING(inventoryId)
JOIN model mdl USING(modelId)
GROUP BY emp.firstName, emp.lastName, mdl.model;




SELECT strftime('%Y', soldDate) as year,
        strftime('%m', soldDate) as month,
        SUM(salesAmount) as salesAm
FROM sales
GROUP BY year, month
ORDER BY year, month;

WITH cte_sales as (
  SELECT strftime('%Y', soldDate) as year,
        strftime('%m', soldDate) as month,
        SUM(salesAmount) as salesAm
  FROM sales
  GROUP BY year, month
)
SELECT year, month, salesAm,
    sum(salesAm) OVER (
    PARTITION BY year
    ORDER BY year, month) AS sales_total
FROM cte_sales
ORDER BY year, month;



SELECT strftime('%Y-%m', soldDate) as monthSold,
      count(*) as NumberCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate);


SELECT strftime('%Y-%m', soldDate) as monthSold,
      count(*) as NumberCarsSold,
      LAG (count(*), 1, 0) OVER calMonth as lastMonthSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
WINDOW calMonth AS (ORDER BY strftime('%Y-%m', soldDate))
ORDER BY strftime('%Y-%m', soldDate);