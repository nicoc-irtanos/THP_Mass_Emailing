# encoding: UTF-8

require 'twitter'
require 'dotenv'
Dotenv.load('../../.env')

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_KEY_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

# input all the names here or grab them from your database or somewhere else.
names = ['Dennis Paagman', 'alpeéanlnald.ldateuletiadt', 'Github']
user = []
names.each do |name|
  if client.user_search(name)[0] == nil
    user << " "
  else
   user << client.user_search(name)[0]
  end
end

user.each do |user|
  if user == " "
    puts "user doesn't exist"
  else
    puts user.name
  end
end


