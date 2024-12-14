# Big-Data-Tools-Techniques-Project

Overview
This project leverages PySpark and Spark SQL to analyze two distinct datasets:

Clinical Trials and Pharmaceutical Data - Focused on exploring clinical trials, pharmaceutical sponsors, and associated trends.
Steam Dataset - Used for training and evaluating a collaborative filtering recommender system.
The project is structured to showcase advanced data processing, cleaning, and analysis techniques while utilizing big data tools.

Table of Contents

Project Description
Technologies Used
Setup Instructions
Key Features
Results and Discussion
Further Analysis
Author Information
Project Description
Clinical Trials Dataset Analysis
Analyzed clinical trial data to extract insights, such as:
Total number of distinct studies.
Study types and their frequencies.
Top conditions studied and non-pharmaceutical sponsors.
Monthly trends in completed studies.

Steam Dataset Analysis
Built a collaborative filtering recommender system to predict user preferences.
Applied hyperparameter tuning for model optimization using MLFlow.
Included advanced visualizations and statistical analysis to understand user behavior.

Technologies Used
Python: Core programming language.
PySpark: For big data processing and analytics.
Spark SQL: For SQL-based operations on large datasets.
Databricks: Platform for managing big data clusters and notebooks.
MLFlow: For experiment tracking and hyperparameter optimization.
Matplotlib & Seaborn: For data visualization.

Setup Instructions
Databricks Environment:

Log in to your Databricks account.
Import the dataset(s) in CSV or ZIP format.
Create new notebooks for each task.
Attach a Standard or ML cluster for execution.
Dataset Preparation:

Load and preprocess datasets using PySpark.
Perform data cleaning to ensure consistency.

Running Notebooks:
Execute analysis tasks by creating RDDs, DataFrames, or SQL queries.
Visualize results directly in Databricks or export for reporting.

Key Features
Data Cleaning & Transformation: Used RDDs and DataFrames for extensive preprocessing.

Statistical Analysis:
Explored dataset properties using SQL and PySpark.
Extracted key metrics like top sponsors and study types.

Collaborative Filtering:
Trained an ALS-based recommender system.
Evaluated model accuracy using RMSE.

Visualization:
Presented findings through heatmaps, bar charts, and line graphs.

Results and Discussion

1. Clinical Trials Dataset:
Identified 483,420 distinct studies with detailed analysis of their types and completion trends.
Highlighted the top five conditions and ten non-pharmaceutical sponsors.

2. Steam Dataset:
Achieved RMSE of 0.94 after hyperparameter tuning, demonstrating high model efficiency.

Further Analysis

Clinical Trials:
Sponsors actively recruiting for trials.
Offense group distributions within the pharmaceutical sector.
Count and percentage of trials based on status.

Steam Dataset:
Explored different hyperparameter configurations for the ALS model.
Conducted extra analysis using correlation matrices to identify user-game interactions.
