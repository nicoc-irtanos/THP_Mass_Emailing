# frozen_string_literal: true

require 'twitter'
require 'dotenv'
require 'csv'

class Follower
  Dotenv.load('.env')

  def connect
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_KEY_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
    @client
  end

  def handle
    # lis la 4 ème colone  dans le fichier csv et l'ajoute dans un tableau
    @user = []
    CSV.foreach('./db/scrapped_data.csv') { |row| @user << row[3] }
  end

  def follow_method
    list = []
    # créer une liste de handle valide
    # n'ajoute pas les handle vides
    @user.each do |user|
      # if user = " ", à l'origine
      # car lorsque l'on a créer le csv,
      # on faisait comme ça lorsque que la recherche ne donnait rien
      # mais pour une raison inconnue c'est des nil dans le csv
      # enfin ça dépend de la personne qui le lance on a l'impression
      if user == " " || nil
        puts "user doesn't exist"
      else
        puts user
        list << user
      end
    end

    list.each do |commune|
      @client.follow(commune)
      puts commune
    end
  end

  def boucle
    connect
    handle
    follow_method
  end
end
