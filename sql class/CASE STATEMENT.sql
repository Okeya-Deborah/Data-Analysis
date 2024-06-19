-- CASE STATEMENT IN MYSQL
# The case statement help us to use logic in our select statement 

SELECT *
FROM employee_demographics;

-- This is what our typical CASE statement looks like.
SELECT first_name,
last_name,
CASE
	WHEN age <= 30 THEN 'Young'
END AS young_age
FROM employee_demographics;

# we can as well add multiple WHEN and THEN statements to our select statement
SELECT first_name,
last_name,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age > 50 THEN 'Aged'
END AS Age_Bracket
FROM employee_demographics;


-- Pay Increase and Bonus
-- < 50000 = 5% 
-- > 50000 = 7% 
-- Finance = 10% Bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
END AS New_Salary
FROM employee_salary;



SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary >= 50000 THEN salary * 1.07
END AS New_Salary
FROM employee_salary;

-- How to know if someone is in the finance department and as well calculating the Bonus

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics;

SELECT *
FROM parks_departments;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;

SELECT first_name, last_name, occupation, salary,
CASE
	WHEN dept_id = 1 THEN salary * 0.20
END AS Bonus
FROM employee_salary;

SELECT *,
CASE
	WHEN dept_id = 1 THEN salary * 0.20
END AS Bonus
FROM employee_salary;






-- SUB-QUERIES IN MYSQL
# Sub-query is basically just a query in another query.

SELECT *
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id 
					FROM employee_salary
                    WHERE dept_id = 1)
;





select first_name, salary, AVG(salary), # this will produce an error
FROM employee_salary
;

-- CORRECTING ABOVE ERROR
SELECT first_name, salary, AVG(salary)
FROM employee_salary
group by first_name, salary;



SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary) AS average_salary
FROM employee_salary
;

SELECT gender, AVG(age), MIN(age), MAX(age), COUNT(age)
FROM employee_demographics
group by gender
;

SELECT *
FROM employee_demographics,
(SELECT gender, AVG(age), MIN(age), MAX(age), COUNT(age)
FROM employee_demographics
group by gender) AS Age_table
; 


SELECT gender, AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MIN(age), MAX(age), COUNT(age)
FROM employee_demographics
group by gender) AS Agg_table
GROUP BY gender
;

SELECT AVG(Max_age)
FROM
(SELECT gender, AVG(age) AS Avg_age, MIN(age) AS Min_age, MAX(age) AS Max_age, COUNT(age) AS Count_age
FROM employee_demographics
group by gender) AS Agg_table
;