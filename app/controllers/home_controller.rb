require 'net/https'
require 'uri'
require 'open-uri'
require 'mysql'

class HomeController < ApplicationController
  def index
  
  con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
  rs = con.query('SELECT * FROM Votes')
  rows = rs.num_rows
  scores = []
  rows.times do
    scores.append(rs.fetch_row)
  end
  rs = con.query('SELECT descriptor FROM Data WHERE borough = "MANHATTAN"')
  rows = rs.num_rows
  data = []
  rows.times do
    data.append(rs.fetch_row)
  end
  @scores = []
  for i in 0..scores.size do
    @scores.append([scores[i], data[i]])
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
  end
  def update
    #puts params
    con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
    rs = con.query('UPDATE Votes SET votes=votes+1 WHERE id=' + params['vote_id'].to_s)
    rs = con.query('SELECT * FROM Votes WHERE id=' + params['vote_id'].to_s)
    render :text => params['vote_id'].to_s + ' ' + rs.fetch_row[1].to_s#'1 1024'  
  end

  def cities
=begin
    @keys = ['unique_key','created_date','closed_date','agency','agency_name','complaint_type','descriptor','incident_zip','incident_address','street_name','city','status','due_date','borough','latitude','longitude']

    con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
    rs = con.query('SELECT count(*), complaint_type FROM Data WHERE borough = "MANHATTAN" GROUP BY complaint_type ORDER BY count(*) DESC')
    rows = rs.num_rows
    @info = []
    rows.times do
      tmp = rs.fetch_row
      #@info = tmp.size.to_s
      #break
      @info.append(tmp)
    end
    #render :text => @info.size
=end
  end

  def mostRequested
    con = Mysql.new '127.0.0.1', 'root', 'root', 'mydb'
    rs = con.query('SELECT count(*),complaint_type FROM Data WHERE (incident_zip = 10018 OR incident_zip = 10001) GROUP BY complaint_type ORDER BY count(*) DESC')
    rows = rs.num_rows
    @info = []
    rows.times do
      tmp = rs.fetch_row
#@info = tmp.size.to_s
#break
      @info.append(tmp)
    end
    render :text => @info

  end
  end

