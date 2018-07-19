# encoding: UTF-8
#TODO faire le parser du csv pour obtenir un array des email
#ajouter au csv la colone des handles twitter

require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load('../../.env')

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_KEY_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

# input all the names here or grab them from your database or somewhere else.
# créer un tableau avec l'array de commune en ajoutant devant "mairie"
names = CSV.read('../../db/scrapped_data.csv')[1].map{|x| "mairie " + x}

user = []
names.each do |name|
  if client.user_search(name)[0] == nil
    puts client.user_search(name)[0]
    user << " "
  else
   user << client.user_search(name)[0].name
   puts client.user_search(name)[0].name
  end
end 

# Ajoute l'array de compte twitter au csv
CSV.open('../../db/scrapped_data.csv',"ab") do |csv| 
 csv << user
end

