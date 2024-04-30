//Brief Description: 
This project focuses on analyzing patient waitlist data spanning three years to derive insights that can enhance decision-making for hospital management. By leveraging Microsoft Fabric Lakehouse for data ingestion and storage, and employing Spark SQL and PySpark for data transformation, we aim to provide a comprehensive view of waitlist trends and key performance indicators (KPIs). The transformed dataset is connected to Power BI for intuitive visualization, enabling stakeholders to make informed decisions regarding resource allocation, patient prioritization, and process optimization.

/Goals:
Analyze patient waitlist trends over three years to identify patterns and areas for improvement.
Calculate key performance indicators (KPIs), including current waitlist count and percentage change from the previous month.
Provide interactive visualizations through Power BI, allowing stakeholders to explore waitlist data dynamically.
Enable hospital management to make data-driven decisions for improving patient care and resource utilization.

Architecture/Technologies Used:

https://github.com/monmarupeddi/Projects/blob/main/Wait%20List%20Analysis/Drawing.png

Data Ingestion & Storage: Microsoft Fabric Lakehouse is utilized for seamless ingestion and storage of patient waitlist data.
Data Transformation: Spark SQL and PySpark are employed in a notebook environment to perform data transformation tasks, including cleaning, aggregation, and feature engineering.
Visualization: Power BI is utilized to create interactive visualizations that depict waitlist trends, KPIs, and filter options based on age, specialty, and years (2019-2021).
Connectivity: The transformed dataset is connected to Power BI through a SQL endpoint, enabling real-time data access and visualization.

Visualization: 

REPORT LINK:    Power BI interactive report

Report Image:

         





DAX Measures in Power BI: In Power BI, we implemented several DAX (Data Analysis Expressions) measures to calculate key performance indicators (KPIs) and facilitate dynamic analysis. Some of the DAX measures used include:

Current Waitlist Count: This measure calculates the current number of patients on the waitlist for the selected month and year.
Percentage Change from Previous Month: Utilizing DAX, we computed the percentage change in the waitlist count from the previous month, providing insights into month-to-month fluctuations.
Average Wait Time: By leveraging DAX functions, we calculated the average wait time for patients on the waitlist, enabling stakeholders to monitor and manage patient wait times effectively.
Waitlist by Age Group: DAX measures were employed to segment the waitlist data by age group, allowing for targeted analysis and resource allocation based on age demographics.

Why?

Resource Allocation: By analyzing waitlist trends and KPIs, hospital management can allocate resources more efficiently, ensuring timely patient care and reducing wait times.
Patient Prioritization: Insights derived from the analysis enable prioritization of patients based on factors such as urgency, specialty, and historical waitlist data, leading to improved patient outcomes.
Process Optimization: Understanding waitlist patterns facilitates process optimization, streamlining administrative processes, and reducing bottlenecks in patient flow.
Data-Driven Decision Making: Utilizing data-driven insights empowers hospital management to make informed decisions regarding staffing, facility expansion, and service offerings, ultimately enhancing overall operational efficiency and patient satisfaction.

By leveraging advanced data analytics and visualization techniques, this project aims to provide actionable insights that drive positive outcomes for both patients and healthcare providers.

