require "presenters/version"
require "presenters/presenter"
require "presenters/helper"

module Presenters
  if defined?(::Rails::Engine)
    class Engine < ::Rails::Engine
      initializer "presenters" do
        ActiveSupport.on_load(:action_view) do
          include Presenters::Helper
        end
        Presenter.include ActionView::Helpers
        Presenter.include Rails.application.routes.url_helpers
      end
    end
  end
end
Presenter = Presenters::Presenter
