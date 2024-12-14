-- Databricks notebook source
--- Defines the Clinical Year Version

SET YEAR = 2023;

-- COMMAND ----------

-- Creates the Table for 'clinicaltrial_<year>' & 'pharma'

DROP TABLE IF EXISTS clinicaltrial;
CREATE TABLE clinicaltrial
USING CSV
OPTIONS (Path 'dbfs:/FileStore/tables/clinicaltrial${hiveconf:YEAR}.csv', Header 'TRUE', InfersSchema 'True', Delimiter ',');

DROP TABLE IF EXISTS pharma;
CREATE TABLE pharma
USING CSV
OPTIONS (Path 'dbfs:/FileStore/tables/pharma.csv', Header 'True', InfersSchema 'True');

-- COMMAND ----------

-- Checks for the 'clinicaltrial_<year>' & 'pharma' Tables

SHOW TABLES LIKE 'clinicaltrial|pharma';

-- COMMAND ----------

-- Views the Content of 'clinicaltrial_<year>'

SELECT *
FROM clinicaltrial

-- COMMAND ----------

-- Views the Content of 'pharma'

SELECT *
FROM pharma

-- COMMAND ----------

-- Question 1 - Counts the Number of Distinct Studies

SELECT DISTINCT COUNT(*) AS Total_Studies 
FROM clinicaltrial

-- COMMAND ----------

-- Question 2 - Lists the Types of Studies with Frequency

SELECT Type, COUNT(*) AS Frequency
FROM clinicaltrial
GROUP BY Type
ORDER BY Frequency DESC

-- COMMAND ----------

-- Question 3 - Lists the Top 5 Conditions with Frequency

SELECT Conditions, COUNT(*) AS Frequency
FROM (
  SELECT explode(split(Conditions, '\\|')) AS Conditions
  FROM clinicaltrial
  WHERE Conditions IS NOT NULL
)
GROUP BY Conditions
ORDER BY Frequency DESC
LIMIT 5

-- COMMAND ----------

-- Question 4 - Lists the Top 10 Most Common Non-Pharmaceutical Sponsors with Clinical Trials

SELECT Sponsor, COUNT(*) as Trials
FROM clinicaltrial
WHERE Sponsor NOT IN (SELECT Parent_Company FROM pharma)
GROUP BY Sponsor
ORDER BY Trials DESC
LIMIT 10

-- COMMAND ----------

-- Question 5 - Lists the Completed Studies Each Month in a Given Year

SELECT DATE_FORMAT(TO_DATE(Completion), 'MMM') AS Month, COUNT(*) AS Completed_Studies 
FROM clinicaltrial
WHERE (Status = 'Completed' or Status = 'COMPLETED') AND YEAR(TO_DATE(Completion)) = ${hiveconf:YEAR}
GROUP BY Month
ORDER BY TO_DATE(Month, 'MMM')

-- COMMAND ----------

-- Further Analysis 3 - Lists the Count & Percentage of Clinical Trials from Each Status

SELECT Status, COUNT(*) AS Frequency, 
    CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER()) * 100, 2), '%') AS Percentage
FROM clinicaltrial
GROUP BY Status
ORDER BY Frequency DESC
