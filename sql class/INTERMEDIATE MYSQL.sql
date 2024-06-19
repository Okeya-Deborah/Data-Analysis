-- INTERMEDIATE CLASS ON MYSQL

-- TOPIC: JOINS
-- Joins allows you to join two tables or more if they have a common column. The column name must not be the same but atleast the data in it must be the same.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- THE INNER JOIN: this will return rows that are the same in both tables. 

SELECT * # By default the -join- is inner even without adding the word inner to it.
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id # If you run this program, some of the rows will not show. 
;

# We can use the aliasing in this case also
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOINS: In the outer join we have the right outer joins and the left outer joins. The left join is going to take everything from
-- the left table even if there is no match in the join and then it will only return the matches from the right table and exact opposite is true 
-- from a right join. 
SELECT *
FROM employee_demographics AS dem
LEFT  JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- SELF JOIN
-- A self join is a join where you tie the table to itself. 

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- We can select the columns that we want our output to display
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;



-- JOINING MULTIPLE TABLES TOGETHER

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON 	sal.dept_id = pd.department_id
;


select * 
FROM parks_departments
;

-- UNIONS IN MYSQL --
-- Unon allows you to combine rows of table either from the same table or seperate tables together. 

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;


SELECT first_name, last_name
FROM employee_demographics
UNION -- we uase the UNION ALL and UNION UNIQUE
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male' 
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female' 
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;


-- STRING FUNCTIONS
# String function are built-in functions within MYSQL that will help us use string and work with string differently.

SELECT length("Prosper")
;
SELECT *
FROM employee_demographics
;

SELECT first_name, length(first_name) AS length
FROM employee_demographics
order by 2;

-- Upper cases using string functions
SELECT UPPER("debby");
SELECT LOWER("DEBBY");


SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

-- TRIM: Trim is going to take away space from the front or the end and get rid of it. There are multiple trim, we have the right and left trim and trim
SELECT ("            myself         ");

SELECT trim("            myself         ");
# we can use the left and right trim by using RTRIM for right and the LTRIM for left trim

#LEFT and RIGHT Functions in MYSQL
SELECT first_name, 
LEFT(first_name, 3),
RIGHT(first_name, 3)
FROM employee_demographics;

-- Substring: The substring helps us to pick a text we want to work with as well as the position.

SELECT first_name, 
LEFT(first_name, 3),
RIGHT(first_name, 3),
substring(first_name, 3,3)
FROM employee_demographics;

SELECT first_name, 
LEFT(first_name, 3),
RIGHT(first_name, 3),
birth_date,
substring(birth_date, 6,2) AS birth_month
FROM employee_demographics;

-- Replace: This helps us to replace a specific character to the character that will want. 
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

-- LOCATE: This helps us to know the position a particular location a letter is in a text.

SELECT LOCATE('X', 'Alex');

SELECT first_name, LOCATE('AN',first_name)
FROM employee_demographics;

-- CONCATENATION: CONCAT HELPS US TO MERGE TWO COLUMNS TOGETHER

SELECT *
FROM employee_demographics;

SELECT first_name, last_name,
concat(first_name, ' ', last_name) AS full_name
FROM employee_demographics
;
