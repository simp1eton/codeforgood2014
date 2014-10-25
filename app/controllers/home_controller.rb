require 'net/https'
require 'uri'
require 'open-uri'
require 'mysql'

class HomeController < ApplicationController
  def index
  
  con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
  rs = con.query('SELECT * FROM Votes')
  rows = rs.num_rows
  @scores = []
  rows.times do
    @scores.append(rs.fetch_row)
  end


#    file = File.read('public/test.json')
#    ret = JSON.parse(file)
#    tmp = ret[0];
#    puts tmp
    #req = Request.new
    #req.unique_key = tmp["unique_key"]
    #puts req.inspect
#    puts tmp["unique_key"]
#    req = Request.create(unique_key: 12345)
    #req.save
    #req.save
    #puts req
    #req = Request.new
    #puts Request.all
  #  for tmp in ret
  #    puts tmp
      #req = Request.new
      #req['unique_key'] = 1
      #req.save
      #req.stored_data = tmp
      #req.save
  #  end

    #ret = JSON.load(open("https://data.ct.gov/resource/hma6-9xbg.json?category=Fruit&item=Peaches"))
    #puts ret.size
    #for tmp in ret
    #  puts tmp["created_date"]
    #end
    #SODA::Client.new({:domain="explore.data.gov", :app_token => 'TestApp12345'})
    #client = SODA::Client.new({:domain => "http://data.cityofnewyork.us/resource/", :app_token => "ndARAhp1btjZWLyHOU2Cc8fyz"})
    #response = client.get("erm2-nwe9.json")
    #puts response
  #  render :text => Request.all
    #uri = URI.parse(sodaUrl)
    #http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(uri.request_uri)

    #response = http.request(request)
    #puts response.body
  end
  def update
    #puts params
    con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
    rs = con.query('UPDATE Votes SET votes=votes+1 WHERE id=' + params['vote_id'].to_s)
    rs = con.query('SELECT * FROM Votes WHERE id=' + params['vote_id'].to_s)
    render :text => params['vote_id'].to_s + ' ' + rs.fetch_row[1].to_s#'1 1024'  
  end
end
