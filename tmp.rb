#!/usr/bin/ruby

require 'mysql'

begin

  file = File.read('public/test.json')
  ret = JSON.parse(file)
 
  con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'

  for a in ret
    str = "INSERT INTO Votes(id,votes) VALUES(" + a["unique_key"].to_s + ",0)"
   # puts str
    con.query(str)
  end

  #con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
  

  #con.query("CREATE TABLE IF NOT EXISTS \
  #      Votes(id INT PRIMARY KEY AUTO_INCREMENT, votes INT)")
#    con.query("INSERT INTO Votes(id,votes) VALUES(1,2)")
  #con.query("INSERT INTO Votes(id,votes) VALUES(2,3)")
   # con.query("INSERT INTO Writers(Name) VALUES('Lion Feuchtwanger')")
   # con.query("INSERT INTO Writers(Name) VALUES('Emile Zola')")
   # con.query("INSERT INTO Writers(Name) VALUES('Truman Capote')")   
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
