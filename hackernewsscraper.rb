class WebScraper  

    def initialize(website)
      @website = website
      @@doc = Nokogiri::HTML(open(website))
    end

  def create_post
    title = find_title
    url = find_url
    points = find_points
    item_id = find_item_id
    comments = create_comment
    Post.new(title, url, points, item_id, comments)
  end


  def create_comment
    commenters = find_commenter_name
      comments = find_commenter_text
      comment_objects = []
      i = 0
      while i< commenters.size
        temp_data = Comment.new(commenters[i], comments[i])
        i += 1
        comment_objects << temp_data
    end
    comment_objects
  end

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

end