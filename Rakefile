namespace :db do
  
  require "sequel"
  DB = Sequel.connect('sqlite://db/iroh.db')

  desc "creates db"
  task :create do
    DB.create_table!(:users) do
      primary_key :id
      column      :email,      :string, null: false
      column      :password,   :string, null: false
      column      :created_at, :timestamps
      column      :updated_at, :timestamps
    end

    DB.create_table!(:tournaments) do
      primary_key :id
      foreign_key :owner_id,      :users, type: :integer
      column      :name,          :string
      column      :current_round, :intiger, default: 0
      column      :created_at,    :timestamps
      column      :updated_at,    :timestamps
    end

    DB.create_table!(:admins) do
      foreign_key :admin_id,      :users
      foreign_key :tournament_id, :tournaments
      column      :created_at,    :timestamps
      column      :updated_at,    :timestamps
      primary_key [:admin_id, :tournament_id]
    end

    DB.create_table!(:players) do
      primary_key :id
      foreign_key :tournament_id,   :tournaments, null:false
      column      :last_name,       :string, null:false
      column      :first_name,      :string, null:false
      column      :points,          :double, null: false
      column      :balance,         :intiger, null: false
      column      :last_played,     :char
      column      :created_at,      :timestamps
      column      :updated_at,      :timestamps
    end

    DB.create_table!(:games) do
      foreign_key :white_id,        :intiger
      foreign_key :black_id,        :intiger
      foreign_key :tournament_id,   :intiger
      column      :round,           :intiger
      column      :reslut_white,    :double
      column      :result_black,    :dobule
      column      :created_at,      :timestamps
      column      :updated_at,      :timestamps
      primary_key [:white_id, :black_id, :tournament_id]
    end
  end

  desc "drop db"
  task :drop do
    DB.drop_table?(:users, :tournaments, :admins, :players, :games)
  end

  desc "reset db"
  task :reset do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
  end
end
