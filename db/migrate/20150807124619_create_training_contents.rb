class CreateTrainingContents < ActiveRecord::Migration
  def change
    create_table :training_contents do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :purpose
      t.string :sports_type
      t.string :image
      t.string :lengths
      t.string :content
      t.integer :price

      t.timestamps null: false
    end
  end
end
