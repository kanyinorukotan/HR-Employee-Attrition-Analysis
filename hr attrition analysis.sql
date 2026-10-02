CREATE DATABASE hr_analysis;

USE hr_analysis;

CREATE TABLE employees (
    Education VARCHAR(50),
    JoiningYear INT,
    City VARCHAR(50),
    PaymentTier INT,
    Age INT,
    Gender VARCHAR(20),
    EverBenched VARCHAR(10),
    ExperienceInCurrentDomain INT,
    LeaveOrNot INT
);
SHOW TABLES;
USE hr_analysis;

SELECT *
FROM employees
LIMIT 10;
SELECT COUNT(*) AS total_employees
FROM employees;
DESCRIBE employees;
SELECT 
    Education,
    JoiningYear,
    City,
    PaymentTier,
    Age,
    Gender,
    EverBenched,
    ExperienceInCurrentDomain,
    LeaveOrNot,
    COUNT(*) AS duplicate_count
FROM employees
GROUP BY
    Education,
    JoiningYear,
    City,
    PaymentTier,
    Age,
    Gender,
    EverBenched,
    ExperienceInCurrentDomain,
    LeaveOrNot
HAVING COUNT(*) > 1;
SELECT
    SUM(Education IS NULL) AS missing_education,
    SUM(JoiningYear IS NULL) AS missing_joining_year,
    SUM(City IS NULL) AS missing_city,
    SUM(PaymentTier IS NULL) AS missing_payment_tier,
    SUM(Age IS NULL) AS missing_age,
    SUM(Gender IS NULL) AS missing_gender,
    SUM(EverBenched IS NULL) AS missing_benched,
    SUM(ExperienceInCurrentDomain IS NULL) AS missing_experience,
    SUM(LeaveOrNot IS NULL) AS missing_leave_status
FROM employees;
DESCRIBE employees;
SELECT DISTINCT Education
FROM employees;
SELECT DISTINCT City
FROM employees;
SELECT DISTINCT PaymentTier
FROM employees
ORDER BY PaymentTier;
SELECT DISTINCT Gender
FROM employees;
SELECT DISTINCT EverBenched
FROM employees;
SELECT DISTINCT LeaveOrNot
FROM employees;
SELECT
    LeaveOrNot,
    COUNT(*) AS number_of_employees
FROM employees
GROUP BY LeaveOrNot;
-- Q1: How many employees stayed and how many left the company?

SELECT
    LeaveOrNot,
    COUNT(*) AS number_of_employees
FROM employees
GROUP BY LeaveOrNot;
-- Q2: What is the overall employee attrition rate?

SELECT
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees;
-- Q3: Which city has the highest employee attrition rate?

SELECT
    City,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY City
ORDER BY attrition_rate DESC;
-- Q4: Which payment tier has the highest employee attrition rate?

SELECT
    PaymentTier,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY PaymentTier
ORDER BY attrition_rate DESC;
-- Q5: Does being benched affect employee attrition?

SELECT
    EverBenched,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY EverBenched
ORDER BY attrition_rate DESC;
-- Q6: Does employee attrition differ by gender?

SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY Gender
ORDER BY attrition_rate DESC;
-- Q7: Which education level has the highest employee attrition rate?

SELECT
    Education,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY Education
ORDER BY attrition_rate DESC;
-- Q8: Which age group has the highest employee attrition rate?

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 30 THEN '25-30'
        WHEN Age BETWEEN 31 AND 35 THEN '31-35'
        WHEN Age BETWEEN 36 AND 40 THEN '36-40'
        ELSE 'Over 40'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;
-- Q9: Which joining year has the highest employee attrition rate?

SELECT
    JoiningYear,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY JoiningYear
ORDER BY attrition_rate DESC;
-- Q10: How does experience in the current domain affect attrition?

SELECT
    ExperienceInCurrentDomain AS years_of_experience,
    COUNT(*) AS total_employees,
    SUM(LeaveOrNot) AS employees_left,
    ROUND(SUM(LeaveOrNot) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY ExperienceInCurrentDomain
ORDER BY attrition_rate DESC;