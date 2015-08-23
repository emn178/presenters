require "presenters/version"
require "presenters/helper"
require "presenters/model"
require "presenters/presenter"

module Presenters
  if defined?(::Rails::Engine)
    class Engine < ::Rails::Engine
      initializer "presenters" do
        ActiveSupport.on_load(:action_view) do
          include Presenters::Helper
        end
        Presenter.include ActionView::Helpers
        Presenter.include Rails.application.routes.url_helpers
        ActiveRecord::Base.include Presenters::Model
      end
    end
  end
end
Presenter = Presenters::Presenter
