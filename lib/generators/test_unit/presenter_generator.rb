module TestUnit
  module Generators
		class PresenterGenerator < ::Rails::Generators::NamedBase
		  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

		  def create_presenter_test
		    template 'presenter_test.rb', File.join('test/presenters', class_path, "#{file_name}_presenter_test.rb")
		  end
		end
	end
end
