class Iroh < Sinatra::Application
  get "/signup" do
    redirect '/' if signed_in?
    erb :signup
  end

  post "/signup" do
    redirect '/' if signed_in?
    if user = create_user
      session[:signed_in] = true
      session[:user] = user.email
      erb "You have succesfuly created account with email: <b>#{user.email}<b>"
    else
      @error = @error.join("<br\>")
      erb :signup
    end
  end
end
