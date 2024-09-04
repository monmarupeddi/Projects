# Real-Time Data Pipeline

## System Architecture Setup
**This architecture setup integrates Apache Airflow, Apache Kafka, Apache Spark, and Apache Cassandra, all Containerized using Docker-Compose to create a robust, scalable, and efficient real-time data processing pipeline.**
![](https://github.com/monmarupeddi/Projects/blob/main/Property%20Listings-%20Real-time%20Data%20Streaming%2C%20Processing%20and%20Storage/spark-2.png)

## Docker Services (docker-compose.yml):

**Apache Airflow: Data Orchestration-** Manages and orchestrates the entire workflow, scheduling tasks and handling dependencies. It ensures that data flows seamlessly through the system, from ingestion to processing to storage.
***
**Apache Kafka: Data Ingestion-** Acts as a message broker that ingests and streams data in real-time. It decouples data producers and consumers, allowing for scalable and flexible data movement between components.
***
**Apache Spark: Data Processing-** Processes the streaming data in real-time, performing analytics, transformations, and complex computations. It provides powerful capabilities for both batch and stream processing.
***
**Apache Cassandra: Data Storage-** Stores processed data with high availability and scalability. It efficiently handles large volumes of data and supports quick read and write operations, making it ideal for real-time and historical data storage.
***

## Using Python
Python is integral to the pipeline implementation. Utilizing the following packages, python ochestrates and integrates all components of the pipeline
|||
|----|-----|
|Apache Airflow|Python is used to define and execute Directed Acyclic Graphs (DAGs) for workflow orchestration. Airflow’s Python-based operators|
|kafka-python|To stream data into Kafka topics. The script handles data ingestion from various sources and publish it to Kafka|
|pyspark|Spark jobs written in Python perform data processing of data from Kafka|
|cassandra-driver|Python is used to enable writing processed data into Cassandra|

## File Structure
    RT-DataStreaming  
                  |
                  |__ DAGS
                          |
                          |__ kafkaStreaming.py
                  |
                  |__ script
                            |
                            |__ entrypoint.sh
                  |
                  |__ docker-compose.yml
                  |
                  |__ requirements.txt
                  |
                  |__ sparkProcessing.py

***
                  
                            

