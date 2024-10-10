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
Query 6:  
