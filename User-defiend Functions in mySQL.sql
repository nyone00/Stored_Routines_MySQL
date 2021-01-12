/*
DELIMITER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
DECLARE variable_name data_type
BEGIN
	SELECT ...
RETURN variable_name
END$$

DELIMITER $$

*/

USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INT) RETURNS DECIMAL(10,2) # return value
DETERMINISTIC NO SQL READS SQL DATA

BEGIN

DECLARE v_avg_salary DECIMAL(10,2); # create variable
SELECT
	AVG(s.salary)
INTO v_avg_salary FROM
	employees e
    JOIN
    salaries s on e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;

SELECT f_emp_avg_salary(11300);

#EXERCISE
DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA

BEGIN 
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);

SELECT MAX(s.from_date)
INTO v_max_from_date FROM employees e
JOIN salaries s on e.emp_no = s.emp_no
WHERE e.first_name = p_first_name and e.last_name = p_last_name;


SELECT s.salary
INTO v_salary FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name and e.last_name = p_last_name 
		and s.from_date = v_max_from_date;
RETURN v_salary;
END$$

DELIMITER ;
SELECT f_emp_info('Aruna','Journel');