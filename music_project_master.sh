# Create data
echo "Preparing to execute python scripts to generate data..."

rm -r /home/acadgild/example/music/data/web

rm -r /home/acadgild/example/music/data/mob

mkdir -p /home/acadgild/example/music/data/web

mkdir -p /home/acadgild/example/music/data/mob

python /home/acadgild/example/music/generate_web_data.py
python /home/acadgild/example/music/generate_mob_data.py

echo "Data Generated Successfully !"

# Call Stop start daemon scripts to start hadoop daemons

echo "Starting the daemons...."
#sh start-daemons.sh

# run jps commands to check the daemons

jps

echo "All hadoop daemons started !"

echo "Upload the look up tables now in Hbase..."

#sh populate-lookup.sh

echo "Done with data population in look up tables !"

echo "Lets do some data formatting now...."

sh dataformatting.sh

echo "data formatting complete !"

echo "Creating hive tables on top of hbase tables for data enrichment and filtering..."

sh data_enrichment_filtering_schema.sh

echo "Hive table with Hbase Mapping Complete !"

echo "Let us do data enrichment as per the requirement..."

sh data_enrichment.sh

echo "Data Enrichment Complete"


echo "Lets run some use cases now..."

sh data_analysis.sh

echo "USE CASES COMPLETE !!"

















