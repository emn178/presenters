class PostPresenter < Presenter
  def title
    super || 'No Title'
  end

  def poster
    if user.nil?
      'No Poster'
    else
      present(user).name
    end
  end
end
