class Game < Sequel::Model
  many_to_one :tournament
  many_to_one :white_payer, class: :Player
  many_to_one :black_payer, class: :Player
end
