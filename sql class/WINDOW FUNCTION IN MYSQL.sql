-- WINDOW FUNCTION: Window function allow us to look at a partition or a group and roll it into one row.

SELECT gender, AVG(salary) AS Average_Salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;
 
 
SELECT gender, AVG(salary) Over(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, 
dem.last_name, 
gender, AVG(salary) Over(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, dem.last_name, gender, 
SUM(salary) Over(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- A ROLLING TOTAL : This starts at a specific value and end with a subsequent rows based on your partition
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) Over(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


--
SELECT dem.first_name, dem.last_name, dem.employee_id, salary,
row_number() over()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, dem.last_name, dem.employee_id, salary, gender,
row_number() over(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, dem.employee_id, salary, gender,
row_number() over(partition by gender order by salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, dem.employee_id, salary, gender,
row_number() over(partition by gender order by salary DESC) AS row_num,
RANK() over(partition by gender order by salary DESC) AS rank_num,
DENSE_RANK() over(partition by gender order by salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

