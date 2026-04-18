
													--HOSPITAL MANAGEMENT

CREATE DATABASE HOSPITAL_MANAGEMENT;

USE HOSPITAL_MANAGEMENT;

SELECT* FROM HOSPITAL_DATA;

ALTER TABLE HOSPITAL_DATA
ALTER COLUMN Medical_Expenses DECIMAL(10,2);

--1) TOTAL NUMBER OF PATIENTS
  --	Write an SQL query to find the total number of patients across all hospitals.

SELECT Hospital_Name , SUM(Patients_Count) AS TOTAL_NUMBER_OF_PATIENTS
FROM HOSPITAL_DATA
GROUP BY Hospital_Name;

--2) Average Number of Doctors per Hospital 
  --	Retrieve the average count of doctors available in each hospital. 

	SELECT Hospital_Name ,AVG(Doctors_Count) AS AVG_DOCTORS_PER_HOSPITAL 
	FROM Hospital_Data
	GROUP BY Hospital_Name;

--3) Top 3 Departments with the Highest Number of Patients 
	--Find the top 3 hospital departments that have the highest number of patients. 
	
	 WITH  number_of_patients AS (     
                 SELECT  Hospital_Name,Department,
				 DENSE_RANK () OVER (PARTITION BY Hospital_Name ORDER BY  MAX(Patients_Count) DESC)highest_number_of_patients
				 FROM Hospital_Data
				 GROUP BY Hospital_Name,Department)
		SELECT TOP 3 *
		FROM number_of_patients
		WHERE highest_number_of_patients ='1';

--4) Hospital with the Maximum Medical Expenses 
--Identify the hospital that recorded the highest medical expenses.

 SELECT TOP 1
 Hospital_Name ,
 MAX(Medical_Expenses) AS TOTAL_MEDICAL_EXPENSES
 FROM Hospital_Data
 GROUP BY Hospital_Name
 ORDER BY TOTAL_MEDICAL_EXPENSES DESC;


 --5) Daily Average Medical Expenses  
	--Calculate the average medical expenses per day for each hospital.

	WITH Average_medical_expenses AS (       
	           SELECT Hospital_Name,
			   ROUND(SUM( Medical_Expenses)*1.0,2)AS Total_expenses ,
			  SUM( DATEDIFF (DAY,Admission_Date,Discharge_Date)+1) AS Total_Day
			  FROM Hospital_Data
			  GROUP BY Hospital_Name)
--------->>>
			  SELECT Hospital_Name ,ROUND((Total_expenses/Total_Day),2) AS  per_day_expenses
			  FROM Average_medical_expenses;


SELECT
    Hospital_Name,
    ROUND(SUM(CAST(Medical_Expenses AS DECIMAL(10,2))) /NULLIF(SUM(DATEDIFF(DAY, Admission_Date, Discharge_Date) + 1), 0), 2) AS Per_Day_Expenses
FROM Hospital_Data
GROUP BY Hospital_Name;




--6) Longest Hospital Stay 
	--	Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. 

      WITH longest_stay  AS (SELECT Hospital_Name,
	                       DENSE_RANK()OVER(ORDER BY  ( DATEDIFF(DAY,Admission_Date,Discharge_Date)+1) DESC )AS Total_Day_Stay
	                         FROM Hospital_Data)
                SELECT Hospital_Name,Total_Day_Stay
				FROM longest_stay
				WHERE Total_Day_Stay ='1';


--7) Total Patients Treated Per City 
--		Count the total number of patients treated in each city. 

SELECT Location, 
SUM(Patients_Count) AS TOTAL_PATIENTS_TREATED
FROM Hospital_Data
GROUP BY Location;

--8) Average Length of Stay Per Department 
--	 Calculate the average number of days patients spend in each department. 

SELECT  Department,
AVG(DATEDIFF(DAY ,Admission_Date , Discharge_Date)) AS AVERAGE_DAY
FROM Hospital_Data
GROUP BY  Department ;

--9) Identify the Department with the Lowest Number of Patients 
--	 Find the department with the least number of patients.

SELECT TOP 1
Department , SUM(Patients_Count)  AS TOTAL_PATIENTS
FROM Hospital_Data
GROUP BY Department
ORDER BY SUM(Patients_Count) ASC;

--10)  Monthly Medical Expenses Report 
--		Group the data by month and calculate the total medical expenses for each month.  

SELECT
    FORMAT(Admission_Date,'MMM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Data
GROUP BY FORMAT(Admission_Date,'MMM');













