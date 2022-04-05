require 'java'
require 'net/http'

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.TableName
import org.apache.hadoop.hbase.client.Connection
import org.apache.hadoop.hbase.client.ConnectionFactory
import org.apache.hadoop.hbase.client.Table
import org.apache.hadoop.hbase.client.Put
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.hbase.client.HBaseAdmin


config =  HBaseConfiguration.create()
connection = ConnectionFactory.createConnection(config);
admin = connection.getAdmin();
print "------------------\n"
print admin.listTables().length();
print "------------------\n"
listTables = admin.listTables()

for index in 0 ... listTables.size
  families = listTables[index].getColumnFamilies()
  families.each { |x| puts "#{listTables[index].getTableName()} , "+ x.getNameAsString() }
end
