#!/usr/bin/env bash

mkdir -pv ready
python src/fix_csv.py res/yelp_academic_dataset_tip.csv ready/yelp_academic_dataset_tip.csv
cat res/yelp_academic_dataset_business.json | awk -f src/fix_json.awk > ready/yelp_academic_dataset_business.json

export PATH="/usr/gide/sbt-1.3.13/bin/:$PATH"

sbt clean compile
sbt run
