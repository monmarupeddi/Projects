-- Create an anonymous PL/SQL block to output the phrase “My PL/SQL Program
-- Works” to the screen.
SET SERVEROUTPUT ON
BEGIN 
dbms_output.put_line('My PL/SQL Program Works');
end;
/