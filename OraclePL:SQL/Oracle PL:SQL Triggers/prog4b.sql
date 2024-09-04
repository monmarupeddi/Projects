/*For the DEPT table created in problem #1 above, insert the following records by using bulk binding
Dept = {(10, 'ACCOUNTING', 'NEW YORK'),
 (20, 'RESEARCH', 'DALLAS'),
 (30, 'SALES', 'CHICAGO'),
 (40, 'OPERATIONS', 'DALLAS'),
 (50, 'MARKETING', 'BOSTON')}
*/
set serveroutput on;
DECLARE
    -- define dept_record that has a row strcuture like dept table
    TYPE dept_record IS RECORD (
    deptno DEPT.deptno%type,
    dname DEPT.DNAME%type,
    LOC DEPT.LOC%type
    );

    -- make a collection of records of dept_record by degining departmt table
    TYPE departmt IS TABLE OF dept_record;
    DEPT_TEMP departmt;

BEGIN
    -- populate the departmt table collection with the dept_reecord values to be inserted
    DEPT_TEMP := departmt(dept_record(10, 'ACCOUNTING', 'NEW YORK'),
 dept_record(20, 'RESEARCH', 'DALLAS'),
 dept_record(30, 'SALES', 'CHICAGO'),
 dept_record(40, 'OPERATIONS', 'DALLAS'),
 dept_record(50, 'MARKETING', 'BOSTON'));
 
    -- Bulk bind the sql statements before sending to sql engine using forall.
    FORALL i IN DEPT_TEMP.first..dept_temp.last
        INSERT INTO DEPT (DEPTNO, DNAME, LOC)
        VALUES (DEPT_TEMP(i).deptno, DEPT_TEMP(i).DNAME,DEPT_TEMP(i).loc);


COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('');
END;
/


SELECT * FROM dept;
SELECT * FROM dept_shadow;
