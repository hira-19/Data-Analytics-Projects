use record_users;

select * from university_students_dataset;

-- changing data type of enrolment date
alter table university_students_dataset modify column EnrollmentDate date;

select count(StudentID) as "Student Count" from university_students_dataset;

-- Exercise 2: what is the average age of student
select round(avg(age)) as "Total of AVg Age" from university_students_dataset;

-- Exercise 3: What is the highest GPA and minimum gpa
select max(gpa) as "MAx GPA", min(gpa) AS "Min GPA" from university_students_dataset;

select count(distinct(major)) from university_students_dataset;

select max(gpa) from university_students_dataset  where Major ="mathematics";

-- Exercise 6: Identify the student with the lowest GPA in the Computer Science major.
select * from university_students_dataset where Major ="computer science"
order by gpa asc limit 1;

select * from university_students_dataset where Major ="computer science"
order by gpa = 23 asc limit 1;

select  distinct(Gender),Major, round(avg(age)) as "Age"from university_students_dataset  group by Major,Gender;

SELECT Major,Gender,COUNT(DISTINCT StudentID) as "Count",ROUND(AVG(age)) as "Age"
FROM 
    university_students_dataset 
GROUP BY Major, Gender;
 
-- Exercise 1: How many students are enrolled in each major?
select major, COUNT(DISTINCT StudentID) as "Total Students" from university_students_dataset group by major;

-- Exercise 2: Analyze the gender distribution
select distinct(gender),count(*) as "Total Distribution" from university_students_dataset group by Gender;

-- Exercise 3: Check the age distribution or How many students are there for each age?
select age,count(*) as "Age Distribution" from university_students_dataset group by age;

-- Exercise 4: Identify the age with the highest number of students.
select age ,count(*) as "Age Distribution" 
from university_students_dataset group by age order by age desc limit 1;

-- CASE
-- Exercise 1: Assign grades to students based on their GPA using the following criteria:
-- 'A+' for GPAs greater than 3.5,
-- 'A' for GPAs greater than 3,
-- 'B' for GPAs greater than 2.5,
-- 'C' for GPAs greater than 2,
-- 'F' for Fail or all other GPAs.

SELECT 
    *,
    CASE
        WHEN gpa > 3.5 THEN 'A+'
        WHEN gpa > 3 THEN 'A'
        WHEN gpa > 2.5 THEN 'B'
        WHEN gpa > 2 THEN 'C'
        ELSE 'F'
    END AS 'Grades'
FROM
    university_students_dataset;
    
-- Exercise 2: Write a SQL query to categorize students based on their age and gender into the following groups:
-- 'Adult Male' for males aged 21 and above,
-- 'Young Male' for males younger than 21,
-- 'Adult Female' for females aged 21 and above,
-- 'Young Female' for females younger than 21.
SELECT *,
case 
WHEN gender="Male" and age >= 21 THEN 'Adult Male'
WHEN gender="Male" and age < 21 THEN 'Young Male'
WHEN gender="Female" and age >= 21 THEN 'Adult Female'
WHEN gender="Female" and age < 21 THEN 'Young Female'
ELSE 'Other'
END AS  'THIs is age'
FROM
    university_students_dataset;
    
-- Exercise 3: Group students by their majors and categorize their GPA into 'High' (>= 3.5), 'Medium' (2.5 - 3.49), and 'Low' (< 2.5).
select *,
case 
WHEN gender="Female" and age < 21 THEN 'Young Female'


ELSE "none"
END AS "this is filter col"
FROM
    university_students_dataset;
    
SELECT
    major,
    CASE WHEN gpa >= 3.5 THEN 'High'
        WHEN gpa >= 2.5 AND gpa < 3.5 THEN 'Medium'
        ELSE 'Low'
    END AS gpa_category,
    COUNT(*) AS student_count
FROM
    university_students_dataset
GROUP BY
    major, gpa_category
ORDER BY
    major, gpa_category;

