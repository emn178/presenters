class PresenterGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  def create_policy
    template 'presenter.rb', File.join('app/presenters', class_path, "#{file_name}_presenter.rb")
  end

  hook_for :test_framework
end