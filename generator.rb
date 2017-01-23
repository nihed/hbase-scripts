require 'java'
require 'net/http'

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.TableName
import org.apache.hadoop.hbase.client.Connection
import org.apache.hadoop.hbase.client.ConnectionFactory
import org.apache.hadoop.hbase.client.Table
import org.apache.hadoop.hbase.client.Put
import org.apache.hadoop.hbase.util.Bytes

o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten

config =  HBaseConfiguration.create()
connection = ConnectionFactory.createConnection(config);

table = connection.getTable(TableName.valueOf("t"))
fam = Bytes.toBytes("f")
col = Bytes.toBytes("col")
i=0
while true

  string = (0...50).map { o[rand(o.length)] }.join
  key = Bytes.toBytes(string)
  val = Bytes.toBytes(string*1000)
  put = Put.new(key)
  put.add(fam, col, val)
  table.put(put)
  i=i+1
  if i%10000 == 0
    print "#{i} #{string}  \n"
  end
end
