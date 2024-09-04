/*Create a trigger to track all inserts into a table. Specifically, for each record inserted into the DEPT table, the trigger should
insert a duplicate record into the DEPT_SHADOW table along with the information of the user who performs the insertion
(the USER column) as well as the date/time of the insertion (the MODTIME column). 
set serveroutput on;*/

set serveroutput on;
--drop tables if exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE dept';
    EXECUTE IMMEDIATE 'DROP TABLE dept_shadow';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = dept;
--create tables
CREATE TABLE dept 
    (
     DEPTNO NUMBER(3) PRIMARY KEY,
     DNAME VARCHAR2(16),
     LOC VARCHAR2(16)
    );
    
CREATE TABLE dept_shadow 
    (
     DEPTNO NUMBER(3) PRIMARY KEY,
     DNAME VARCHAR2(16),
     LOC VARCHAR2(16),
     user1 VARCHAR2(32),
     MODTIME CHAR(17)
    );

-- create trigger that activates if an insert takes place
CREATE OR REPLACE TRIGGER trigger_duplicate_rows
AFTER INSERT  ON dept FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO DEPT_SHADOW 
        VALUES
            (:new.DEPTNO ,
             :new.DNAME,
             :new.LOC,
             USER,
             SYSDATE);

end if;
end;
/


/*INSERT   INTO DEPT1 VALUES
(163 ,
 'NAME1',
 'LOC1');*/

/*
SELECT * FROM dept;
SELECT * FROM dept_shadow;
*/