import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.functions import lit, col, when, coalesce, udf
from pyspark.sql.types import StructType, StringType, IntegerType, DateType


#Create a Spark session

spark = SparkSession.builder.appName("PupilETL").getOrCreate()

#Specify JDBC connection properties to our database

jdbc_url = "jdbc:sqlserver://127.0.0.1; databaseName=New_Globe_Education"

connection_properties = {
    "user": "admin",
    "password": "admin",
    "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
}

# Read data from other tables
academy_df = spark.read.jdbc(jdbc_url, "Academy", properties = connection_properties)
stream_df = spark.read.jdbc(jdbc_url, "Stream", properties = connection_properties)
attendance_df = spark.read.jdbc(jdbc_url, "Attendance", properties = connection_properties)
grades_df = spark.read.jdbc(jdbc_url, "Grades", properties = connection_properties)
status_df = spark.read.jdbc(jdbc_url, "Status", properties = connection_properties)


