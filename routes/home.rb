class Iroh < Sinatra::Application
  get "/" do
    erb :home
  end
end
