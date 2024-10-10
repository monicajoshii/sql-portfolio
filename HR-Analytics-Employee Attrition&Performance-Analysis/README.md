# Project Overview
This project analyzes a dataset of employee attrition and performance to uncover factors contributing to employee turnover. By exploring key metrics such as job satisfaction, performance ratings, job involvement, and work-life balance, the project aims to provide insights into attrition patterns and identify valuable employees who may be at risk of leaving. The analysis uses SQL queries to answer important HR-related questions and to identify potential risk factors for attrition. Additionally, the project offers predictive insights by classifying employees based on their attrition risk and value to the company.
## Data Description
The dataset contains 35 columns. Key attributes listed in the dataset are as following:
1. Employee Information: Age, BusinessTravel, Department, DistanceFromHome, Education, EducationField, EmployeeCount, EmployeeNumber, Gender, JobLevel, JobRole, MaritalStatus, NumCompaniesWorked, Over18, OverTime, StandardHours, StockOptionLevel, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager.
2. Performance Metrics: EnvironmentSatisfaction, JobInvolvement, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, WorkLifeBalance, PercentSalaryHike, TrainingTimesLastYear.
3. Attrition & Income: Attrition, DailyRate, HourlyRate, MonthlyIncome, MonthlyRate.

Key Columns:
1. Attrition: Indicates whether an employee has left the company.
2. Education: Indicates highest level of formal education completed by an employee ranging from 1('Below College') to 5('Doctorate').
3. EnvironmentSatisfaction: Measures the employee's satisfaction with their work environment, with 1 being 'Low' and 4 being 'Very High'.
4. JobInvolvement: Indicates the level of the employee's engagement and commitment to their job, where 1 is 'Low' and 4 is 'Very High'.
5. JobSatisfaction: Reflects the employee's overall satisfaction with their job, ranging from 1('Low') to 4('Very High').
6. PerformanceRating: Evaluates the employee's work performance, with 1 being 'Low' and 4 being 'Outstanding'.
7. RelationshipSatisfaction: Assesses the employee's satisfaction with their relationships with colleagues and managers, from 1('Low') to 4('Very High').
8. WorkLifeBalance:  Measures the employee's perception of their work-life balance, where 1 is 'Bad' and 4 is 'Best'.
9. PercentSalaryHike: Represents the percentage increase in the employee's salary over a specified period, indicating financial growth and recognition.
10. TrainingTimesLastYear: Indicates the number of training sessions or hours the employee participated in during the last year, reflecting investment in skill development.
   
The dataset is downloaded from [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset/data).
