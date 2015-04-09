class Comment

  attr_reader :commenter_name, :commenter_text

  def initialize(commenter_name, commenter_text)
    @commenter_name = commenter_name
    @commenter_text = commenter_text
  end

  def to_s
    "User #{commenter_name} says: \n \n #{commenter_text}\n\n"
  end

end