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
### Helpers
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
You can use presenters to convert object array to presenters array
```ruby
presenters(@posts).each_with_index do |post, index|
  # do something...
end
```
You can use the helper in the view in rails application.

### Use Presenters in Presenter
If you want to use other presenters in the presenter. You can use following methods:
```ruby
class UserPresenter < Presenter
  def name
    super || "Anonymous"
  end
end

class PostPresenter < Presenter
  def poster
    # You want to use UserPresenter and get its name here.
  end
end

# method 1
present(user).name

# method 2
UserPresenter.new(user).name

# method 3, if user is a ActiveRecord::Base
user.presenter.name
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/presenters  
Author: emn178@gmail.com
