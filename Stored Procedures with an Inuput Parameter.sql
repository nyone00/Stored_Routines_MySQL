USE employees;
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER) # INT is data_type
BEGIN 
SELECT
	e.first_name, e.last_name, AVG(s.salary)
FROM employees e
	JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no; #check emp_no in employee number
END $$

DELIMITER ;