-- UNIONS IN SQL
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name,last_name
FROM employee_salary;


SELECT first_name, last_name, 'old man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name,last_name, 'Old lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender= 'female'
UNION
SELECT first_name,last_name, 'highly paid employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;

SELECT *, concat(first_name, ' ', last_name)
FROM employee_demographics;

SELECT *, concat(first_name, last_name)
FROM employee_demographics;






