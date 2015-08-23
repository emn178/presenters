# Presenters

A simple presenter pattern for ruby. It can work in rails. This is based on [Presenters in Rails](http://nithinbekal.com/posts/rails-presenters/)

[![Build Status](https://api.travis-ci.org/emn178/presenters.png)](https://travis-ci.org/emn178/presenters)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'presenters'
```

And then execute:

    bundle

Or install it yourself as:

    gem install presenters

For rails, add this config in `config/application.rb`
```ruby
config.autoload_paths += %W(#{config.root}/presenters)
```
And you can put presenters in `app/presenters`

## Usage

### Create presenter class
Assume you have a class named Post, you can create PostPresenter.
```ruby
class PostPresenter < Presenter
  def title
    super || 'No Title'
  end
end
```
And you can wrap object like this:
```ruby
post = Post.new :title => nil, :content => "My Content"
presenter = PostPresenter.new post
presenter.title # "No Title"
# delegate to Post
presenter.content # "My Content"
```
You can use `present` and `present_each` method to wrap objects. It will find presenter class in the prefix. (eg. Post => PostPresenter)
```ruby
present(@post) do |post|
  # do something...
end

present_each(@posts) do |post|
  # do something...
end
```
You can specify presenter, too.
```ruby
present(@post, CustomPresenter) do |post|
  # do something...
end

present_each(@posts, CustomPresenter) do |post|
  # do something...
end
```
You can use the helper in the view in rails application.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/presenters  
Author: emn178@gmail.com
