from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Projet InfoD").config("spark.jars", "postgresql-42.7.5.jar").getOrCreate()

# Charger les données
tip = spark.read.csv("yelp_academic_dataset_tip.csv", header=True, inferSchema=True)
business = spark.read.json("yelp_academic_dataset_business.json")
checkin = spark.read.json("yelp_academic_dataset_checkin.json")
reviews = spark.read.jdbc("jdbc:postgresql://stendhal:5432/tpid2020", "yelp.review", properties={"user": "tpid", "password": "tpid", "driver": "org.postgresql.Driver"})

# Transformer les données
