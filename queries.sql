-- --------------- 1 ---------------
SELECT orderNumber,  SUM(priceEach*quantityOrdered) AS totalAmount FROM `orderdetails`
GROUP by orderNumber;


-- --------------- 2 ---------------
SELECT concat(emp.firstName," ", emp.lastName) AS empFullname, 
concat(mang.firstName," ", mang.lastName)AS mangFullname 
FROM employees as emp JOIN employees as mang 
ON emp.reportsTo = mang.employeeNumber;



-- --------------- 3 ---------------
SELECT concat(firstName," ",lastName)AS fullName FROM `employees` WHERE  officeCode
IN (SELECT officeCode FROM `offices` WHERE city = 'london');



-- --------------- 4 ---------------
SELECT  concat(employees.firstName," ",employees.lastName)AS fullName ,
offices.city 
FROM employees 
JOIN offices
ON employees.officeCode = offices.officeCode  
WHERE city = 'london';


-- --------------- 5 ---------------
SELECT customers.customerName as c, SUM(priceEach*quantityOrdered)AS totalAmount FROM `customers` JOIN orders JOIN orderdetails
ON customers.customerNumber = orders.customerNumber
AND orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerName;