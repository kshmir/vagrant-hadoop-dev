mkdir -p downloads

echo "Downloading hadoop"
wget -nc -O downloads/hadoop.tar.gz http://apache.xfree.com.ar/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz

echo "Downloading hive"
wget -nc -O downloads/hive.tar.gz http://apache.xfree.com.ar/hive/hive-0.11.0/hive-0.11.0.tar.gz

echo "Downloading pig"
wget -nc -O downloads/pig.tar.gz http://apache.xfree.com.ar/pig/pig-0.11.1/pig-0.11.1.tar.gz

echo "Downloading hbase"
wget -nc -O downloads/hbase.tar.gz http://apache.xfree.com.ar/hbase/hbase-0.94.11/hbase-0.94.11.tar.gz

cp downloads/hadoop.tar.gz modules/hadoop/files
cp downloads/hive.tar.gz modules/hive/files
cp downloads/pig.tar.gz modules/pig/files
cp downloads/hbase.tar.gz modules/hbase/files
