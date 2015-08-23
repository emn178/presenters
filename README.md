# Presenters

A simple presenter pattern for ruby. It also can work in rails. This is based on [Presenters in Rails](http://nithinbekal.com/posts/rails-presenters/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'presenters'
```

And then execute:

    bundle

Or install it yourself as:

    gem install presenters

## Usage

### Create presenter class
Assume you have a class named Post, you can create PostPresenter.
```Ruby
class PostPresenter < Presenter
  def title
    super || 'No Title'
  end
end
```
And you can wrap object like this:
```Ruby
post = Post.new :title => nil, :content => "My Content"
presenter = PostPresenter.new post
presenter.title # "No Title"
# delegate to Post
presenter.content # "My Content"
```
You can use `present` and `present_each` method to wrap objects. It will find presenter class in the same name. (Eq: Post => PostPresenter)
```Ruby
present(@post) do |post|
  # do something...
end

present_each(@posts) do |post|
  # do something...
end
```Ruby
You can specify presenter, too.
```Ruby
present(@post, CustomPresenter) do |post|
  # do something...
end

present_each(@posts, CustomPresenter) do |post|
  # do something...
end
```Ruby
You can use the helper in the view in rails application.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/presenters  
Author: emn178@gmail.com
