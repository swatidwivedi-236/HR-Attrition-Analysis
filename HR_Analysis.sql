-- =============================================
-- HR Employee Attrition Analysis
-- Tool: MySQL Workbench
-- Dataset: IBM HR Analytics (Kaggle)
-- =============================================

-- Query 1: Overall Attrition Rate
select  COUNT(*) AS Total_Employees ,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END ) AS Employees_left ,
SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_stayed ,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS Attrition_Rate
FROM my_database.`hr-employee-attrition`;

-- Query 2: Department wise Attrition
select Department, COUNT(*) AS Total_Employees ,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left ,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*) ,2) AS Attrition_Rate
FROM my_database.`hr-employee-attrition`
group by Department 
order by Attrition_Rate DESC;

-- Query 3: Overtime Impact
select  OverTime , count(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left ,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*) ,2) AS Attrition_Rate
FROM my_database.`hr-employee-attrition`
group by OverTime
order by OverTime DESC;

-- Query 4: Salary Band wise Attrition
select CASE 
WHEN MonthlyIncome < 3000  THEN 'LOW (Below 3k)'
WHEN MonthlyIncome  between 3000 and 6000 THEN 'MEDIAN (3k-6k)'
WHEN MonthlyIncome  between 6001 and 10000 THEN 'HIGH (6k-10k)'  
ELSE 'Very High (Above 10k)'
END AS salary_status ,
count(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes'  THEN 1 ELSE 0 END ) AS Employees_left,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*) ,2) AS  Attrition_Rate
from my_database.`hr-employee-attrition`
group by salary_status 
order by Attrition_Rate DESC ;

-- Query 5: Age Group wise Attrition
select CASE 
	WHEN Age < 25 THEN 'Young (Below 25)'
    WHEN Age BETWEEN 25 AND 35 THEN 'Mid (25-35)'
    WHEN Age BETWEEN 36 AND 45 THEN 'Senior (36-45)'
    ELSE 'Experienced (Above 45)'
END AS Age_Group ,
COUNT(*) AS total_employees ,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left ,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END	) * 100.0/COUNT(*) ,2) AS Attrition_rate 
from my_database.`hr-employee-attrition` 
group by Age_Group
order by Attrition_rate DESC ;

-- Query 6: Job Role wise Attrition
select JobRole , COUNT(*) AS total_jobRoles ,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left,
SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_stayed,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2) AS Attrition_rate
from my_database.`hr-employee-attrition`
group by JobRole  
order by Attrition_rate DESC ;

-- Query 7: Years At Company wise Attrition
select CASE 
WHEN YearsAtCompany <= 2 THEN 'New (0-2 years)'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN 'Early (3-5 years)'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN 'Mid (6-10 years)'
        ELSE 'Experienced (Above 10 years)'
END AS Employees_YearsAtCompany ,
COUNT(*) AS total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left ,
SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_stayed ,
round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2) AS Attrition_rate 
from my_database.`hr-employee-attrition` 
group by Employees_YearsAtCompany  
order by Attrition_rate DESC;

-- Query 8: Work Life Balance wise Attrition
select  CASE 
  WHEN WorkLifeBalance = 1 THEN 'BAD'
  WHEN WorkLifeBalance = 2 THEN 'GOOD'
  WHEN WorkLifeBalance = 3 THEN 'BETTER'
  ELSE 'BEST' 
  END AS Employee_WorkLifeBalance ,
  count(*) AS total_employees ,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_left,
  SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_stayed,
  round(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/COUNT(*),2) AS Attrition_rate
  from my_database.`hr-employee-attrition` 
  group by Employee_WorkLifeBalance
  order by Attrition_rate DESC ;
  
  -- Query 9: Job Satisfaction wise Attrition
  select CASE 
  WHEN JobSatisfaction = 1 THEN 'BAD'
  WHEN JobSatisfaction = 2 THEN 'GOOD'
  WHEN JobSatisfaction = 3 THEN 'BETTER'
  ELSE 'BEST' 
  END AS Employees_JobSatisfaction,
  COUNT(*) AS total_employees ,
  SUM(CASE WHEN Attrition = 'Yes' then 1 else 0 end) AS Employees_left,
  round(SUM(CASE WHEN Attrition = 'Yes' then 1 else 0 end)* 100.0/COUNT(*),2) AS Attrition_rate 
  from my_database.`hr-employee-attrition` 
  group by Employees_JobSatisfaction 
  order by Attrition_rate desc ;