# frozen_string_literal: true

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"
require 'csv'
require 'dotenv'
Dotenv.load("../../.env")

load "lib/app/scrapper.rb"
load "lib/app/csv_adder.rb"
load "lib/app/townhalls_adder_to_db.rb"
load "lib/app/townhalls_mailer.rb"
load "lib/app/townhalls_follower.rb"
load "lib/views/index.rb"
load "lib/views/done.rb"

Index.new.launch
