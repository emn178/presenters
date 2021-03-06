class Post
  include Presenters::Model

  attr_accessor :title, :content, :user

  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end
end
