require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"
require 'csv'
load "scrapper.rb"

def csv_adding
  scrap_it = Scrapper.new
  scrap_it.perform
 
  
  csv = CSV.open("../../db/scrapped_data.csv", "a+")  
  for x in 0..(scrap_it.get_depts.length - 1)
    csv << [scrap_it.get_depts[x], scrap_it.get_names[x], scrap_it.get_emails[x]]
  end
end

csv_adding
