class User < Sequel::Model
  plugin :validation_helpers
  one_to_many :owned_tournaments, key: :owner_id, class: :Tournament
  many_to_many :admined_tournaments, left_key: :admin_id,
               right_key: :tournament_id, join_table: :admins

  def validate
    super
    validates_presence :email
    validates_unique :email
    validates_format /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, :email
  end
end
