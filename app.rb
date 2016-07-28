require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/sequel'
require 'active_support'
require 'active_support/core_ext'


class  Iroh < Sinatra::Application
  configure do
    set :erb, layout: :layout

    set :sessions,
        httponly: true,
        secure: production?,
        expire_after: 5.years
  end

  configure :production, :development do
    DB = Sequel.connect('sqlite://db/iroh.db')
  end

  configure :development do
    register Sinatra::Reloader
    DB.loggers << Logger.new(STDOUT)
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'
