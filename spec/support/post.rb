class Post
  attr_accessor :title, :content

  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end
end
