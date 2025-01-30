#!/usr/bin/env bash

cd res && cat * | tar -xvz && cd ..

mkdir -pv ready
python src/fix_csv.py res/yelp_academic_dataset_tip.csv ready/yelp_academic_dataset_tip.csv
cat res/yelp_academic_dataset_business.json | awk -f src/fix_json.awk > ready/yelp_academic_dataset_business.json
cp res/yelp_academic_dataset_checkin.json ready/

export PATH="/usr/gide/sbt-1.3.13/bin/:$PATH"

sbt clean compile
sbt run
