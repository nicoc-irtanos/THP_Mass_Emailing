class Follower
  require 'twitter'
  require 'dotenv'
  require 'csv'
  Dotenv.load('../../.env')
  #la liste des comptes à follow
 
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
    @user = []
    CSV.foreach('../../db/scrapped_data.csv') { |row| @user << row[3] }
    puts @user
  end

  def follow_method
    list = []
    @user.each do |user|
      if user == " "
        puts "user doesn't exist"
      else
        puts user.name
        list <<  user.screen_name
      end
    end


    list.each do |commune|
      @client.follow(commune)
      puts commune
    end
  end

  def boucle 
  var.connect
  var.handle
  var.follow_method
  end

end

var = Follower.new.boucle

