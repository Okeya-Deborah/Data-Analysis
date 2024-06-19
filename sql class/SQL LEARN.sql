SELECT gender, AVG(salary) AS Average_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


-- CASE STATEMENT PRATICE

SELECT first_name, last_name,
CASE 
	WHEN age <=30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'
    WHEN age > 50 THEN 'Aged'
END AS age_bracket
FROM employee_demographics;