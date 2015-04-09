require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'
require_relative 'hackernewsscraper'

user_website = ARGV[0]
scraper = WebScraper.new(user_website)
puts scraper.create_post
puts "Would you like to see comments? y/n"
user_response = STDIN.gets.chomp
  if user_response == 'y'
    puts scraper.create_comment
  end 
