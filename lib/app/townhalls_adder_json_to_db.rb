# frozen_string_literal: true

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
    client
  end

  # créer un tableau avec l'array de commune en ajoutant devant "mairie"
  # return un tableau
  def scrap(client)
    json = File.read('../../db/scrapped_data.json')
    obj = JSON.parse(json)
    puts obj["name"]
    names = col_data.map{ |x| "mairie " + x }
    @user = []
    names.each do |name|
      if client.user_search(name)[0].nil?
        puts client.user_search(name)[0]
        @user << " "
      else
        @user << client.user_search(name)[0].screen_name
        puts client.user_search(name)[0].screen_name
      end
    end
    @user
  end

  def write(user)
    # Ajoute l'array de compte twitter au csv
    i = 0
    CSV.foreach('../../db/scrapped_data.csv') do |row|
      new_csv = CSV.generate do |new_csv|
        new_csv << row + [user[i]]
        i += 1
      end
      puts new_csv
      CSV.new.open('../../db/scrapped_data.csv', 'w').each do |row|
        row << new_csv
      end
    end
  end

  # lance tout
  def boucle
    write(scrap(connect))
  end
end
Scapper_twitter.new.write(["auieaei", "aeiaeiaeiiueaei", "aiueaiueauiea", "aeiuaeiuaie"])
