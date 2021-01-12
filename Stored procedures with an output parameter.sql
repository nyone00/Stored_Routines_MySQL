USE employees;
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INT, out p_avg_salary DECIMAL(10,2))
BEGIN
SELECT
	AVG(s.salary)
INTO p_avg_salary FROM 
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END$$

DELIMITER ; 

# EXERCISE

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name VARCHAR(255),in p_last_name VARCHAR(255)
							, out p_emp_no INT)
BEGIN 
SELECT 
		e1.emp_no
INTO p_emp_no FROM employees e1
WHERE e1.first_name = p_first_name and e1.last_name = p_last_name;
END$$

DELIMITER ;