Query 1:  Find the average age of employess who left the job vs who stayed.
Solution: SELECT 
          Attrition, 
          AVG(Age) AS avg_age
          FROM employee
          GROUP BY Attrition;
Query 2:  Compare average monthly income by education and attrition.
Solution: SELECT 
          Education, 
          Attrition, 
          AVG(MonthlyIncome) AS avg_income
          FROM employee
          GROUP BY Education, Attrition; 
Query 3:  Find how job satisfaction of employees impact attrition rate.
Solution: SELECT 
          JobSatisfaction, 
          Attrition, 
          COUNT(*) AS count
          FROM employee
          GROUP BY JobSatisfaction, Attrition;
Query 4:  Find departments that have highest attrition rate.
Solution: SELECT 
          Department, 
          COUNT(*) AS attrition_count
          FROM employee
          WHERE attrition = 'Yes'
          GROUP BY department
          ORDER BY attrition_count DESC;
Query 5:  Find employees with high performance but low job satisfaction. 
Solution: SELECT 
          EmployeeNumber, 
          JobRole, 
          PerformanceRating, 
          JobSatisfaction
          FROM employee
          WHERE PerformanceRating >= 4 AND JobSatisfaction <= 2;
Query 6:  Identify departments with highest attrition rate, considering overtime.
Solution: SELECT Department, 
          OverTime, 
          COUNT(*) AS attrition_count
          FROM employee
          WHERE Attrition = 'Yes'
          GROUP BY Department, OverTime
          ORDER BY Attrition_count DESC;
Query 7:  Identify top three job roles with highest attrition rates.
Solution: SELECT 
          JobRole, 
          attrition_rate
          FROM (
              SELECT JobRole, 
                     COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee WHERE Attrition = 'Yes') AS attrition_rate,
                     RANK() OVER (ORDER BY COUNT(*) DESC) AS job_rank  
              FROM employee
              WHERE Attrition = 'Yes'
              GROUP BY JobRole
          ) AS ranked_roles
          WHERE job_rank <= 3;
Query 8:  Identify Valuable employees and predict their attrition rates.
Solution: SELECT 
          EmployeeNumber, 
          JobRole, 
          PerformanceRating, 
          JobInvolvement, 
          JobSatisfaction, 
          EnvironmentSatisfaction,
          CASE 
                  WHEN  PerformanceRating>= 3 AND JobInvolvement >= 3 AND JobSatisfaction >= 3 AND EnvironmentSatisfaction >= 3 THEN 'Low Attrition Risk'
                  WHEN PerformanceRating >= 3 AND JobInvolvement >= 3 AND (JobSatisfaction < 3 OR EnvironmentSatisfaction < 3) THEN 'Medium Attrition Risk'
                  WHEN PerformanceRating < 3 OR JobInvolvement < 3 THEN 'High Attrition Risk'
                  ELSE 'Unknown Risk'
          END AS attrition_risk,
           CASE 
                  WHEN PerformanceRating >= 4 THEN 'High Value Employee'
                  WHEN PerformanceRating = 3 THEN 'Moderate Value Employee'
                  ELSE 'Low Value Employee'
           END AS employee_value
          FROM employee
          ORDER BY employee_value DESC, attrition_risk;
Query 9:  Prediction of employee attrition risk based on years at company, total working years, and overtime.
Solution: SELECT EmployeeNumber, 
          JobRole, 
          YearsAtCompany, 
          TotalWorkingYears, 
          OverTime,
           CASE 
               WHEN YearsAtCompany >= 5 AND OverTime = 'No' THEN 'Low Attrition Risk'
               WHEN YearsAtCompany < 5 AND OverTime = 'Yes' THEN 'High Attrition Risk'
               WHEN TotalWorkingYears >= 10 THEN 'Experienced but Medium Attrition Risk'
               ELSE 'Unknown Risk'
           END AS attrition_risk
          FROM employee;
