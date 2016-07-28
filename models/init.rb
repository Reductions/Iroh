require 'sequel'
DB = Sequel.connect('sqlite://db/iroh.db')
Sequel::Model.plugin :timestamps

require_relative 'game'
require_relative 'player'
require_relative 'tournament'
require_relative 'user'
