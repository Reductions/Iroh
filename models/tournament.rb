class Tournament < Sequel::Model
  plugin :validation_helpers
  many_to_one :owner, class: :User
  many_to_many :admins, left_key: :tournament_id, right_key: :admin_id,
               join_table: :admins
  one_to_many :games
  one_to_many :players
end
