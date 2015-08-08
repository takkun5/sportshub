class AddSpecialityToUser < ActiveRecord::Migration
  def change
    add_column :users, :speciality, :string
  end
end
