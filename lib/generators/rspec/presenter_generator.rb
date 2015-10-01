module Rspec
  module Generators
		class PresenterGenerator < ::Rails::Generators::NamedBase
		  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

		  def create_presenter_test
		    template 'presenter_spec.rb', File.join('spec/presenters', class_path, "#{file_name}_presenter_spec.rb")
		  end
		end
	end
end
