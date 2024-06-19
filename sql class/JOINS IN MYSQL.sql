# TOPIC: JOINS IN SQL
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id= employee_salary.employee_id;
    

SELECT *
FROM employee_demographics AS den
INNER JOIN employee_salary AS sal
	ON dem.employee_id= sal.employe_id;
    
   
   SELECT *
FROM employee_demographics AS den
INNER JOIN employee_salary AS sal
	ON dem.employee_id= sal.employe_id;
    

    SELECT *
FROM employee_demographics AS den
INNER JOIN employee_salary AS sal
	ON dem.employee_id= sal.employe_id;
    

SELECT *
FROM employee_demographics AS den
INNER JOIN employee_salary AS sal
	ON dem.employee_id= sal.employe_id;
    
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id= sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id= pd.department_id;
    
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

    
    

SELECT *
FROM employee_demographics AS den
LEFT JOIN employee_salary AS sal
	ON den.employee_id= sal.employee_id;  
    
SELECT *
FROM employee_salary AS dem
JOIN parks_departments AS sal
    ON dem.employee_id = sal. employee_id
JOIN parks_departments AS pkd
    ON sal.dept_id = pkd.department_id;
    
    
    
    -- STRING FUNCTIONS 

    

    
    
	 
    
	
	 
    
	


