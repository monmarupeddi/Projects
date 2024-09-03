import logging
from cassandra.cluster import Cluster
from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col
from pyspark.sql.types import StructType, StructField, StringType


def create_keyspace(session):
    session.execute("""
        CREATE KEYSPACE IF NOT EXISTS spark_stream
        WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};
    """)

    print("Keyspace created successfully!")


def create_table(session):
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
    area TEXT,
    price TEXT,
    rent_estimate TEXT,
    taxVal TEXT,
    lat TEXT,
    long TEXT,
    image TEXT);""")

    print("Table created successfully!")


def insert_data(session, **kwargs):
    print("inserting data...")

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
        logging.error(f'could not insert data due to {e}')


def create_spark_connection():
    s_conn = None

    try:
        s_conn = SparkSession.builder \
            .appName('SparkDataStreaming') \
            .config('spark.jars.packages', "com.datastax.spark:spark-cassandra-connector_2.13:3.4.1,"
                                           "org.apache.spark:spark-sql-kafka-0-10_2.13:3.4.1") \
            .config('spark.cassandra.connection.host', 'localhost') \
            .getOrCreate()

        s_conn.sparkContext.setLogLevel("ERROR")
        logging.info("Spark connection created successfully!")
    except Exception as e:
        logging.error(f"Couldn't create the spark session due to exception {e}")

    return s_conn


def connect_to_kafka(spark_conn):
    spark_df = None
    try:
        spark_df = spark_conn.readStream \
            .format('kafka') \
            .option('kafka.bootstrap.servers', 'localhost:9092') \
            .option('subscribe', 'users_created') \
            .option('startingOffsets', 'earliest') \
            .load()
        logging.info("kafka dataframe created successfully")
    except Exception as e:
        logging.warning(f"kafka dataframe could not be created because: {e}")

    return spark_df


def create_cassandra_connection():
    try:
        # connecting to the cassandra cluster
        cluster = Cluster(['localhost'])

        cas_session = cluster.connect()

        return cas_session
    except Exception as e:
        logging.error(f"Could not create cassandra connection due to {e}")
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
        StructField("price", StringType(), False),
        StructField("rent_estimate", StringType(), False),
        StructField("taxVal", StringType(), False),
        StructField("lat", StringType(), False),
        StructField("long", StringType(), False),
        StructField("image", StringType(), False)
    ])

    sel = spark_df.selectExpr("CAST(value AS STRING)") \
        .select(from_json(col('value'), schema).alias('data')).select("data.*")
    print(sel)

    return sel


if __name__ == "__main__":
    # create spark connection
    spark_conn = create_spark_connection()

    if spark_conn is not None:
        # connect to kafka with spark connection
        spark_df = connect_to_kafka(spark_conn)
        selection_df = create_selection_df_from_kafka(spark_df)
        session = create_cassandra_connection()

        if session is not None:
            create_keyspace(session)
            create_table(session)

            logging.info("Streaming is being started...")

            streaming_query = (selection_df.writeStream.format("org.apache.spark.sql.cassandra")
                               .option('checkpointLocation', '/tmp/checkpoint')
                               .option('keyspace', 'spark_stream')
                               .option('table', 'property_listings')
                               .start())

            streaming_query.awaitTermination()