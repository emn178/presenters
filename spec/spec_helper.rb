$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'presenters'
require 'rspec/its'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each do |file|
  require file
end
