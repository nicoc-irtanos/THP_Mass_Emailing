require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"
require 'csv'
load "scrapper.rb"

def json_adding
  scrap_it = Scrapper.new
  scrap_it.perform
  tempHash = {
      "name" => scrap_it.get_names,
      "department" => scrap_it.get_depts,
      "email" => scrap_it.get_emails
  }
  File.open("../../db/scrapped_data.json","w") do |f|
    f.write(JSON.pretty_generate(tempHash))
  end
end
json_adding