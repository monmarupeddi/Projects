-- a) For each faculty list the faculty’s name and the names of his/her student advisees
SELECT fa.fac_name, st.std_name
FROM FACULTY fa , STUDENT st
WHERE fa.faculty_id=st.advisor_id;

-- b) Give the names and phonenumbers ofstudents who are not enrolled in any courses
--Ans: --left join to get all records from STUDENT and select records that are null in right table
SELECT st.std_name, st.home_phone 
FROM STUDENT st LEFT OUTER JOIN ENROLLMENT e   
ON(st.student_id = e.student_id)
WHERE e.course# is null; 

-- c) Give the student’s name and the GPA for the student with the highest GPA than
--    all colleagues with a similar (exact) total number of credit hours
-- Ans: Write a subquery to get max gpa and credit of the student amongst collegues with similar credits,
--      Join the subquery with student table to get the name of the student where the credit and gpa are same. 

SELECT st2.std_name,  temp.maxGPA FROM 
(
SELECT  MAX(st1.gpa) as maxGPA, st1.total_credits
FROM STUDENT st1
GROUP BY st1.total_credits
) temp, STUDENT st2
WHERE temp.maxGPA = st2.gpa and temp.total_credits = st2.total_credits;


-- d) For each studentname,list the coursenumbers(s),the student took,where the student obtained the lowest grade
-- Ans: Use a window function to calculate the lowest grade of each student by partitioning on student id. 
--      return only the students with the low grade by checking the equality condition.

SELECT temp.std_name, temp.course#, temp.lowgrade from
(
SELECT st.std_name, e.course#, e.grade, min(e.grade) OVER (PARTITION BY e.student_id) as lowGrade
FROM STUDENT st, ENROLLMENT e
WHERE st.student_id = e.student_id )
temp
WHERE temp.lowgrade = temp.grade;



-- e) Give the names of faculty who do not advise any students
SELECT fa.fac_name
FROM FACULTY fa 
LEFT OUTER JOIN  STUDENT st 
ON (fa.faculty_id=st.advisor_id)
WHERE advisor_id IS null;

