#!/bin/bash 
#This script is to be run in a folder containing the unzipped files. It will create a hosital_compare folder on the server and then copy that folder to HDFS
#load_data_lake.sh transform data files from Medicare and Medicaid center and load into HDFS 
#remember to do chmod 755
#<filename> in order to allow shell to execute to execute type
#./<filename>


mkdir /data/hospital_compare
chmod 777 /data/hospital_compare

tail -n +2 "Hospital General Information.csv" > /data/hospital_compare/hospitals.csv
cp "Hospital General Information.csv" /data/hospital_compare/hospitals_raw.csv

tail -n +2 "Timely and Effective Care - Hospital.csv" > /data/hospital_compare/effective_care.csv
cp "Timely and Effective Care - Hospital.csv" /data/hospital_compare/effective_care_raw.csv

tail -n +2 "Readmissions and Deaths - Hospital.csv" > /data/hospital_compare/readmissions.csv
cp "Readmissions and Deaths - Hospital.csv" /data/hospital_compare/readmissions_raw.csv

tail -n +2 "Measure Dates.csv" > /data/hospital_compare/measures.csv
cp "Measure Dates.csv" /data/hospital_compare/measures_raw.csv

tail -n +2 "HCAHPS - Hospital.csv" > /data/hospital_compare/hcahps_data.csv
cp "HCAHPS - Hospital.csv" /data/hospital_compare/hcahps_survey.csv

hdfs dfs -put /data/hospital_compare /user/w205/

