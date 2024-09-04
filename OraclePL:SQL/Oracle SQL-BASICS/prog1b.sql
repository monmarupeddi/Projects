--POPULATE FACULTY TABLE -25 rows
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('1f', 'Russell', '1NStreet', 6550);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('2f', 'William', '2SStreet', 8860);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('3f', 'James', '3EStreet', 1920);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('4f', 'Timothy', '4WStreet', 1860);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('5f', 'Joshua', '5NStreet', 3120);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('6f', 'Michael', '6SStreet', 5010);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('7f', 'Sharon', '7EStreet', 1480);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('8f', 'Lisa', '8WStreet', 1980);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('9f', 'Thomas', '9NStreet', 8080);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('10f', 'Jerry', '10SStreet', 2680);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('11f', 'Thomas', '11EStreet', 8660);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('12f', 'Spencer', '12WStreet', 8260);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('13f', 'Kimberly', '13NStreet', 3780);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('14f', 'Antonio', '14SStreet', 6720);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('15f', 'Hector', '15EStreet', 9680);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('16f', 'Tracy', '16WStreet', 8760);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('17f', 'John', '17NStreet', 3100);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('18f', 'Ryan', '18SStreet', 7660);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('19f', 'Paul', '19EStreet', 4890);
INSERT INTO FACULTY (faculty_id,fac_name,office,salary) VALUES('20f', 'Tyler', '20WStreet', 7900);                 
                        
 
--POPULATE STUDENT TABLE -25 rows 
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('1s', 'Mary', '5821972', 3, 2.06, '16f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('2s', 'Deborah', '6584733', 3, 2.64, '6f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('3s', 'Kenneth', '8842491', 4, 1.58, '7f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('4s', 'Karl', '8085418', 2, 3.69, '4f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('5s', 'John', '6662886', 4, 1.79, '19f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('6s', 'Andrew', '1829797', 2, 2.02, '5f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('7s', 'Elizabeth', '2510036', 3, 2.73, '5f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('8s', 'Tyler', '4259658', 2, 3.41, '5f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('9s', 'Amanda', '0812949', 4, 2.07, '5f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('10s', 'Dale', '4959888', 4, 1.85, '10f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('11s', 'Ronald', '0759851', 3, 1.71, '4f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('12s', 'Jacob', '7037792', 2, 2.70, '3f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('13s', 'Jeremy', '2357281', 3, 2.62, '10f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('14s', 'Kathryn', '2067748', 2, 3.29, '15f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('15s', 'Brian', '4505565', 2, 2.64, '10f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('16s', 'Shannon', '7199051', 4, 3.66, '5f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('17s', 'Beverly', '1711201', 3, 2.91, '2f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('18s', 'Robert', '6066919', 4, 2.89, '20f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('19s', 'Melody', '2571182', 2, 2.60, '11f');
INSERT INTO STUDENT (student_id,std_name,home_phone,total_credits,gpa,advisor_id) VALUES('20s', 'Jason', '1209468', 2, 3.34, '5f');

--POPULATE COURSE TABLE -25 rows
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 400', 3, 3, '14ejackson', '11f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 401', 4, 1, '130nmichigan', '1f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 402', 2, 1, '14ejackson', '6f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 403', 2, 1, '14ejackson', '13f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 406', 3, 2, '130nmichigan', '13f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 407', 2, 1, '25swabash', '11f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 421', 2, 3, '14ejackson', '3f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 435', 2, 1, '14ejackson', '19f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 447', 2, 1, '1ejackson', '17f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 453', 2, 3, '130nmichigan', '20f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 472', 2, 2, '130nmichigan', '13f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 475', 2, 2, '25swabash', '17f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 481', 2, 2, '14ejackson', '15f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 482', 4, 1, '1ejackson', '16f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 486', 3, 2, '1ejackson', '14f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 491', 3, 3, '130nmichigan', '4f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 498', 3, 1, '130nmichigan', '6f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 500', 3, 3, '130nmichigan', '4f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 503', 4, 1, '130nmichigan', '11f' );
INSERT INTO COURSE (course#,credit_hours,time,location,faculty_id) VALUES('CSC 504', 3, 2, '130nmichigan', '12f' );


--POPULATE ENROLLMENT TABLE -35 rows
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('3s', 'CSC 504', 79 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('3s', 'CSC 421', 70 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('5s', 'CSC 402', 49 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('12s', 'CSC 498', 49 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('2s', 'CSC 498', 98 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('10s', 'CSC 453', 57 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('19s', 'CSC 402', 41 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('5s', 'CSC 481', 76 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('8s', 'CSC 435', 51 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('11s', 'CSC 498', 83 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('5s', 'CSC 407', 59 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('13s', 'CSC 453', 70 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('11s', 'CSC 503', 72 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('14s', 'CSC 475', 53 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('19s', 'CSC 482', 49 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('6s', 'CSC 482', 80 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('18s', 'CSC 403', 78 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('17s', 'CSC 481', 53 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('3s', 'CSC 453', 85 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('18s', 'CSC 421', 86 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('17s', 'CSC 486', 99 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('20s', 'CSC 402', 63 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('9s', 'CSC 447', 54 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('12s', 'CSC 403', 87 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('14s', 'CSC 403', 97 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('13s', 'CSC 504', 88 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('4s', 'CSC 447', 73 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('4s', 'CSC 453', 91 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('10s', 'CSC 407', 99 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('10s', 'CSC 504', 63 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('2s', 'CSC 504', 99 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('8s', 'CSC 447', 72 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('1s', 'CSC 453', 52 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('4s', 'CSC 482', 44 );
INSERT INTO ENROLLMENT (student_id,course#,grade) VALUES('16s', 'CSC 453', 92 );


