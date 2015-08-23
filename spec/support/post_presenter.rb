class PostPresenter < Presenter
  def title
    super || 'No Title'
  end
end
