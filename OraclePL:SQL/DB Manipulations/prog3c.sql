/*
Write a PL/SQL subprogram that takes the old and new values of the zip code and performs an
update of zip code values in the mail-order database described on page 9 of the textbook. Note
that zip code values appear in three different tables: ZIPCODES, CUSTOMERS and
EMPLOYEES. Note also the foreign key referential integrities on zip code. You can assume that
a given zip code is always mapped to exactly one city. However, your program should handle
spcial situations such as when the zip code to be changed does not exist in the database. In such
cases, an appropriate message should be printed. Further, your program should always maintain
the integrity of the underlying database
*/
set serveroutput on;
CREATE or REPLACE PROCEDURE zipcodeUpdate (oldZIPcode IN CHAR, newZIPcode IN CHAR) IS 

-- temporary variables 
tempZip CHAR(5);
zcount number;
C VARCHAR2(50);
--exceptions
NO_ZIP_FOUND EXCEPTION;
ZIP_EXISTS EXCEPTION;
EQUAL_ZIPS EXCEPTION;


BEGIN

    --load the old zip into temporary variable to check for exceptions. If no data is found
    --the exception will handle it.
    
    SELECT ZIP INTO tempZip FROM ZIPCODES WHERE ZIP LIKE oldZipCode;
    
    --to check if the given new zip code already exists
    SELECT COUNT(*) INTO zcount FROM ZIPCODES WHERE ZIP = newZipCode;
    
    --checks for proper input. If the both zipcodes are equal or new one already exists exceptions are raised.
    IF tempZip LIKE newzipcode THEN RAISE EQUAL_ZIPS; END IF;
    IF zcount >0 THEN RAISE ZIP_EXISTS; end if;
    
    --the city of the old zip code is copied into a temp variable
    SELECT city INTO C FROM ZIPCODES WHERE ZIP = oldZipCode;
    
    -- a new row with the new zip code and the city with corresponding old zip code is inserted.
    INSERT INTO ZIPCODES (ZIP, CITY) VALUES (newZipCode, C);
    
    -- Update the zip codes in other tables.
    UPDATE CUSTOMERS
    SET ZIP = newZipCode
    WHERE ZIP = oldZipCode;

    UPDATE EMPLOYEES
    SET ZIP = newZipCode
    WHERE ZIP = oldZipCode;
    
    --delete the old zip code row in ZIPCODES
    DELETE FROM ZIPCODES WHERE ZIP = oldzipcode;

    -- Commit to save changes
    COMMIT;
dbms_output.put_line('-------The Updates are successfully made-------');        
EXCEPTION
    WHEN EQUAL_ZIPS THEN
        DBMS_OUTPUT.PUT_LINE('-------THE TWO ZIPS ARE THE SAME-------');
        
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('-------THE OLD ZIP CODE DOES NOT EXIST-------');
    
    WHEN ZIP_EXISTS THEN
        DBMS_OUTPUT.PUT_LINE('-------THE NEW ZIP CODE ALREADY EXISTS! PLEASE TRY ANOTHER ONE-------');
END;
/

--call the procedure
ACCEPT input_string PROMPT 'Please enter the OLD ZIP CODE: '
ACCEPT input_string1 PROMPT 'Please enter the NEW ZIP CODE: '

DECLARE
    oldZ CHAR(5) := '&input_string';
    newZ CHAR(5) := '&input_string1';
BEGIN
    zipcodeUpdate(oldZ, newZ);
    
    
END;
/


/*SELECT * FROM CUSTOMERS;
SELECT * FROM ZIPCODES;
SELECT * FROM EMPLOYEES;*/
--
