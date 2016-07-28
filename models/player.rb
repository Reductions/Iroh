class Player < Sequel::Model
  many_to_one :tournament
  one_to_many :white_games, class: :Game, key: :white_id
  one_to_many :black_games, class: :Game, key: :black_id
end
