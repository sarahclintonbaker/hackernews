

class Post

  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id, comments = [])
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = comments
  end

  def to_s
    puts "TITLE: #{title}".colorize(:blue) 
    puts "URL: #{url}".red.underline
    puts "This post got #{points} on Hacker News and has an item id of #{item_id}.".colorize(:magenta)
    puts " Would you like to see of list of comments? y/n ".green.blink
  end

end

