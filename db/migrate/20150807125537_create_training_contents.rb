class CreateTrainingContents < ActiveRecord::Migration
  def change
    create_table :training_contents do |t|
      t.string :name
      t.references :trainer, index: true
      t.text :content
      t.string :purpose
      t.string :sports_type
      t.string :image
      t.string :lengths
      t.string :content
      t.integer :price

      t.timestamps 
      t.index [:user_id, :created_at]
      
    end
  end
end
