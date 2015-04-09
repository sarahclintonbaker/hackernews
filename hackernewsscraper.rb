require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'


class WebScraper

  class << self

  @@article = 'https://news.ycombinator.com/item?id=9342369'

  @@doc = Nokogiri::HTML(open(@@article))   

    def find_title
      @@doc.search('.title').text
    end

    def find_url
      @@doc.search('.title a').map {|link| link['href'] }.first
    end

    def find_points
      @@doc.search('.subtext .score').text
    end

    def find_item_id
      raw_data = @@doc.search('.subtext a').map {|a| a['href'] }
      user_id = raw_data[1][8..-1]
    end

    def find_commenter_text
      comment = @@doc.search('.comment > font:first-child').map { |font| font.inner_text}
      
    end

    def find_commenter_name
      @@doc.search('.comhead > a:first-child').map { |element|element.inner_text}
    end

    def add_comment(comment)
      @comments << comment
    end

    def create_comment
      commenters = self.find_commenter_name
      comments = self.find_commenter_text
      comment_objects = []
      i = 0
      while i< commenters.size
        temp_data = Comment.new(commenters[i], comments[i])
        i += 1
        comment_objects << temp_data
      end
      comment_objects
    end

    def create_post
      title = self.find_title
      url = self.find_url
      points = self.find_points
      item_id = self.find_item_id
      comments = self.create_comment
      Post.new(title, url, points, item_id, comments)
    end

  end

end

puts WebScraper.create_post
