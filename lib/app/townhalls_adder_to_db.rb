# encoding: UTF-8

require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load('../../.env')
class Scapper_twitter
  def connect
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_KEY_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
    return client
  end


  # créer un tableau avec l'array de commune en ajoutant devant "mairie"
  # return un tableau
  def scrap(client)
  names = CSV.read('../../db/scrapped_data.csv')[1].map{|x| "mairie " + x}
  user = []
    names.each do |name|
      if client.user_search(name)[0] == nil
        puts client.user_search(name)[0]
        user << " "
      else
      user << client.user_search(name)[0].screen_name
      puts client.user_search(name)[0].screen_name
      end
    end
    return user
  end 
  
  def write(user)
    # Ajoute l'array de compte twitter au csv
    CSV.open('../../db/scrapped_data.csv',"ab") do |csv| 
    csv << user
    end
  end
  
  def boucle
    write(scrap(connect))
  end
end
Scapper_twitter.new.boucle
