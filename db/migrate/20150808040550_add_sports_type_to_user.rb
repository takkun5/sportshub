class AddSportsTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :sports_type, :string
  end
end
