/*Q4 (15 Points) Create an anonymous PL/SQL block that accepts an integer number N through SQL*Plus 
substitution variable and then determines for each of the numbers in the range 1 through N inclusive whether it is odd or even. 
Use the MOD function to determine whether a number is odd or even
Handle NULL values. N should be set to 0 if a NULL value is entered.. 
*/
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT N PROMPT 'Please enter the value of N: '

DECLARE
    n NUMBER(9) ; 

BEGIN
-- if the input is null or empty set the input to 0
    IF '&N' IS NULL OR '&N' = '' THEN 
        n := 0;
    else n :='&N';
    end if;

    FOR i IN 0..n LOOP
        IF MOD(i,2)=0 THEN 
            DBMS_OUTPUT.PUT_LINE(i || ': even');
        else 
            DBMS_OUTPUT.PUT_LINE(i || ': odd');
        END IF;

    END LOOP; 

END;
/