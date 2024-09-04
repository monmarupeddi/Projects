set serveroutput on;

------drop tables if exists----
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE emp';
    EXECUTE IMMEDIATE 'DROP TABLE dept';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-------ANSWER---------
--single block starts
--there are two blocks inside single block to facilitate insert statements
BEGIN 
    
    --EXECUTE IMMEDIATE 'DROP TABLE emp';
    --EXECUTE IMMEDIATE 'DROP TABLE dept';
    
    --CREATE TABLES
    
    EXECUTE IMMEDIATE 'CREATE TABLE dept(DEPTNO NUMBER(3), 
	  DNAME   	VARCHAR2(16), 
	  LOC   	 	VARCHAR2(16),
      PRIMARY KEY (DEPTNO))';
    DBMS_OUTPUT.PUT_LINE('Successfully Created dept table');  
 
    EXECUTE IMMEDIATE 'CREATE TABLE emp 
    ( EMPNO  	NUMBER(4) , 
      ENAME  	VARCHAR2(16), 
      JOB 	 	VARCHAR2(16), 
      MGR 	 	NUMBER(4), 
      HIREDATE 	 	DATE, 
      SAL 	 	NUMBER(7, 2), 
      COMM 	 	NUMBER(7, 2), 
      DEPTNO NUMBER(3) NOT NULL,
      PRIMARY KEY (empno),
      FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO))'; 
      DBMS_OUTPUT.PUT_LINE('Successfully Created emp table');
 
 
    --nested block to insert data into dept table
    BEGIN 
        execute immediate 'INSERT INTO  dept(DEPTNO, DNAME, LOC) VALUES (10, ''ACCOUNTING'', ''NEW YORK'')';
        execute immediate 'INSERT INTO  dept(DEPTNO, DNAME, LOC) VALUES (20, ''RESEARCH'', ''DALLAS'')';
        execute immediate 'INSERT INTO  dept(DEPTNO, DNAME, LOC) VALUES (30, ''SALES'', ''CHICAGO'')';
        execute immediate 'INSERT INTO  dept(DEPTNO, DNAME, LOC) VALUES (40, ''OPERATIONS'', ''WASHINGTON (D.C.)'')';
        execute immediate 'INSERT INTO  dept(DEPTNO, DNAME, LOC) VALUES (50, ''MARKETING'', ''BOSTON'')';
    --handle exception by commiting prevously added rows
    EXCEPTION 
    WHEN OTHERS THEN 
    DBMS_OUTPUT.PUT_LINE('ENCOUNTERED AN ERROR WHILE INSERTING DATA INTO ''dept'' TABLE. COMMITING THE ROWS INSERTED UNTIL NOW');
    COMMIT; 
    END;

    --nested block to insert data into emp table
    BEGIN
    -- Insert data into the emptable
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7839, ''KING'', ''PRESIDENT'', NULL, ''17-NOV-81'', 5000, NULL, 10)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7698, ''BLAKE'', ''MANAGER'', 7839, ''01-MAY-81'', 2850, NULL, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7782, ''CLARK'', ''MANAGER'', 7839, ''09-JUN-81'', 2450, NULL, 10)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7566, ''JONES'', ''MANAGER'', 7839, ''02-APR-81'', 2975, NULL, 20)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7654, ''MARTIN'', ''SALESMAN'', 7698, ''28-SEP-81'', 1250, 1400, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7499, ''ALLEN'', ''SALESMAN'', 7698, ''20-FEB-81'', 1600, 300, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7844, ''TURNER'', ''SALESMAN'', 7698, ''08-SEP-81'', 1500, NULL, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7900, ''JAMES'', ''CLERK'', 7698, ''03-DEC-81'', 950, NULL, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7521, ''WARD'', ''SALESMAN'', 7698, ''22-FEB-81'', 1250, 500, 30)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7902, ''FORD'', ''ANALYST'', 7566, ''03-DEC-81'', 3000, NULL, 20)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7369, ''SMITH'', ''CLERK'', 7902, ''17-DEC-81'', 800, NULL, 20)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7788, ''SCOTT'', ''ANALYST'', 7566, ''09-DEC-82'', 4000, NULL, 20)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7876, ''ADAMS'', ''CLERK'', 7788, ''12-JAN-83'', 1100, NULL, 20)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7934, ''MILLER'', ''CLERK'', 7782, ''22-JAN-82'', 1300, NULL, 10)';
        execute immediate 'INSERT INTO  emp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7935, ''JONES'', ''ACCOUNT'', 7782, ''22-JAN-82'', 1700, NULL, 10)';
   
        
    EXCEPTION 
    WHEN OTHERS THEN 
    DBMS_OUTPUT.PUT_LINE('ENCOUNTERED AN ERROR WHILE INSERTING DATA INTO ''emp'' TABLE. COMMITING THE ROWS INSERTED UNTIL NOW');
    COMMIT; 
    
    END;

DBMS_OUTPUT.PUT_LINE('DATA INSERTION COMPLETED');
EXCEPTION
 WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END; --end of the single block
/

/*select * from dept;
select * from emp;*/
--
      
      