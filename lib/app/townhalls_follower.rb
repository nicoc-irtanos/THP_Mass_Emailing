class Follower
  require 'twitter'
  require 'dotenv'
  require './townhalls_adder_to_db.rb'
  def initialize(user)
    @user = user
  end

  def connect
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_KEY_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
    @client
  end

  def follow
    handle = []
    @user.each do |user|
      if user == " "
        puts "user doesn't exist"
      else
        puts "@" + user.name
        handle << "@" + user.name
      end
    end

    handle.each do |commune|
      @client.follow(commune)
    end
  end
end
var = Follower.new(Scapper_twitter.new.user)
puts Scapper_twitter.new.user.class
var.connect
var.follow
