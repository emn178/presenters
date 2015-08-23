class UserPresenter < Presenter
  def name
    super || 'No Name'
  end
end
