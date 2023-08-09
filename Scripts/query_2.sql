select emp.employeeId, emp.firstName, emp.lastName, count(1) as SoldCars
from sales sls
INNER JOIN employee emp USING(employeeId)
GROUP by emp.employeeId
order by SoldCars DESC;

select emp.employeeId,
 emp.firstName,
  emp.lastName,
   min(sls.salesAmount) as Cheap,
    max(sls.salesAmount) as Expensive,
    count(*)
from sales sls
INNER JOIN employee emp USING(employeeId)
WHERE sls.soldDate >= date('now', 'start of year')
GROUP by emp.employeeId
;

select emp.employeeId, emp.firstName, emp.lastName, count(1) as SoldCars
from sales sls
INNER JOIN employee emp USING(employeeId)
WHERE sls.soldDate >= date('now', 'start of year')
GROUP by emp.employeeId
HAVING SoldCars > 5;