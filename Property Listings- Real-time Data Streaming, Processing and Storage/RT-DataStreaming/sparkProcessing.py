import logging
from cassandra.cluster import Cluster
from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# create a cassandra table to populate with data
def createTable(session):
    session.execute("""
    CREATE TABLE IF NOT EXISTS spark_stream.property_listings (
    id UUID PRIMARY KEY,
    bed TEXT,
    bath TEXT,
    street TEXT,
    city TEXT,
    country TEXT,
    zip TEXT,
    days_on_zillow TEXT,
    status TEXT,
    type TEXT,
    featured TEXT,
    non_owner_occupied TEXT,
    area FLOAT,
    price FLOAT,
    rent_estimate TEXT,
    taxVal FLOAT,
    lat TEXT,
    long TEXT,
    image TEXT);""")

    print("Table created")

# insert into cassandra
def insertDataIntoCassandra(session, **kwargs):
    print("Inserting---")
# get the data from arguments in a dictionary form.
    bed = kwargs.get('bed')
    bath = kwargs.get('bath')
    street = kwargs.get('street')
    city = kwargs.get('city')
    country = kwargs.get('country')
    zip = kwargs.get('zip')
    days_on_zillow = kwargs.get('days_on_zillow')
    status = kwargs.get('status')
    type = kwargs.get('type')
    featured = kwargs.get('featured')
    non_owner_occupied = kwargs.get('non_owner_occupied')
    area = kwargs.get('area')
    price = kwargs.get('price')
    rent_estimate = kwargs.get('rent_estimate')
    taxVal = kwargs.get('taxVal')
    lat = kwargs.get('lat')
    long = kwargs.get('long')  # Using 'long_' to avoid conflict with the built-in 'long' type in Python 2.x
    image = kwargs.get('image')
# execute query
    try:
        session.execute("""
       
    INSERT INTO spark_streams.property_listings (
        bed, bath, street, city, country, zip, days_on_zillow, 
        status, type, featured, non_owner_occupied, area, 
        price, rent_estimate, taxVal, lat, long, image
    ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
    ),
        """, (bed, bath, street, city, country, zip, days_on_zillow, status, type, featured, non_owner_occupied, area, price, rent_estimate, taxVal, lat, long, image))
        logging.info(f"Data inserted")

    except Exception as e:
        logging.error("Insertion unsuccessful due to {e}")

# spark connection
def createSparkSession():
    connection = None

    try:
        connection = SparkSession.builder \
            .appName('SparkDataStreaming') \
            .config('spark.jars.packages', "com.datastax.spark:spark-cassandra-connector_2.13:3.4.1,"
                                           "org.apache.spark:spark-sql-kafka-0-10_2.13:3.4.1") \
            .config('spark.cassandra.connection.host', 'localhost') \
            .getOrCreate()

        connection.sparkContext.setLogLevel("ERROR")
        logging.info("Spark connection created successfully!")
    except Exception as e:
        logging.error(f"Couldn't create the spark session due to exception {e}")

    return connection

# kafka connection: insert into spark dataframe the data coming from kafka
def connect2kafka(spark_connection):
    spark_df = None
    try:
        spark_df = spark_connection.readStream \
            .format('kafka') \
            .option('kafka.bootstrap.servers', 'localhost:9092') \
            .option('subscribe', 'users_created') \
            .option('startingOffsets', 'earliest') \
            .load()
        logging.info("kafka dataframe created successfully")
    except Exception as e:
        logging.warning(f"error: {e}")

    return spark_df

# connect to cassandra
def createCassandraConnection():
    try:
        # connecting to the cassandra cluster
        cluster = Cluster(['localhost'])

        cas_session = cluster.connect()

        return cas_session
    except Exception as e:
        logging.error(f"cassandra connection unsuccessful due to {e}")
        return None


def create_selection_df_from_kafka(spark_df):
    schema = StructType([
        StructField("bed", StringType(), False),
        StructField("bath", StringType(), False),
        StructField("street", StringType(), False),
        StructField("city", StringType(), False),
        StructField("country", StringType(), False),
        StructField("zip", StringType(), False),
        StructField("days_on_zillow", StringType(), False),
        StructField("status", StringType(), False),
        StructField("type", StringType(), False),
        StructField("featured", StringType(), False),
        StructField("non_owner_occupied", StringType(), False),
        StructField("area", StringType(), False),
        StructField("price", IntegerType(), False),
        StructField("rent_estimate", StringType(), False),
        StructField("taxVal", IntegerType(), False),
        StructField("lat", StringType(), False),
        StructField("long", StringType(), False),
        StructField("image", StringType(), False)
    ])

    sel = spark_df.selectExpr("CAST(value AS STRING)") \
        .select(from_json(col('value'), schema).alias('data')).select("data.*")
    print(sel)

    return sel


if __name__ == "__main__":

    spark_connection = createSparkSession()

    # Proceed if the Spark session was created successfully
    if spark_connection is not None:
        # Connect to Kafka and create a DataFrame from the Kafka stream
        spark_df = connect2kafka(spark_connection)

        # Transform the Kafka DataFrame by applying the schema to parse the JSON data
        selection_df = create_selection_df_from_kafka(spark_df)

        # Establish a connection to the Cassandra database
        session = createCassandraConnection()

        # Proceed if the Cassandra connection was successfully established
        if session is not None:
            # Create a keyspace in Cassandra if it does not already exist
            session.execute("""
                CREATE KEYSPACE IF NOT EXISTS spark_stream
                WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};
            """)
            print("Keyspace created successfully!")

            # Create the table within the Cassandra keyspace if it does not already exist
            createTable(session)

            # Log the start of the streaming process
            logging.info("Streaming is being started...")

            # Start a streaming query that reads from the transformed Kafka DataFrame
            # and writes the data to the Cassandra table
            streaming_query = (selection_df.writeStream
                               .format("org.apache.spark.sql.cassandra")
                               .option('checkpointLocation',
                                       '/tmp/checkpoint')  # Checkpoint directory for fault tolerance
                               .option('keyspace', 'spark_stream')  # Cassandra keyspace
                               .option('table', 'property_listings')  # Cassandra table
                               .start())  # Start the streaming query

            # Wait for the streaming query to finish
            streaming_query.awaitTermination()
