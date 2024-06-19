-- GROUP BY AND OTHER BY
SELECT gender
FROM employee_demographics;

select gender
from employee_demographics
group by gender;


select occupation, salary
from employee_salary
group by occupation, salary;

select occupation, avg(salary)
from employee_salary
group by occupation;

select occupation, min(salary)
from employee_salary
group by occupation;

select distinct occupation
from employee_salary
;

select occupation, 
count(salary)
from employee_salary
group by occupation;


CREATE TABLE `employee_demographics3` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM employee_demographics3;

INSERT INTO employee_demographics3
SELECT *
FROM employee_demographics
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name;


SELECT *
FROM employee_demographics
ORDER BY first_name asc;

-- having Vs WHERE IN MYSQL

select gender, avg(age)
from employee_demographics
group by gender;

SELECT gender, avg(age)
from employee_demographics
where age > 40
group by gender;


SELECT gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40;


-- ALIASING OR AS STATEMENT
SELECT gender, avg(age) AS Average_age
from employee_demographics
group by gender
having avg(age) > 40;

select occupation, max(salary) as Maximum_salary
from employee_salary
group by occupation;









