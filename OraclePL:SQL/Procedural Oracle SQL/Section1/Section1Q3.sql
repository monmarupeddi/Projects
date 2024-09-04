--Q3 (15 Points) Create an anonymous PL/SQL block that accepts the current salary and raise percentage through SQL*Plus
--substitution variables and calculate the new salary based on the input:

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT cur_sal PROMPT 'Please enter current salary: '
ACCEPT raise_perc PROMPT 'Please enter the raise percentage: '
DECLARE
current_salary NUMBER(15, 2) := &cur_sal; 
perc_raise NUMBER(10) := &raise_perc; 
new_salary NUMBER(15, 2);
BEGIN
new_salary := current_salary * ( 1 + perc_raise / 100 );
DBMS_OUTPUT.PUT_LINE(new_salary);
END;
/