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

  print scrap_it.get_depts
  print scrap_it.get_names
  print scrap_it.get_emails

  CSV.open("../../db/scrapped_data.csv", "w") do |csv|
    csv << scrap_it.get_depts
    csv << scrap_it.get_names
    csv << scrap_it.get_emails
  end
end

csv_adding
