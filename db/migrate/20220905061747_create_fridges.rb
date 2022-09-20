class CreateFridges < ActiveRecord::Migration[6.1]
  def change
    create_table :fridges do |t|
      t.integer :user_id, null: false
      t.string :food_name, null: false
      t.integer :genre, null: false
      t.decimal :amount, null: false
      t.string :unit, null: false
      t.timestamps
    end
  end
end
