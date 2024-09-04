-- drop tables
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE STUDENT';
    EXECUTE IMMEDIATE 'DROP TABLE COURSE';
    EXECUTE IMMEDIATE 'DROP TABLE ENROLLMENT';
    EXECUTE IMMEDIATE 'DROP TABLE FACULTY';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE FACULTY(faculty_id VARCHAR2(25), 
                        fac_name VARCHAR2 (25), 
                        office VARCHAR2 (25), 
                        salary NUMBER (*,2),
                PRIMARY KEY (faculty_id));

CREATE TABLE STUDENT (student_id VARCHAR2(25), 
                        std_name VARCHAR2(25), 
                        home_phone CHAR(12), 
                        total_credits NUMBER , 
                        gpa NUMBER (*,2), 
                        advisor_id VARCHAR2 (25),
            PRIMARY KEY (student_id),
            FOREIGN KEY (advisor_id) REFERENCES FACULTY(faculty_id));
            
CREATE TABLE COURSE (course# CHAR (12), 
                        credit_hours NUMBER, 
                        time NUMBER, 
                        location VARCHAR2(25), 
                        faculty_id VARCHAR2(25),
            PRIMARY KEY (course#),
            FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id));

CREATE TABLE ENROLLMENT(student_id VARCHAR2 (25), 
                        course# CHAR (12), 
                        grade NUMBER (*,2),
            CONSTRAINT PK_ENRO PRIMARY KEY (student_id, course#));
            
