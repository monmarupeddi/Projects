# Brief Description:

This project focuses on analyzing patient waitlist data spanning three years to derive insights that can enhance decision-making for hospital management. By leveraging Microsoft Fabric Lakehouse for data ingestion and storage, and employing Spark SQL and PySpark for data transformation, this project aims to provide a comprehensive view of waitlist trends and key performance indicators (KPIs). The transformed dataset is connected to Power BI for intuitive visualization, enabling stakeholders to make informed decisions regarding resource allocation, patient prioritization, and process optimization.

# Goals:

Analyze patient waitlist trends over three years to identify patterns, changes and areas for improvement.
Calculate key performance indicators (KPIs), including current waitlist count and percentage change from the previous month.
Provide interactive visualizations through Power BI, allowing stakeholders to explore waitlist data dynamically.
Enable hospital management to make data-driven decisions for improving patient care and resource utilization.

# Data Architecture and Tools:
  ![Architecture](https://github.com/monmarupeddi/Projects/blob/main/Wait%20List%20Analysis/Drawing.png?raw=true)                             

## Data Ingestion & Storage: Microsoft Fabric Lakehouse is utilized for seamless ingestion and storage of patient waitlist data.
## Data Transformation: Spark SQL and PySpark are employed in a notebook environment to perform data transformation tasks.

# Visualization:
Power BI is utilized to create interactive visualizations that depict waitlist trends, KPIs, and filter options based on age, specialty, and years (2019-2021).
Connectivity: The transformed dataset is connected to Power BI through a SQL endpoint, enabling real-time data access and visualization.
## Report Image:
![dashboard](https://github.com/monmarupeddi/Projects/blob/main/Wait%20List%20Analysis/dashboard.png?raw=true) 
         
# DAX Measures in Power BI:

In Power BI,  DAX (Data Analysis Expressions) measures are employed to calculate key performance indicators (KPIs) and facilitate dynamic analysis.

### Current Waitlist Count: This measure calculates the current number of patients on the waitlist for the selected month and year.
 ```
CURR MONTH = CALCULATE(SUM(all_data[Total]),all_data[Archive] = MAX(all_data[Archive]))
```
### Percentage Change from Previous Month: 
Utilizing DAX, we computed the percentage change in the waitlist count from the previous month, providing insights into month-to-month fluctuations.
 ```
prev month = CALCULATE(SUM(all_data[Total]),all_data[Archive] = EDATE(MAX(all_data[Archive]), -1))
change = (([CURR MONTH]-[prev month])/[prev month])* 100
```
### Monthly Average Wait Time & Yearly Avegrage Wait time: 
By leveraging DAX functions, the average wait time for patients on the waitlist is calculated, enabling stakeholders to monitor and manage patient wait times effectively.
 ```
AVG overall = DIVIDE([sum], DISTINCTCOUNT(all_data[Archive]))
AVG PER YEAR = [sum]/DISTINCTCOUNT(all_data[Year])
AVGE = SWITCH(VALUES(dummy_table[dummy]),"Avg Monthly Waitlist", [AVG overall], "Avg Yearly Waitlist", [AVG PER YEAR])
```

# Business Use-Cases

### Resource Allocation: 
By analyzing waitlist trends and KPIs, hospital management can allocate resources more efficiently, ensuring timely patient care and reducing wait times.
### Patient Prioritization: 
Insights derived from the analysis enable prioritization of patients based on factors such as urgency, specialty, and historical waitlist data, leading to improved patient outcomes.
### Process Optimization: 
Understanding waitlist patterns facilitates process optimization, streamlining administrative processes, and reducing bottlenecks in patient flow.
