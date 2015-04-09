require 'colorize'

class Comment

  attr_reader :commenter_name, :commenter_text

  def initialize(commenter_name, commenter_text)
    @commenter_name = commenter_name
    @commenter_text = commenter_text
  end

  def to_s
    "USER: #{commenter_name}\n COMMENT: #{commenter_text}\n \n".colorize(:blue) 
  end

end