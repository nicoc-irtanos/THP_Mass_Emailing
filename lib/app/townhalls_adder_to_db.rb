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

  def scrap(client)
    col_data = []
    # prend la 2 ème colone du csv et la met dans le tableau col_data
    CSV.foreach('../../db/scrapped_data.csv') { |row| col_data << row[1] }
    puts col_data
    # Pour chaque élément de col data on ajoute mairie devant
    names = col_data.map{ |x| "mairie " + x }
    @user = []
    # on itère ce second tableau
    names.each do |name|
      sleep 1
      # on utilise client.user_search pour rechercher le name sur twitter
      # On prend le premier résultat
      first_result = client.user_search(name)[0]
      # Si ce résultat est nil on ajoute un " " au tableau
      if first_result.nil?
        puts " "
        @user << " "
      else
        # sinon on ajoute le screen_name (le handle)
        # et on affiche le name
        @user << first_result.screen_name
        puts first_result.name
      end
    end
    @user
  end

  def write(user)
    fucking_ancien_csv = []
    # on prend le csv, on prend chaque ligne
    # et on la met dans un nouveau tableau
    CSV.foreach('../../db/scrapped_data.csv') do |row|
      fucking_ancien_csv << row
    end
    # on ouvre en écriture le csv
    # auquel on ajoute l'élément x de l'ancien tableau
    # et l'élément x du second tableau
    # cela permet d'écrire une ligne dans le csv
    # qui contient à la fois l'ancien tableau et le second tableau
    # bref on ajoute une colone
    csv = CSV.open("../../db/scrapped_data.csv", "w")
    for x in 0..(fucking_ancien_csv.length - 1)
      csv << [fucking_ancien_csv[x], user[x]].flatten
      puts [fucking_ancien_csv[x], user[x]].flatten
    end
  end

  # lance tout
  def boucle
    write(scrap(connect))
  end
end
Scapper_twitter.new.boucle
