class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name, null: false
      t.integer :genre, null: false, default: 0
      t.string :unit, null: false
      t.integer :weight_per_unit, null: false
      t.timestamps
    end
  end
end
