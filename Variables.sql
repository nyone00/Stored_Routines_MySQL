/*
once the structure has been solidified, then it will be applied to the
database. The input value you insert is typically referred to as the
'argument', while the obtained output value is stored in a 'variable'


*/

SET @v_avg_salary = 0; #create a variable

# extract a value that will be assigned to the newly created variable
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);

# ask the software to display the output of the procedure
SELECT @v_avg_salary;

# EXERCISE

SET @v_emp_no = 0;
CALL employees.emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;