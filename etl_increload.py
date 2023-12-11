import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.functions import lit, col, when, coalesce, udf
from pyspark.sql.types import StructType, StringType, IntegerType, DateType

spark = SparkSession.builder.getOrCreate()


# Connect to MS SQL database
jdbc_url = "jdbc:sqlserver:localhost:<port>;databaseName=newglobe"
jdbc_driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
properties = {"user": "admin", "password": "admin"}

# Read the pupil data from the CSV file
pupil_details_df = spark.read.csv(
    path="pupil_details.csv", header=True, inferSchema=True, schema=StructType([
        pyspark.sql.types.StructField("SnapshotDate", DateType(), True),
        pyspark.sql.types.StructField("AcademyName", StringType(), True),
        pyspark.sql.types.StructField("PupillD", IntegerType(), True),
        pyspark.sql.types.StructField("FirstName", StringType(), True),
        pyspark.sql.types.StructField("MiddleName", StringType(), True),
        pyspark.sql.types.StructField("LastName", StringType(), True),
        pyspark.sql.types.StructField("Status", StringType(), True),
        pyspark.sql.types.StructField("GradeName", StringType(), True),
        pyspark.sql.types.StructField("Stream", StringType(), True)
    ])
)

# Read the existing data from the necessary lookup tables
status_df = spark.read.table("status")
grade_df = spark.read.table("grade")
academy_df = spark.read.table("academy")
attendance_df = spark.read.table("attendance")
steam_df = spark.read.table("stream")


# Define UDFs for referencing foreign key IDs
def lookup_status_id(Status):
    return status_df.filter(col("Status") == Status).select("StatusID").first()["StatusID"]

def lookup_grade_id(GradeName):
    return grade_df.filter(col("GradeName") == GradeName).select("GradesID").first()["GradesID"]

def lookup_academy_id(AcademyName):
    return academy_df.filter(col("AcademyName") == AcademyName).select("AcademyID").first()["AcademyID"]

def lookup_grade_id(StreamName):
    return grade_df.filter(col("StreamName") == StreamName).select("StreamID").first()["StreamID"]

def lookup_academy_id(Attendance):
    return academy_df.filter(col("Attendance") == Attendance).select("AttendanceID").first()["AttendanceID"]


# Lookup and add foreign key IDs to the pupil dataframe
pupil_details_df = pupil_details_df.withColumn("StatusID", udf(lookup_status_id)(col("Status")))
pupil_details_df = pupil_details_df.withColumn("GradesID", udf(lookup_grade_id)(col("GradeName")))
pupil_details_df = pupil_details_df.withColumn("AcademyID", udf(lookup_academy_id)(col("AcademyName")))
pupil_details_df = pupil_details_df.withColumn("StreamID", udf(lookup_grade_id)(col("StreamName")))
pupil_details_df = pupil_details_df.withColumn("AttendanceID", udf(lookup_academy_id)(col("Attendance")))

# Read the existing pupil data from the MS SQL database
existing_pupil_df = spark.read \
    .option("url", jdbc_url) \
    .option("driver", jdbc_driver) \
    .option("dbTable", "pupil") \
    .option("properties", properties) \
    .load()

# Identify new pupils and updates
new_pupils_df = pupil_details_df.exceptAll(existing_pupil_df)
updated_pupils_df = pupil_details_df.join(existing_pupil_df, on="PupillD").where(
    col("SnapshotDate") > col("ExistingSnapshotDate")
)

# Prepare the data for upsert
new_pupils_df = new_pupils_df.withColumn("ExistingSnapshotDate", lit(None))
updated_pupils_df = updated_pupils_df.withColumn("ExistingSnapshotDate", col("SnapshotDate"))

# Combine new and updated pupils
upsert_df = new_pupils_df.unionAll(updated_pupils_df)

upsert_df.write \
    .option("url", jdbc_url) \
    .option("driver", jdbc_driver) \
    .option("dbTable", "pupil") \
    .option("properties", properties) \
    .mode("append") \
    .save()
    