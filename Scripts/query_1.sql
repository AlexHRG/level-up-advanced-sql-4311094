select * from employee limit 5;

select model, EngineType
from model
limit 5;

SELECT emp.firstName,
  emp.lastName,
  emp.title,
  mng.firstName as mng_Name,
  mng.lastName as mng_LastName
from employee emp
inner join employee mng
  on emp.managerId = mng.employeeId;

SELECT emp.firstName,
  emp.lastName,
  emp.title,
  emp.startDate,
  sls.salesId
FROM employee emp
LEFT JOIN sales sls USING(employeeId)
WHERE emp.title = 'Sales Person'
AND sls.salesId IS NULL;

SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.salesId, sls.soldDate
FROM customer cus
JOIN sales sls USING(customerId)
UNION
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.salesId, sls.soldDate
FROM customer cus
LEFT JOIN sales sls USING(customerId)
WHERE sls.salesId IS NULL
UNION
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.salesId, sls.soldDate
FROM sales sls
LEFT JOIN customer cus USING(customerId)
WHERE cus.customerId IS NULL;