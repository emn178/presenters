module Presenters
  module Model
    def presenter
      @presenter = Helper.present(self) if @presenter.nil?
      @presenter
    end
  end
end
