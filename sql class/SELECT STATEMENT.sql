SELECT *
FROM employee_demographics;

SELECT first_name 
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT first_name, 
Last_name, 
gender,
age
FROM employee_demographics;


SELECT occupation
FROM employee_ salary;



SELECT occupation
FROM employee_salary;

SELECT first_name
FROM employee_salary;

SELECT first_name, 
last_name,
gender,
age,
age + 10
FROM employee_demographics;


SELECT first_name, 
last_name,
gender,
age,
age + 10,
(age + 10) * 10 - 5
FROM employee_demographics;

-- PEMDAS 
SELECT first_name, 
last_name,
gender,
age,
age + 10,
(age + 10)/ 10 * 10 + 5
FROM employee_demographics;

# DISTINCT
SELECT first_name
FROM employee_demographics;

SELECT DISTINCT gender
FROM employee_demographics;

SELECT DISTINCT age
FROM employee_demographics;  

-- WHERE CLAUSE
SELECT *
FROM employee_salary
WHERE first_name = 'Tom'
;
 SELECT *
FROM employee_salary
WHERE salary > 50000
;

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM employee_demographics
WHERE gender = 'female'

;

SELECT *
FROM employee_demographics
WHERE gender = 'male'
;


