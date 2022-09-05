class CreateFridges < ActiveRecord::Migration[6.1]
  def change
    create_table :fridges do |t|
      t.integer :user_id, null: false
      t.integer :food_id, null: false
      t.decimal :amount, null: false
      t.timestamps
    end
  end
end
