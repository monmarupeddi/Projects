SET SERVEROUTPUT ON;
CREATE OR REPLACE
PROCEDURE parse_name (inform IN VARCHAR2, first_name OUT VARCHAR2, last_name OUT VARCHAR2, title OUT VARCHAR2, excep OUT NUMBER) IS 
    ind varchar2(100); --index1
    ind1 varchar2(100); --index2

    input_exception EXCEPTION; --exception

BEGIN
-- Check for the format using regular exception pattern. Check for all alphabets seperated by a comma or space
-- For title check alphabets and '.'
    IF REGEXP_LIKE(inform, '^[a-zA-Z]+, [a-zA-Z]+ [a-zA-Z.]+$') THEN
    
        ind := INSTR(inform,',', 1, 1); --get index of first comma or space to get first and last names
        ind1 := INSTR(inform, ' ', -1, 1); -- get index for second space for title
        first_name := UPPER(substr(inform, ind+1, ind1-ind)); --extract the strings
        last_name := UPPER(substr(inform, 1, ind-1));
    
    
    elsif REGEXP_LIKE(inform, '^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z.]+$') then 
        ind := INSTR(inform,' ', 1, 1);
        ind1 := INSTR(inform,' ', -1, 1);
        first_name := UPPER(substr(inform, 1, ind-1));
        last_name := UPPER(substr(inform, ind+1, ind1-ind));
    
    --if format is not legal raise an exception
    else 
    
    RAISE input_exception;
    
    end if;
    
    title := substr(inform, ind1+1);
    
    excep := 0;
EXCEPTION
    -- Handle the exception
    WHEN input_exception THEN
        DBMS_OUTPUT.PUT_LINE('Invalid input. Please enter in following format');
        DBMS_OUTPUT.PUT_LINE('  FIRST_NAME LAST_NAME TITLE (or) LAST_NAME, FIRST_NAME TITLE');
        excep := 1;

 
END parse_name;
/

ACCEPT input_string PROMPT 'Please enter the info: '
DECLARE
inform VARCHAR2(100) := '&input_string';
first_name VARCHAR2(25);
last_name VARCHAR2(25);
title VARCHAR2(25);
excep NUMBER(2);
BEGIN
    parse_name(inform, first_name, last_name, title, excep);
    if excep<1 then
        DBMS_OUTPUT.PUT_LINE(title || ' ' || first_name || ' ' || last_name);
    end if;
END;
/
--end
