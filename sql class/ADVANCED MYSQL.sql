-- TOPIC 1: COMMON TABLE EXPRESSION (CTEs): This allow you to define a seperate block that you can reference within the main query. 

SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


WITH CTE_EXAMPLE AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;


WITH CTE_EXAMPLE AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;


WITH CTE_EXAMPLE AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT avg_sal
FROM CTE_EXAMPLE
;



SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;


-- Creating more complex CTEs; multiple CTEs.
WITH CTE_EXAMPLE AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
),
CTE_EXAMPLE2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_EXAMPLE
JOIN CTE_EXAMPLE2
	ON CTE_EXAMPLE.employee_id = CTE_EXAMPLE2.employee_id
;


-- Instead of using the Aliasing to create gender we can use the CTE to create the desired column name.
WITH CTE_EXAMPLE (Gender, Avg_Sal, Max_Sal, Min_Sal, Count_Sal) AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;







-- TOPIC 2: TEMPORARY TABLE (TEMP TABLE IN MYSQL).
-- Temporary tables are tables that are only visible to the session that they are created in. 
-- there are two ways to create a temp table. 

-- The first way 
CREATE TEMPORARY TABLE temp_table2
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100),
age int
);

SELECT *
FROM temp_table2
;
INSERT INTO temp_table2
VALUES ('Dee', 'Jola', 'Just us girls', 20)
;

SELECT *
FROM temp_table
;
SELECT *
FROM employee_salary
;
-- to create a sub-section of the employee salary table where the salary is over 50k. 
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM salary_over_50k
;


-- TOPIC 3: STORED PROCEDURES: This is a way to store sql codes that can be used over and over again.

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

CREATE PROCEDURE low_salaries()
SELECT *
FROM employee_salary
WHERE salary <= 50000;

CALL low_salaries();


SELECT *
FROM employee_salary
WHERE salary >= 10000; -- What happened in this case is that, the first select statement create the store procedure while the second is a query

-- We use the DELIMETER to create a store procedure where multiple select statement will be in the store procedure.
-- A DELIMITER create a boundary btw two select statement. the // is used and also the $$ is used most.
DELIMITER $$ 
CREATE PROCEDURE large_salaries4()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries4();

-- PERIMITER
-- PERIMETERS are variables that are passed as input into a store procedure and allows the store procedure to accept and input values and place it into our codes. 

DELIMITER $$ 
CREATE PROCEDURE large_salaries5(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id
	;
END $$
DELIMITER ;

CALL large_salaries5(1);


-- TOPIC 4: TRIGGERS AND EVENTS IN MYSQL
-- A trigger is a block of code that execute automatically when event takes place on a specific table. 
-- For example, the two tables we have. 
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Peter', 'Mark', 'Data Analyst', 80000, NULL);


-- EVENTS : this is a scheduled automator.  events take place when it is scheduled. 


SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND 
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'EVENT%';