from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.sql.window import Window
from pyspark.sql import functions as F

# Specify CSV path for Pupil_details
pupil_details_path = "C:\Users\ARCHITECT\Documents\Data-Engineer-Assignment\pupils_details.csv"


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

#Create or replace temporary views for tables
academy_df.createOrReplaceTempView("Academy")
stream_df.createOrReplaceTempView("Stream")
attendance_df.createOrReplaceTempView("Attendance")
grades_df.createOrReplaceTempView("Grades")
status_df.createOrReplacetempView("Status")

# Fetch data from the csv for pupils.
pupil_Details_df = spark.read.option("header","true").csv(pupil_details_path)


#Extract data based on Snapshot of the csv
latest_snapshot = pupil_Details_df.agg({"SnapshotDate": "max"}).collect()[0][0]
new_pupil_data_df = pupil_Details_df.filter(f"snapshotDate > '{latest_snapshot}'")


#Performing transformation by joining with other tables

new_pupil_data_df = new_pupil_data_df.join(academy_df, on="AcademyName", how="left")
new_pupil_data_df = new_pupil_data_df.join(stream_df, on="Stream", how="left")
new_pupil_data_df = new_pupil_data_df.join(grades_df, on="GradeName", how="left")
new_pupil_data_df = new_pupil_data_df.join(attendance_df, on="Attendance", how="left")
new_pupil_data_df = new_pupil_data_df.join(status_df, on="Status", how="left")



