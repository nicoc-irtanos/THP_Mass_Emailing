# encoding: UTF-8

require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load('../../.env')
class Scapper_twitter
  attr_reader :user
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
    col_data = []
    CSV.foreach('../../db/scrapped_data.csv') {|row| col_data << row[1]}
    puts col_data
    names = col_data.map{|x| "mairie " + x}
    @user = []
      names.each do |name|
        if client.user_search(name)[0] == nil
          puts client.user_search(name)[0]
          @user << " "
        else
        @user << client.user_search(name)[0].screen_name
        puts client.user_search(name)[0].screen_name
        end
      end
      return @user
  end 
  
  def write(user)
    # Ajoute l'array de compte twitter au csv
    i = 0
    fucking_ancien_csv = []
    CSV.foreach('../../db/scrapped_data.csv') do |row| 
     fucking_ancien_csv << row
    end
    csv = CSV.open("../../db/scrapped_data.csv", "a+")  
  for x in 0..(scrap_it.get_depts.length - 1)
    csv << [scrap_it.get_depts[x], scrap_it.get_names[x], scrap_it.get_emails[x]]
  end

  end
  #lance tout
  def boucle
    write(scrap(connect))
  end
end
Scapper_twitter.new.write(["auieaei","aeiaeiaeiiueaei","aiueaiueauiea","aeiuaeiuaie"])
