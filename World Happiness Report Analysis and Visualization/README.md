# World Happiness Report Analysis (2017-2023)

# Brief Description: 
The project delves into a comprehensive analysis of the World Happiness Report 2023. By harnessing data engineering services provided by Azure, the project aims to extract valuable insights into global happiness trends, through data ingestion, transformation, and visualization processes, to understand the dynamics of happiness factors and their evolution over time.

# Project Goals:
1. Analyze and interpret trends in global happiness.
2. Identify factors influencing happiness levels across nations.
3. Utilize Azure data engineering services for efficient data processing and visualization.
4. Provide actionable insights derived from the analysis.

# Data Architecture:
 ![arch](https://github.com/monmarupeddi/Projects/blob/main/World%20Happiness%20Report%20Analysis%20and%20Visualization/Drawing%201.png?raw=true)                     

### Data Ingestion: 
Azure Data Factory facilitates seamless ingestion of World Happiness Report measures from 2017 to 2023 via HTTPS.
### Data Storage: 
Leveraging Azure Data Lake Storage Gen2,  a medallion architecture is implemented to transform raw data into refined layers.
### Data Transformation: 
Data Transformation is performed on Azure Databricks platform using PySpark.
### Visualization: 
The processed data is visualized using Tableau, offering intuitive and interactive insights into global happiness trends.

# Scope: 
The scope of analysis encompasses:
1. Examination of happiness metrics (e.g., GDP per capita, social support, life expectancy) and their influences on the scores.
2. Comparative analysis of happiness trends over the specified period, highlighting significant changes and patterns.
3. Identification of correlations and causal relationships between socio-economic factors and happiness levels.

# Dashboard image on Tableau
![dashboard](https://github.com/monmarupeddi/Projects/blob/main/World%20Happiness%20Report%20Analysis%20and%20Visualization/Dashboardwhr.png?raw=true)

                             
