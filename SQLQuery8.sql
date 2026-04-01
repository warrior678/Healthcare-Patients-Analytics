CREATE DATABASE HEALTHCARE 
USE HEALTHCARE 
SELECT * FROM [dbo].[[dbo]].[healthcare_dataset]]]
-- Find all patients who have the same Medical Condition as 'Bobby JacksOn'.
SELECT h2.Name, h2.[Medical_Condition], h2.Hospital
FROM [dbo].[healthcare_dataset] h1
JOIN [dbo].[healthcare_dataset] h2
  ON h1.[Medical_Condition] = h2.[Medical_Condition]
WHERE h1.Name = 'Bobby JacksOn'
  AND h2.Name != 'Bobby JacksOn'; 
  -- Find pairs of patients who share the same Blood Type and Gender.
  SELECT h1.Name AS Patient_1, h2.Name AS Patient_2,
       h1.[Blood_Type], h1.Gender
FROM [dbo].[[dbo]].[healthcare_dataset]]]  h1
JOIN [dbo].[[dbo]].[healthcare_dataset]]] h2
  ON h1.[Blood_Type] = h2.[Blood_Type]
  AND h1.Gender = h2.Gender
  AND h1.Name < h2.Name; 
  -- Find patients whose Billing Amount is greater than the average Billing Amount of patients with the same Medical Condition.
  SELECT h1.Name, h1.[Medical_Condition],
       ROUND(h1.[Billing_Amount], 2) AS Billing_Amount,
       ROUND(avg_data.avg_billing, 2) AS Avg_Condition_Billing
FROM [dbo].[[dbo]].[healthcare_dataset]]] h1
JOIN (
    SELECT [Medical_Condition],
           AVG([Billing_Amount]) AS avg_billing
    FROM [dbo].[[dbo]].[healthcare_dataset]]]
    GROUP BY [Medical_Condition]
) avg_data
  ON h1.[Medical_Condition] = avg_data.[Medical_Condition]
WHERE h1.[Billing_Amount] > avg_data.avg_billing
ORDER BY h1.[Medical_Condition], h1.[Billing_Amount] DESC; 

-- For each Doctor, find another doctor in the same Hospital who treated a patient with a higher Billing Amount.
SELECT h1.Doctor AS Doctor_1, h2.Doctor AS Doctor_2,
       h1.Hospital,
       ROUND(h1.[Billing_Amount], 2) AS Billing_1,
       ROUND(h2.[Billing_Amount], 2) AS Billing_2
FROM [dbo].[[dbo]].[healthcare_dataset]]] h1
JOIN [dbo].[[dbo]].[healthcare_dataset]]] h2
  ON h1.Hospital = h2.Hospital
  AND h1.Doctor != h2.Doctor
  AND h2.[Billing_Amount] > h1.[Billing_Amount]
ORDER BY h1.Hospital, Billing_2 DESC; 

-- Assign a row number to each record ordered by Billing Amount in descending order.
SELECT Name, [Billing_Amount], [Medical_Condition],
       ROW_NUMBER() OVER (
           ORDER BY [Billing_Amount] DESC) AS Row_Num
FROM [dbo].[[dbo]].[healthcare_dataset]]] 

-- Rank patients by Billing Amount within each Medical Condition using RANK(). Show the top billed patient per condition.
WITH ranked AS (
    SELECT Name, [Medical_Condition], [Billing_Amount],
           RANK() OVER (
               PARTITION BY [Medical_Condition]
               ORDER BY [Billing_Amount] DESC) AS rnk
    FROM [dbo].[[dbo]].[healthcare_dataset]]]
)
SELECT Name, [Medical_Condition],
       ROUND([Billing_Amount], 2) AS Billing_Amount
FROM ranked
WHERE rnk = 1; 

-- Use DENSE_RANK to rank Doctors by the total number of patients they treated. List top 5 doctors.
WITH doc_count AS (
    SELECT Doctor,
           COUNT(*) AS Total_Patients
    FROM [dbo].[[dbo]].[healthcare_dataset]]]
    GROUP BY Doctor
)
SELECT Doctor, Total_Patients,
       DENSE_RANK() OVER (
           ORDER BY Total_Patients DESC) AS DR_Rank
FROM doc_count
ORDER BY DR_Rank
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY; 

-- Find the top 3 highest billed patients per Insurance Provider using DENSE_RANK. Show name, billing, and their rank.
WITH ins_ranked AS (
    SELECT Name, [Insurance_Provider],
           ROUND([Billing_Amount], 2) AS Billing_Amount,
           DENSE_RANK() OVER (
               PARTITION BY [Insurance_Provider]
               ORDER BY [Billing_Amount] DESC) AS bill_rank
    FROM [dbo].[[dbo]].[healthcare_dataset]]]
)
SELECT Name, [Insurance_Provider],
       Billing_Amount, bill_rank
FROM ins_ranked
WHERE bill_rank <= 3
ORDER BY [Insurance_Provider], bill_rank; 

-- Calculate the running total of Billing Amount partitioned by Insurance Provider, ordered by Date of Admission. Show cumulative billing per insurer over time.
SELECT Name, [Insurance_Provider],
       [Date_of_Admission],
       ROUND([Billing_Amount], 2) AS Billing_Amount,
       ROUND(SUM([Billing_Amount]) OVER (
           PARTITION BY [Insurance_Provider]
           ORDER BY [Date_of_Admission]
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ), 2) AS Running_Total_By_Insurer
FROM [dbo].[[dbo]].[healthcare_dataset]]]
ORDER BY [Insurance_Provider], [Date_of_Admission]; 

-- For each patient, show their Billing Amount and the MAX Billing Amount within their Gender group. Also show the difference from the max.
SELECT Name, Gender,
       ROUND([Billing_Amount], 2) AS Billing_Amount,
       ROUND(MAX([Billing_Amount]) OVER (
           PARTITION BY Gender), 2) AS Max_In_Gender,
       ROUND(MAX([Billing_Amount]) OVER (
           PARTITION BY Gender)
           - [Billing_Amount], 2) AS Diff_From_Max
FROM [dbo].[[dbo]].[healthcare_dataset]]]





