# Data-Engineer-Assignment

# Introduction

This document outlines the solution for the data mart creation and data processing pipeline for analyzing pupil data and attendance performance at NewGlobe academies.

## Objective

Design and implement a data mart using a star schema dimensional model to facilitate querying and analysis of pupil data by analysts. The data mart will be populated using an ETL/ELT pipeline that incrementally loads data from provided CSV files.

## Assumptions

- The maximum time allocated for this task is 4 hours.
- No visual representation of the output is required.
- The designed data mart and pipeline are scalable for handling massive datasets on cloud data warehouse platforms like GCP BigQuery.

## Data Sources

- Pupil data CSV file.
- Pupil attendance CSV file.

## Deliverables

1. ETL/ELT script.
2. Scheduling script.
3. Readme file with:
   - Explanation of design and assumptions.
   - Instructions for running and scheduling the ETL/ELT pipeline.

## Methodology

### 1. Data Modeling

- Create a star schema dimensional model by identifying:
  - Fact table: Contains pupil-specific data and metrics.
  - Dimension tables: Store descriptive attributes for pupils, academies, attendance dates, etc.
  - Define primary and foreign keys to establish relationships between tables.

### 2. Data Extraction and Transformation

- Develop scripts to extract data from both CSV files.
- Perform data cleaning and transformation steps:
  - Handle missing values.
  - Standardize data formats and units.
  - Derive additional metrics based on existing data.

### 3. Data Loading

- Implement an ETL/ELT pipeline to load data into the data mart.
- Consider incremental loading to optimize performance for large datasets.
- Ensure data integrity and consistency during the loading process.

### 4. Scheduling

- Create a scheduling script to automate the ETL/ELT pipeline execution at desired intervals.
- Utilize cron jobs or cloud-based scheduling services for automated execution.

### Readme File Content

#### 1. Design Explanation

- Describe the chosen star schema dimensional model and its rationale.
- Explain data cleaning and transformation steps applied.
- Outline the data loading process and chosen ETL/ELT approach.
- Discuss the assumptions made during the design process.

#### 2. Execution Instructions

- Provide clear instructions on how to run the ETL/ELT script.
- Explain how to modify and schedule the execution using the provided script.
- Specify any dependencies or pre-requisites for running the pipeline.

#### 3. Technical Interview

- Briefly outline the expected flow of the technical interview discussion.
- Specify the type of query that might be used to assess the data mart's functionality.

## Technology Stack

- The data mart can be implemented using any preferred SQL database (MySQL, PostgreSQL, MS SQL Server, etc.).
- Programming languages like Python or SQL can be used for data processing and ETL/ELT script development.
- Cloud-based data warehouse platforms like GCP BigQuery can be considered for future scalability.

## Expected Outcome

By following this methodology and delivering the required documents, you will demonstrate your understanding of data modeling, ETL/ELT processes, and data analysis using a star schema data mart. Your solution should be scalable, efficient, and suitable for handling large datasets in a production environment.

## Additional Notes

- Feel free to optimize and enhance the proposed solution based on your expertise and preferences.
- Clearly document your design decisions and reasoning within the readme file.
- Be prepared to discuss your approach and answer questions during the technical interview.
