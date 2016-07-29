module Authentication
  def signed_in?
    session[:signed_in]
  end

  def current_user
    session[:user]
  end
end
