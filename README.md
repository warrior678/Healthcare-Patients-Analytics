# 🏥 Healthcare-Patients-Analytics

![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning-217346?logo=microsoftexcel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-T--SQL-CC2927?logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-Pandas%20%7C%20Matplotlib-3776AB?logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green)

An end-to-end healthcare data analysis project that processes and analyzes patient records using **Excel**, **SQL**, **Python**, and **Power BI**. The project uncovers trends in hospital admissions, billing patterns, medical conditions, and patient outcomes to support data-driven decision-making in healthcare.
 Project Overview
This project simulates a real-world healthcare analytics scenario by integrating four industry-standard tools across the full data analysis pipeline — from raw data cleaning to interactive dashboard development. It analyzes patient healthcare records to identify meaningful patterns in medical conditions, hospital performance, and billing data.
 Project Objectives
- Perform data cleaning and preprocessing of raw healthcare records
- Analyze patient demographics and medical conditions
- Calculate key healthcare performance metrics (KPIs)
- Identify trends in hospital admissions and billing amounts
- Build interactive dashboards for operational decision-making
 Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Excel** | Data cleaning, formatting, and preprocessing |
| **SQL (T-SQL)** | Data querying, filtering, and aggregation |
| **Python** (Pandas, Matplotlib) | Data analysis, KPI calculation, and visualization |
| **Power BI** | Interactive dashboard and KPI visualization |
 Repository Structure
Healthcare-Patients-Analytics/
│
├── healthcare_dataset.csv     # Raw dataset (CSV format)
├── healthcare_dataset.xlsx    # Cleaned dataset (Excel format)
├── SQLQuery8.sql              # SQL queries for data analysis
├── Healthcare.ipynb           # Python analysis notebook
├── Healthcare.pbix            # Power BI dashboard file
└── README.md                  # Project documentation

 Key Performance Indicators (KPIs)
-  **Total Patients** — Overall patient count in the dataset
-  **Total Billing Amount** — Aggregate hospital billing across all patients
-  **Average Billing Amount** — Mean billing per patient visit
-  **Average Length of Stay** — Average days between admission and discharge
-  **Patients by Medical Condition** — Breakdown by diagnosis/condition
-  **Admission Type Distribution** — Emergency vs Elective vs Urgent
-  **Insurance Provider Analysis** — Coverage patterns across providers

 Dataset Description
The dataset contains patient healthcare records with the following fields:
| Field | Description |
|-------|-------------|
| Name | Patient name |
| Age | Patient age |
| Gender | Male / Female |
| Blood Type | Patient blood group |
| Medical Condition | Primary diagnosis |
| Date of Admission | Hospital admission date |
| Discharge Date | Date of discharge |
| Doctor | Attending physician |
| Hospital | Hospital name |
| Insurance Provider | Patient's insurance company |
| Billing Amount | Total bill for the visit |
| Room Number | Assigned room |
| Admission Type | Emergency / Elective / Urgent |
| Medication | Prescribed medication |
| Test Results | Lab/diagnostic test outcomes |
 Project Workflow
1. Excel        →  Data cleaning, formatting, removing duplicates
2. SQL          →  Querying, filtering, aggregating patient records
3. Python       →  KPI calculation, statistical analysis, charts
4. Power BI     →  Interactive dashboard & visual storytelling

 Getting Started
 Prerequisites
Install Python dependencies:
bash
pip install pandas matplotlib jupyter
 Running the Notebook
```bash
jupyter notebook Healthcare.ipynb
```
 Running SQL Queries
1. Import `healthcare_dataset.csv` into SQL Server
2. Open `SQLQuery8.sql` in SQL Server Management Studio (SSMS)
3. Execute queries to explore and analyze patient data
 Viewing the Power BI Dashboard
1. Download [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
2. Open `Healthcare.pbix`
3. Use slicers to filter by condition, admission type, or insurance provider
 Project Outcome
This project demonstrates practical skills in data cleaning, SQL querying, Python-based analysis, and Power BI dashboard development. It showcases the ability to transform raw healthcare records into actionable insights across the full analytics pipeline — a key competency for Data Analyst roles in healthcare and business environments.
 Author

**Gautam Kumar**
Data Analyst | SQL | Python | Power BI | Excel

- GitHub: [@warrior678](https://github.com/warrior678)




