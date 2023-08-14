WITH cte AS 
  (Select strftime('%Y', soldDate) as soldYear, salesAmount
  FROM sales )
Select soldYear, format("$%.2f", sum(salesAmount)) as AnnualSales
FROM cte
GROUP BY soldYear
ORDER BY soldYear;

SELECT sls.soldDate, sls.salesAmount, inv.colour, inv.year
FROM sales sls
INNER JOIN inventory inv
  USING(inventoryId)
WHERE inv.modelId IN (
    SELECT modelId
    from model
    WHERE EngineType='Electric')
    ORDER BY soldDate;