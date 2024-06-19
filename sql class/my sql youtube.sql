SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics;

SELECT distinct gender
FROM  employee_demographics;

SELECT count(distinct age)
FROM employee_demographics;

SELECT count(distinct first_name)
FROM employee_demographics;

SELECT AVG(salary)
FROM employee_salary;

SELECT *
FROM employee_demographics
WHERE gender IN('female');

SELECT COUNT(age)
FROM employee_demographics
WHERE age = "44";

SELECT *
FROM employee_salary;

SELECT occupation,  count(employee_id)
FROM employee_salary
GROUP BY occupation
ORDER BY count(employee_id) asc;

SELECT age, count(gender)
from employee_demographics
GROUP BY age
ORDER BY count(gender);

SELECT 



