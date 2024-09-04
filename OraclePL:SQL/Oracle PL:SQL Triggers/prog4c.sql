/*
(30 Points) Create a PL/SQL block to retrieve all the information about each department from the DEPT table and print the
information to the screen by using a PL/SQL table of records.
*/

set serveroutput on;
DECLARE
    -- dept_record is a record sharing the same row structure as dept table
    TYPE DEPT_RECORD IS RECORD (
        deptno DEPT.deptno%type,
        dname DEPT.DNAME%type,
        loc  DEPT.LOC%type
    );
    -- dept_type a collection(table) of records with the dept structure 
    TYPE DEPT_TYPE IS TABLE OF DEPT_RECORD;
    -- declare a variable of the table(dept_type) of record(dept_record)
    DEPT_INFO DEPT_TYPE;
    -- dept_cursor selects the department information 
    CURSOR DEPT_CURSOR IS SELECT * FROM DEPT;
BEGIN  
    OPEN DEPT_CURSOR;
    -- bulk collect the values from the curser into the dept_info cpollection 
    FETCH DEPT_CURSOR BULK COLLECT INTO DEPT_INFO;
    -- iterate through the dept_info collection and print each record 
    FOR i IN 1 .. DEPT_INFO.COUNT LOOP
           DBMS_OUTPUT.PUT_LINE('Department No: ' || DEPT_INFO(i).deptno );
           DBMS_OUTPUT.PUT_LINE('       Department Name: ' || DEPT_INFO(i).dname);
           DBMS_OUTPUT.PUT_LINE('       LOC: ' || DEPT_INFO(i).loc);
           DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN      
        DBMS_OUTPUT.PUT_LINE('');
END;
/

/*
SELECT * FROM dept;
SELECT * FROM dept_shadow;
*/
