/*
Technical differences
1) stored procedure : does not return a value, CALL procedure
2) user-defined function : returns a value, SELECT function

Conceptual differences
1) stored procedure : can have multiple out parameters
						 can use UPDATE, INSERT, DELETE
2) user-defined function : can return a single value only
							can include a function as a SELECT statement




*/